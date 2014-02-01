using System;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading;
using TheSaucisseFactory.Camel.Model;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

namespace TheSaucisseFactory.Camel
{
    public static class CamelService
    {
        //private static readonly log4net.ILog Log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.Name);
        
        /// <summary>
        /// Cette méthode envoie dans un POST HTTP la ressource en paramètre p_postParameters vers l'URL p_url
        /// 
        /// Lève une CamelException si un problème est constaté avec un Message d'erreur significatif
        /// </summary>
        /// <param name="p_url">The url to make an Http POST to</param>
        /// <param name="p_postParameters">The form parameters if any that need to be POSTed</param>
        /// <param name="p_contentType">The Content-Type of the Http request</param>
        public static CamelResponseResource Post(string p_url, string p_postParameters, string p_contentType = "application/json-rpc")
        {
            CamelResponseResource l_response = null;
            HttpWebRequest l_httpWebRequest = CreateHttpWebRequest(p_url, "POST", p_contentType, true);
            ServicePointManager.ServerCertificateValidationCallback = (p_sender, p_certificate, p_chain, p_errors) => true;
            //LogDebug(string.Format("Try to POST request {0}", p_postParameters));
            //LogDebug(string.Format("Try to POST request {0}", p_url));
            var l_requestBytes = GetRequestBytes(p_postParameters);
            l_httpWebRequest.ContentLength = l_requestBytes.Length;

            // Requete et réponse en mode synchrone
            try
            {
                Stream l_requestStream = l_httpWebRequest.GetRequestStream();
                l_requestStream.Write(l_requestBytes, 0, l_requestBytes.Length);
                l_requestStream.Close();

                WebResponse l_webResponse = l_httpWebRequest.GetResponse();
                Stream l_responseStream = l_webResponse.GetResponseStream();

                if (l_responseStream != null)
                {
                    try
                    {
                        StreamReader l_streamReader = new StreamReader(l_responseStream);
                        string l_jsonResponse = l_streamReader.ReadToEnd();
                        l_streamReader.Dispose();

                        //LogDebug("Réponse CAMEL : " + l_jsonResponse);

                        MemoryStream l_memoryStream = new MemoryStream(Encoding.UTF8.GetBytes(l_jsonResponse));

                        DataContractJsonSerializer l_json =
                            new DataContractJsonSerializer(typeof(CamelResponseResource));

                        l_response = l_json.ReadObject(l_memoryStream) as CamelResponseResource;

                        l_memoryStream.Dispose();
                    }
                    catch (Exception l_ex)
                    {
                        //LogError("Deserialize camel response", l_ex);
                        throw new CamelException("Impossible de comprendre la réponse CAMEL", l_ex);
                    }

                    l_responseStream.Close();
                    l_webResponse.Close();
                }
            }
            catch (WebException l_webException)
            {
                // Si le serveur renvoi un 400, la réponse est seulement accessible dans l'exception
                if (l_webException.Response != null)
                {
                    string l_responseStatus = string.Empty;

                    using (StreamReader l_streamReader = new StreamReader(l_webException.Response.GetResponseStream()))
                    {
                        l_responseStatus = l_streamReader.ReadToEnd();
                    }

                    //LogError(string.Format("Réponse du serveur : {0}", l_responseStatus));
					throw new CamelException("Une exception web est survenue " + l_responseStatus);
                   
                }

                l_response = null;
                throw new CamelException("Une exception web est survenue", l_webException);
            }
            catch (Exception l_exception)
            {
                l_response = null;
                throw new CamelException("Une erreur est survenue, code technique : " + l_exception.Message, l_exception);
            }

            if (l_response != null && l_response.error != null)
            {
                // Traitement de l'erreur renvoyée par le serveur CAMEL
                string l_error =
                    string.Format(
                        "Une erreur est survenue sur le serveur CAMEL -> Code : {0} - Data : {1} - Message : {2}",
                        l_response.error.code, l_response.error.data, l_response.error.message);
                //LogError(l_error);
                throw new CamelException(l_error);
            }

            return l_response;
        }

