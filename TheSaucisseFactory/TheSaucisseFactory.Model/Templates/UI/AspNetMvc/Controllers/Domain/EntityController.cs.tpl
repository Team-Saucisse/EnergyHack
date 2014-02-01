[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "Controller" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[%@ namespace name="System.CodeDom" %]
[%@ namespace name="System.CodeDom.Compiler" %]
[%@ namespace name="System.Collections.Generic" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Runtime.Model" %]
[%@ namespace name="CodeFluent.Runtime.Utilities" %]
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using CodeFluent.Runtime;
using CodeFluent.Runtime.Model;
using PagedList;
[% 
	// Recherche par Nom activée ?
	bool l_searchEnabled = entity.GetAttributeValue<bool>("searchEnabled", "http://www.c2s.fr/codefluent/uicustomization/betterlife", false);
    
	// Rôles autorisés sur le contrôleur (ou actions du contôleur)
    // chaine de la forme "RoleNiveauContrôleur|Action1:Role1Action1,Role2Action1|Action2:Role1Action2,Role1Action2|..."
    string l_authorizeRolesData = entity.GetAttributeValue<string>("controllerAuthorizedRoles", "http://www.c2s.fr/codefluent/uicustomization/betterlife", string.Empty);

	// On se monte un dico s'y retrouver facilement
            Dictionary<string, string[]> l_authorizeRoles = new Dictionary<string, string[]>();

	if (!string.IsNullOrEmpty(l_authorizeRolesData))
	{
        string[] l_pairs = l_authorizeRolesData.Split('|');
        foreach (string l_pair in l_pairs)
        {
            string[] l_pairValues = l_pair.Split(':');
            if (l_pairValues.Length == 1) // Attribut à positionner sur le controlleur
            {
                l_authorizeRoles.Add("Controller", l_pair.Split(','));
            }
            else if (l_pairValues.Length == 2) // Attribut à positionner sur le controlleur
            {
                l_authorizeRoles.Add(l_pairValues[0], l_pairValues[1].Split(','));
            }
        }
	}
%]
namespace [%=Producer.WebNamespace(entity)%]
{[%
if (l_authorizeRoles.ContainsKey("Controller"))
{%]
	[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Controller"]) + "\""%])][%
}
%]
    public partial class [%=entity.Name%]Controller : Controller
    {[%
		if (!entity.Name.Equals("FicheReference", System.StringComparison.Ordinal)) 
		{
			if (l_authorizeRoles.ContainsKey("Index"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Index"]) + "\""%])][%
			}%]
        public virtual ActionResult Index(string currentFilter, string searchString, int? page)
        {
            // On commence par charger tout
			[%if (l_searchEnabled) 
			{%]// avec un tri par nom 
            PageOptions l_pageOptions = new PageOptions();
            l_pageOptions.OrderByArguments = new OrderByArgumentCollection();
            l_pageOptions.OrderByArguments.Add("[Contenu].[Nom]", System.ComponentModel.ListSortDirection.Ascending);
			[%}%]
			IEnumerable<[%=entity.ClrFullTypeName%]> l_items = [%=entity.ClrFullTypeName%]Collection.[%if (l_searchEnabled)
			{%]PageLoadAll(int.MinValue, int.MaxValue, l_pageOptions);[%} else {%]LoadAll();[%}%]

			[%if (l_searchEnabled) {%]
            // S'il y a une chaine recherchée...
			if (!string.IsNullOrEmpty(searchString))
            {
				// alors, il faut se re-positionner sur la 1ère page
                page = 1;
            }
            else
            {
				// sinon, il suffit de remettre comme chaine l'éventuel filtre courant
                searchString = currentFilter;
            }

			// On sauvegarde le filtre courant
            ViewBag.CurrentFilter = searchString;
			
			// Et on limitte le résultat à ce filtre
			if (!string.IsNullOrEmpty(searchString))
			{
				l_items = l_items.Where(entity => entity.Nom.ToLower().Contains(searchString.ToLower()));
			}
			[%}%]
			
            int pageSize = int.Parse(WebConfigurationManager.AppSettings["ListMaxSize"]);
            int pageNumber = (page ?? 1);
            
            return View("[%=RelativeUrl(entity)%]/Index", l_items.ToPagedList(pageNumber, pageSize));
        }[%
		
		}%]

        public virtual ActionResult Details(string entityKey)
        {
            [%=entity.ClrFullTypeName%] entity = [%=entity.ClrFullTypeName%].LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return new EmptyResult();
			}
				
            return View("[%=RelativeUrl(entity)%]/Details", entity);
        }
		[%
			if (l_authorizeRoles.ContainsKey("Create"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Create"]) + "\""%])][%
			}
		%]
        public virtual ActionResult Create()
        {
            // Sauvegarde de l'url de celui qui demande une création
            TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester = Request.UrlReferrer;
            
            [%=entity.ClrFullTypeName%] entity = new [%=entity.ClrFullTypeName%]();
            return View("[%=RelativeUrl(entity)%]/Create", entity);
        }
		[%
		if (!entity.Name.Equals("LienReferenceSolution", System.StringComparison.Ordinal) &&
			!entity.Name.Equals("ReferenceClef", System.StringComparison.Ordinal))
		{%]
		[HttpPost][%
			if (l_authorizeRoles.ContainsKey("Create"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Create"]) + "\""%])][%
			}
		%]
        public virtual ActionResult Create([%=entity.ClrFullTypeName%] entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("[%=RelativeUrl(entity)%]/Create", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("[%=RelativeUrl(entity)%]/Create", entity);
			}


			// Redirection si possible vers l'Url ayant demandé la modif, sinon, vers l'index
            if (TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester != null)
            {
                return Redirect(TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester.ToString());
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
		[%
		}
		%]
		[%
		if (!entity.Name.Equals("FicheReference", System.StringComparison.Ordinal))
		{
			if (l_authorizeRoles.ContainsKey("Edit"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Edit"]) + "\""%])][%
			}
		%]
        public virtual ActionResult Edit(string entityKey)
        {
            // Sauvegarde de l'url de celui qui demande une modification
            TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester = Request.UrlReferrer;

            [%=entity.ClrFullTypeName%] entity = [%=entity.ClrFullTypeName%].LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return RedirectToAction("Index");
			}
				
            // Stocker en session l'identifiant du marché en modification
            // pour filtrer les images dans le navigateur d'images de l'éventuel éditeur de texte riche
            TheSaucisseFactory.Administration.SessionHelper.ContenuInModificationId = entity.Id;
            return View("[%=RelativeUrl(entity)%]/Edit", entity);
        }[%
		}
		%]
		[%
		if (!entity.Name.Equals("FicheReference", System.StringComparison.Ordinal) &&
			!entity.Name.Equals("LienReferenceSolution", System.StringComparison.Ordinal) &&
			!entity.Name.Equals("ReferenceClef", System.StringComparison.Ordinal))
		{
		%]
		[HttpPost][%
			if (l_authorizeRoles.ContainsKey("Edit"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Edit"]) + "\""%])][%
			}
		%]
        public virtual ActionResult Edit(string entityKey, [%=entity.ClrFullTypeName%] entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("[%=RelativeUrl(entity)%]/Edit", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("[%=RelativeUrl(entity)%]/Edit", entity);
			}

			// Redirection si possible vers l'Url ayant demandé la modif, sinon, vers l'index
            if (TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester != null)
            {
                return Redirect(TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester.ToString());
            }
            else
            {
                return RedirectToAction("Index");
            }
        }[%
		}
		%]

        /// <summary>
        /// Action de suppression de l'élément ayant l'id spécifié
        /// </summary>
        /// <param name="entityKey">Identifiant de l'élément</param>
        /// <returns>Vue index avec éventuelle erreur</returns>
		[%
			if (l_authorizeRoles.ContainsKey("Delete"))
			{%]
		[Authorize(Roles = [%="\"" + string.Join(", ", l_authorizeRoles["Delete"]) + "\""%])][%
			}
		%]
        public virtual ActionResult Delete(string entityKey)
        {
            EntityDescriptor ed = ProjectDescriptor.Current.GetEntityDescriptor(typeof([%=entity.ClrFullTypeName%]), true);
            try
            {
                ed.DeleteByEntityKey(entityKey, null);
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                // cas d'une contrainte d'intégrité violée
                if (e.Message.StartsWith("The DELETE statement conflicted with"))
                {
                    TempData["Error"] = "global::Resources.WebResources.DeleteNotAllowed /" + e.ToString();
                }
                else
                {
                    TempData["Error"] = "global::Resources.WebResources.DBErrorDeleteItem /" + e.ToString();
                }
            }
            return RedirectToAction("Index");
        }

        [%
		IndentedTextWriter iWriter = LineInfoStreamWriter.ToIndentedTextWriter(Writer);
        foreach(VisibleMethod method in GetVisibleMethods(entity))
        {
			CodeTypeDeclaration declaringType;
			CodeMemberMethod codeMethod = method.GetCodeMethod(Producer.ModelProducer, out declaringType);
			if ((codeMethod == null) || (!CodeDomUtilities.IsStatic(codeMethod.Attributes))) continue;
			
			CodeMemberMethod mvcMethod = new CodeMemberMethod();
			mvcMethod.Name = codeMethod.Name;
			mvcMethod.Attributes = MemberAttributes.Final | MemberAttributes.Public;
			mvcMethod.ReturnType = new CodeTypeReference("System.Web.Mvc.ActionResult");
			
			List<CodeExpression> arguments = new List<CodeExpression>();
			bool paged = Helpers.IsPagedMethod(codeMethod);
			int i = 0;
			foreach(CodeParameterDeclarationExpression parameter in codeMethod.Parameters)
			{
				CodeParameterDeclarationExpression copyParameter = new CodeParameterDeclarationExpression();
				copyParameter.Direction = parameter.Direction;
				copyParameter.Name = parameter.Name;
                copyParameter.Type = CodeDomUtilities.Clone(LanguageCode.CSharp, parameter.Type, CodeDomUtilities.CodeCloneMode.TypeArguments);
				mvcMethod.Parameters.Add(copyParameter);
				
				if ((paged) && (i < 2))
				{
					copyParameter.CustomAttributes.Add(new CodeAttributeDeclaration("System.Runtime.InteropServices.OptionalAttribute"));
					CodeAttributeDeclaration defaultValue = new CodeAttributeDeclaration("System.Runtime.InteropServices.DefaultParameterValueAttribute");
					switch(i)
					{
						case 0: // page index
							defaultValue.Arguments.Add(new CodeAttributeArgument(new CodePrimitiveExpression(0)));
							break;

						case 1: // page size
							defaultValue.Arguments.Add(new CodeAttributeArgument(new CodePrimitiveExpression(int.MaxValue)));
							break;
					}
					copyParameter.CustomAttributes.Add(defaultValue);
				}
				
				arguments.Add(new CodeVariableReferenceExpression(copyParameter.Name));
				i++;
			}

			BaseType bt = UserData.GetBaseType(declaringType);
			
			string viewName = null;
			bool details = false;
			if ((method.ReturnTypeName != null) && (Producer.Project.Sets[method.ReturnTypeName] != null))
			{
				viewName = RelativeUrl(entity) + "/List";
			}
			else if ((method.ReturnTypeName != null) && (Producer.Project.Entities[method.ReturnTypeName] != null))
			{
				details = true;
				viewName = RelativeUrl(entity) + "/Details";
			}
			else if (!AssemblyUtilities.IsVoidType(method.ReturnTypeName))
			{
				viewName = "Custom";
			}
			
			if (viewName == null)
			{
				mvcMethod.Statements.Add(new CodeMethodInvokeExpression(new CodeTypeReferenceExpression(bt.ClrFullTypeName), codeMethod.Name, arguments.ToArray()));
				mvcMethod.Statements.Add(new CodeMethodReturnStatement(new CodeObjectCreateExpression("System.Web.Mvc.EmptyResult")));
			}
			else
			{
				CodeVariableDeclarationStatement item = new CodeVariableDeclarationStatement(codeMethod.ReturnType, "item");
				item.InitExpression = new CodeMethodInvokeExpression(new CodeTypeReferenceExpression(bt.ClrFullTypeName), codeMethod.Name, arguments.ToArray());
				mvcMethod.Statements.Add(item);
				
				if (details)
				{
					CodeConditionStatement ifNull = new CodeConditionStatement();
					ifNull.Condition = new CodeBinaryOperatorExpression(
						new CodeVariableReferenceExpression(item.Name),
						CodeBinaryOperatorType.IdentityEquality,
						new CodePrimitiveExpression(null));
	
					ifNull.TrueStatements.Add(new CodeMethodReturnStatement(new CodeMethodInvokeExpression(new CodeThisReferenceExpression(),
						"View", new CodePrimitiveExpression("Custom"), new CodeCastExpression(typeof(object), new CodePrimitiveExpression("No data")))));
					
					mvcMethod.Statements.Add(ifNull);
				}
				
				mvcMethod.Statements.Add(new CodeMethodReturnStatement(new CodeMethodInvokeExpression(new CodeThisReferenceExpression(),
					"View", new CodePrimitiveExpression(viewName), new CodeVariableReferenceExpression(item.Name))));
			}
			CodeDomUtilities.Write(iWriter, mvcMethod, LanguageCode.CSharp);
        }%]
	}
}