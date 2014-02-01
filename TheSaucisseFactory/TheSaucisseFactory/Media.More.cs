using CodeFluent.Runtime;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.Configuration;
using System.Web;
using System.Reflection;

namespace TheSaucisseFactory
{
    /// <summary>
    /// Complément de la classe Media
    /// </summary>
    public partial class Media
    {
        #region Constantes à utiliser pour la construction de la valeur Origine

        public const string OrigineUser = "User";
        public const string OrigineSynchro = "Synchro";
        public const string OrigineImageBrowserCtl = "ImageBrowserCtl";
        public const char OrigineSeparator = '/';

        #endregion

        /// <summary>
        /// Reference originale du média ( si il a été téléchargé)
        /// </summary>
        public string ImageSourceUrl { get; set; }

        /// <summary>
        /// Sauvegarde cette instance de Media en le marquant comme issue du contrôle texte riche
        /// </summary>
        public void SaveAsImageBrowserCtlMedia()
        {
            Origine = OrigineImageBrowserCtl;
            Save();
        }

        /// <summary>
        /// Indique si ce média est dispo pour être utilisé dans l'éditeur texte riche du contenu spécifié
        /// <remarks>Ce média peut ne pas avoir de propriétaire</remarks>
        /// </summary>
        /// <param name="p_proprietaireId">Id de l'éventuel Contenu pour lequel on souhaite utiliser ce média</param>
        /// <returns>true si utilisable, false sinon</returns>
        public bool IsAllowedForRichText(Guid? p_proprietaireId)
        {
            // Si pas d'origine, c'est que le média est libre
            if (string.IsNullOrEmpty(Origine))
            {
                return true;
            }

            // Analyse de l'origine...
            string[] l_parts = Origine.Split(OrigineSeparator);

            // ça doit venir de l'éditeur texte riche
            if (l_parts.Length > 0 && !l_parts[0].Equals(OrigineImageBrowserCtl))
            {
                return false; // Sinon, pas dispo
            }

            // Plus rien ne s'oppose à l'utilisation de ce média
            return true;
        }

        /// <summary>
        /// Indique si ce média est dispo pour être relié au contenu spécifié
        /// Par exemple, pour être utilisé un éditeur texte riche de ce contenu ou attaché comme une pièce-jointe.
        /// <remarks>Ce média peut ne pas avoir de propriétaire</remarks>
        /// </summary>
        /// <param name="p_proprietaireId">Id de l'éventuel Contenu pour lequel on souhaite utiliser ce média</param>
        /// <returns>true si utilisable, false sinon</returns>
        public bool IsAllowedForProperty(Guid? p_proprietaireId)
        {
            // Si pas d'origine, c'est que le média est libre
            if (string.IsNullOrEmpty(Origine))
            {
                return true;
            }

            // Il y a une Origine, on y jette un oeil...
            string[] l_parts = Origine.Split(OrigineSeparator);

            // Si ça ne vient pas d'un utilisateur,
            if (l_parts.Length > 0 && !l_parts[0].Equals(OrigineUser))
            {
                return false; // alors, le media n'est pas dispo
            }

            // Plus rien ne s'oppose à l'utilisation de ce média
            return true;
        }
        /// <summary>
        /// Met à jour le fichier encapsulé dans ce média.
        /// Le fichier est téléchargé en envoyant une requête HTTP.
        /// </summary>
        /// <param name="p_url">URL HTTP de téléchargement du fichier</param>
        /// <param name="p_lastModificationDate">Date de dernière modification du fichier</param>
        public void UpdateFichierFromUrl(string p_url, DateTime p_lastModificationDate)
        {
            // Envoyer une requête HTTP pour récupérer la ressource
            HttpWebRequest l_request = (HttpWebRequest)WebRequest.Create(p_url);
            l_request.Timeout = 10000; // 10 secondes
            HttpWebResponse l_response = (HttpWebResponse)l_request.GetResponse();


            if (string.IsNullOrEmpty(Nom))
            {
                //Recuperation du Nom de fichier 
                var l_filename = l_response.ResponseUri.Segments.LastOrDefault();
                if (string.IsNullOrEmpty(l_filename))
                    Nom = "NoName";
                else
                    Nom = l_filename;
            }


            // Encapsuler dans le média les octets de la nouvelle ressource
            Fichier.Save(CodeFluentContext.Get(Constants.TheSaucisseFactoryStoreName),
                l_response.GetResponseStream(),
                Nom,
                l_response.ContentLength,
                l_response.ContentType,
                p_lastModificationDate,
                DateTime.MinValue,
                DateTime.MinValue,
                FileAttributes.Normal);

            l_response.Close();

            //Assignation de la source 
            this.ImageSourceUrl = p_url;
        }
    }
}
