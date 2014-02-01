using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.UI;
using CodeFluent.Runtime;
using CodeFluent.Runtime.Model;
using CodeFluent.Runtime.Web.UI.WebControls;
using System.Linq;


namespace TheSaucisseFactory.Administration.Code
{
    public partial class EntityBinder : IModelBinder, IModelBinderProvider
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            if (controllerContext == null)
                throw new ArgumentNullException("controllerContext");

            if (bindingContext == null)
                throw new ArgumentNullException("bindingContext");

            EntityDescriptor ed = ProjectDescriptor.Current.GetEntityDescriptor(bindingContext.ModelType, true);
            ICodeFluentEntity entity;
            if (controllerContext.HttpContext.Request.HttpMethod == "POST")
            {
                IDictionary values = GetValues(controllerContext, bindingContext);
                entity = ed.LoadOrCreateInstance(values);
                ed.CopyFrom(entity, values, false);
            }
            else
            {
                entity = ed.CreateInstance();
                ValueProviderResult result = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
                if (result != null)
                {
                    entity.EntityKey = result.AttemptedValue;
                }
            }
            ValidateModel(entity, controllerContext, bindingContext);
            return entity;
        }

        public static void ValidateModel(object model, ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            if (model == null)
                throw new ArgumentNullException("bindingContext");

            if (controllerContext == null)
                throw new ArgumentNullException("controllerContext");

            if (bindingContext == null)
                throw new ArgumentNullException("bindingContext");

            bindingContext.ModelState.Clear();
            foreach (ModelValidationResult result in ModelValidator.GetModelValidator(ModelMetadataProviders.Current.GetMetadataForType(() => model, model.GetType()), controllerContext).Validate(null))
            {
                bindingContext.ModelState.AddModelError(result.MemberName, result.Message);
            }
        }

        public static SelectList BuildList(dynamic viewBag, object model)
        {
            SelectList list = new SelectList(BuildEnumerable(viewBag.EntityTypeName, viewBag.ChoiceMethodName, viewBag.Nullable), ViewPropertyDescriptor.EntityKey, ViewPropertyDescriptor.EntityDisplayName, DataBinder.Eval(model, ViewPropertyDescriptor.EntityKey));
            return list;
        }

        public static SelectList BuildSortedList(dynamic p_viewBag, object p_model)
        {
            IEnumerable l_items = BuildEnumerable(p_viewBag.EntityTypeName, p_viewBag.ChoiceMethodName, p_viewBag.Nullable);
            SelectList l_list = new SelectList(l_items.Cast<object>().OrderBy(o => DataBinder.Eval(o, ViewPropertyDescriptor.EntityDisplayName)), ViewPropertyDescriptor.EntityKey, ViewPropertyDescriptor.EntityDisplayName, DataBinder.Eval(p_model, ViewPropertyDescriptor.EntityKey));
            return l_list;
        }

        private static IEnumerable BuildEnumerable(string entityTypeName, string choiceMethodName, bool nullable)
        {
            if (nullable)
                yield return new { EntityKey = "", EntityDisplayName = "" };

            foreach (object obj in EntityDataSource.GetEnumerable(entityTypeName, choiceMethodName))
            {
                yield return obj;
            }
        }

        /// <summary>
        /// Construit un IEnumerable d'entité du type spécifié en appelant la méthode 
        /// avec le nom et les paramètres spécifiés
        /// </summary>
        /// <param name="p_entityTypeName"></param>
        /// <param name="p_choiceMethodName"></param>
        /// <param name="p_nullable"></param>
        /// <param name="p_params"></param>
        /// <returns>Instance IEnumerable</returns>
        private static IEnumerable BuildEnumerable(string p_entityTypeName, string p_choiceMethodName, bool p_nullable, IOrderedDictionary p_params)
        {
            if (p_nullable)
                yield return new { EntityKey = "", EntityDisplayName = "" };

            foreach (object obj in EntityDataSource.GetEnumerable(p_entityTypeName, p_choiceMethodName, p_params))
            {
                yield return obj;
            }
        }

        public static MultiSelectList BuildMultiList(dynamic viewBag, object model)
        {
            MultiSelectList list = new MultiSelectList(BuildEnumerable(viewBag.EntityTypeName, viewBag.ChoiceMethodName, false), ViewPropertyDescriptor.EntityKey, ViewPropertyDescriptor.EntityDisplayName, BuildSelectedEnumerable(model as IEnumerable));
            return list;
        }

        public static MultiSelectList BuildSortedMultiList(dynamic p_viewBag, object p_model)
        {
            IEnumerable l_items = null;
            if (p_viewBag.RelatedEntityId != null)
            {
                OrderedDictionary l_params = new OrderedDictionary();
                l_params.Add("relatedEntityId", p_viewBag.RelatedEntityId.ToString());
                l_items = BuildEnumerable(p_viewBag.EntityTypeName, p_viewBag.ChoiceMethodName, false, l_params);
            }
            else
            {
                l_items = BuildEnumerable(p_viewBag.EntityTypeName, p_viewBag.ChoiceMethodName, false);
            }

            MultiSelectList l_list = new MultiSelectList(l_items.Cast<object>().OrderBy(o => DataBinder.Eval(o, ViewPropertyDescriptor.EntityDisplayName)), ViewPropertyDescriptor.EntityKey, ViewPropertyDescriptor.EntityDisplayName, BuildSelectedEnumerable(p_model as IEnumerable));

            return l_list;
        }

        private static IEnumerable BuildSelectedEnumerable(IEnumerable selected)
        {
            if (selected == null)
                yield break;

            foreach (object obj in selected)
            {
                yield return DataBinder.Eval(obj, ViewPropertyDescriptor.EntityKey);
            }
        }

        private static IDictionary GetValues(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            Dictionary<string, string> values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            AddValues(values, bindingContext.ValueProvider);
            AddFiles(controllerContext, values);
            return values;
        }

        private static void AddFiles(ControllerContext controllerContext, IDictionary dictionary)
        {
            HttpFileCollectionBase files = controllerContext.HttpContext.Request.Files;
            if (files == null || files.Count == 0)
                return;

            foreach (string key in files.AllKeys)
            {
                dictionary[key] = CodeFluent.Runtime.BinaryServices.BaseBinaryLargeObject.HttpPostedFilePrefix + key;
            }
        }

        private static void AddValues(IDictionary dictionary, object provider)
        {
            var providers = provider as ValueProviderCollection;
            if (providers != null)
            {
                foreach (IValueProvider child in providers)
                {
                    AddValues(dictionary, child);
                }
                return;
            }

            // handle FormCollection
            var nvc = provider as NameValueCollection;
            if (nvc != null)
            {
                foreach (string name in nvc)
                {
                    dictionary[name] = nvc[name];
                }
                return;
            }

            var results = provider as IDictionary<string, ValueProviderResult>;
            if (results != null)
            {
                foreach (var result in results)
                {
                    dictionary[result.Key] = result.Value.AttemptedValue;
                }
                return;
            }
        }

        public IModelBinder GetBinder(Type modelType)
        {
            if (modelType == null)
                return null;

            if (typeof(CodeFluent.Runtime.ICodeFluentEntity).IsAssignableFrom(modelType))
                return this;

            return null;
        }
    }

    public partial class BlobHandlerRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (httpContext == null)
                throw new ArgumentNullException("httpContext");

            return httpContext.Request.RawUrl.IndexOf("blobhandler.ashx", StringComparison.OrdinalIgnoreCase) >= 0;
        }
    }

    public partial class EntityValueProviderFactory : ValueProviderFactory
    {
        public override IValueProvider GetValueProvider(ControllerContext controllerContext)
        {
            return new EntityValueProvider(controllerContext);
        }

        private class EntityValueProvider : NameValueCollection, IValueProvider
        {
            public EntityValueProvider(ControllerContext context)
            {
                AddRange(context.HttpContext.Request.Form);
                AddRange(context.HttpContext.Request.QueryString);
            }

            private void AddRange(NameValueCollection nvc)
            {
                foreach (string name in nvc)
                {
                    // handle MultiSelectList templates
                    const string listSelectedToken = ".list.item.Selected";
                    const string listValueToken = ".list.item.Value";
                    if (name.EndsWith(listSelectedToken))
                    {
                        List<bool> bools = CodeFluent.Runtime.Utilities.ConvertUtilities.SplitToList<bool>(nvc[name], ',');
                        string propertyName = name.Substring(0, name.Length - listSelectedToken.Length);
                        string valueKey = propertyName + listValueToken;
                        List<string> keys = CodeFluent.Runtime.Utilities.ConvertUtilities.SplitToList<string>(nvc[valueKey], ',');
                        int j = 0;
                        StringBuilder sb = new StringBuilder();
                        for (int i = 0; i < keys.Count; i++)
                        {
                            if (bools[j])
                            {
                                if (sb.Length > 0)
                                {
                                    sb.Append(CodeFluentConfiguration.EntityKeyListSeparator);
                                }
                                sb.Append(keys[i]);
                                j++;
                            }
                            j++;
                        }
                        Add(propertyName, sb.ToString());
                        continue;
                    }

                    if (name.EndsWith(listValueToken))
                        continue;

                    Add(name, nvc[name]);
                }
            }

            public bool ContainsPrefix(string prefix)
            {
                if (prefix == null)
                    throw new ArgumentNullException("prefix");

                if (prefix.Length == 0)
                    return true;

                foreach (string key in this)
                {
                    if ((key == null) || (!key.StartsWith(prefix, StringComparison.OrdinalIgnoreCase)))
                        continue;

                    if ((key.Length == prefix.Length) ||
                        (key[prefix.Length] == '.') ||
                        (key[prefix.Length] == '['))
                        return true;
                }
                return false;
            }

            public ValueProviderResult GetValue(string key)
            {
                if (key == null)
                    throw new ArgumentNullException("key");

                string[] values = GetValues(key);
                if (values == null)
                    return null;

                return new ValueProviderResult(values, this[key], CultureInfo.CurrentCulture);
            }
        }
    }
}