        /// <summary>
        /// Cette méthode envoie dans un POST HTTP la ressource en paramètre p_postParameters vers l'URL p_url
        /// </summary>
        /// <param name="p_url">The url to make an Http POST to</param>
        /// <param name="p_postParameters">The form parameters if any that need to be POSTed</param>
        /// <param name="p_contentType">The Content-Type of the Http request</param>
        public static bool PostIn(string p_url, string p_postParameters, string p_contentType = "application/json-rpc")
        {
            HttpWebRequest l_httpWebRequest = CreateHttpWebRequest(p_url, "POST", p_contentType, false);
            ServicePointManager.ServerCertificateValidationCallback = ValidateServerCertficate;
            //LogDebug(string.Format("Try to POST request {0}", p_postParameters));
            //LogDebug(string.Format("Try to POST request {0}", p_url));
            var l_requestBytes = GetRequestBytes(p_postParameters);
            l_httpWebRequest.ContentLength = l_requestBytes.Length;

            bool l_result = true;

            // Requete et réponse en mode synchrone
            try
            {
                Stream l_requestStream = l_httpWebRequest.GetRequestStream();
                l_requestStream.Write(l_requestBytes, 0, l_requestBytes.Length);
                l_requestStream.Close();

                using (HttpWebResponse l_webResponse = (HttpWebResponse)l_httpWebRequest.GetResponse())
                {
                    // Dans le contexte, on attend simplement un OK pour valider notre requête
                    if (l_webResponse.StatusCode != HttpStatusCode.OK)
                    {
                        // Pas de http 200 donc on est en erreur
                        l_result = false;

                        // On essaie quand même de lire le contenu de la réponse pour la logguer
                        Stream l_responseStream = l_webResponse.GetResponseStream();

                        if (l_responseStream != null)
                        {
                            try
                            {
                                StreamReader l_streamReader = new StreamReader(l_responseStream);
                                string l_responseStatus = l_streamReader.ReadToEnd();
                                l_streamReader.Dispose();

                                string l_error = string.Format("Une erreur est survenue sur le serveur CAMEL :\r\nStatus Code : {0}\r\nRéponse : {1}",
                                    l_webResponse.StatusCode, l_responseStatus);
                                //LogError(l_error);
                            }
                            catch (Exception l_ex)
                            {
                                //LogError("Lecture impossible de la réponse du serveur CAMEL", l_ex);
                            }
                            finally
                            {
                                l_responseStream.Close();
                            }
                        }
                        else
                        {
                            string l_error = string.Format("Une erreur est survenue sur le serveur CAMEL :\r\nStatus Code : {0}",
                                    l_webResponse.StatusCode);
                            //LogError(l_error);
                        }
                    }
                }
            }
            catch (WebException l_webException)
            {
                //LogError("Une exception web est survenue :", l_webException);
                Console.WriteLine(string.Format("Une exception web est survenue : \r\nStatus Code : {0}\r\nMessage : {1}", l_webException.Status, l_webException.Message));

                // Si le serveur renvoi un 400, la réponse est seulement accessible dans l'exception
                if (l_webException.Response != null)
                {
                    try
                    {
                        StreamReader l_streamReader = new StreamReader(l_webException.Response.GetResponseStream());
                        string l_responseStatus = l_streamReader.ReadToEnd();
                        l_streamReader.Dispose();

                        //LogError(string.Format("Réponse du serveur : {0}", l_responseStatus));
                        Console.WriteLine(string.Format("Réponse du serveur : {0}", l_responseStatus));
                    }
                    catch
                    {
                        // Avale volontairement
                    }
                }
                
                l_result = false;
            }
            catch (Exception l_exception)
            {
                //LogError("Une erreur est survenue, code technique : " + l_exception.Message, l_exception);
                l_result = false;
            }

            return l_result;
        }

        private static bool ValidateServerCertficate(object p_sender, X509Certificate p_cert, X509Chain p_chain, SslPolicyErrors p_sslPolicyErrors)
        {
            if (p_sslPolicyErrors == SslPolicyErrors.None)
            {
                // Good certificate
                return true;
            }
            else
            {
                //LogError("SslPolicyErrors : " + p_sslPolicyErrors);
                return false;
            }
        }

        static HttpWebRequest CreateHttpWebRequest(string p_url, string p_httpMethod, string p_contentType, bool p_insertAuthentication)
        {
            var l_httpWebRequest = (HttpWebRequest)WebRequest.Create(p_url);
            l_httpWebRequest.Timeout = int.Parse(ConfigurationManager.AppSettings["CamelWebRequestTimeout"]);
            l_httpWebRequest.ContentType = p_contentType;
            l_httpWebRequest.Method = p_httpMethod;
            l_httpWebRequest.Accept = "application/json-rpc";
            l_httpWebRequest.Headers.Add("Accept-Charset", "UTF-8");

            if (p_insertAuthentication)
            {
                string l_camelServiceUserName = ConfigurationManager.AppSettings["CamelServiceUserName"];
                string l_camelServicePassword = ConfigurationManager.AppSettings["CamelServicePassword"];
                string l_credentials = Convert.ToBase64String(Encoding.ASCII.GetBytes(l_camelServiceUserName + ":" + l_camelServicePassword));
                l_httpWebRequest.Headers.Add("Authorization", "Basic " + l_credentials);
            }
            
            return l_httpWebRequest;
        }

        static byte[] GetRequestBytes(string p_jsonResource)
        {
            return string.IsNullOrEmpty(p_jsonResource) ? new byte[0] : Encoding.UTF8.GetBytes(p_jsonResource);
        }
    }
}