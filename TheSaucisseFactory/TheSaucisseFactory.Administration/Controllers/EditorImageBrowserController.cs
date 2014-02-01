using TheSaucisseFactory;
using Kendo.Mvc.UI;
using Kendo.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using System.Web.Configuration;

namespace TheSaucisseFactory.Administration.Controllers
{
    /// <summary>
    /// Gère des actions relatives au navigateur d'images du contrôle Kendo UI Editor
    /// </summary>
    public class EditorImageBrowserController : Controller
    {
        /// <summary>
        /// Upload une image dans la BDD sous forme d'un média.
        /// L'image a été sélectionnée à partir d'un contrôle Kendo UI Editor.
        /// </summary>
        /// <param name="path">non utilisé</param>
        /// <param name="file">L'image sélectionnée</param>
        /// <returns>Instance d'un JsonResult</returns>
        public ActionResult Upload(string path, System.Web.HttpPostedFileBase file)
        {
            // Contrôler le poids et les dimensions de l'image
            if (!ControlImage(file.InputStream))
            {
                return Json(new { Error = "TODO"}, "text/plain");
            }

            // Créer le média
            Media l_newMedia = new Media()
            {
                Nom = Path.GetFileName(file.FileName)
            };

            l_newMedia.SaveAsImageBrowserCtlMedia();
            l_newMedia.Fichier.SavePostedFile(file);
 
            // Définir la réponse HTTP
            var l_infos = new
            {
                size = file.ContentLength,
                name = l_newMedia.Id.ToString(),
                type = "f"
            };
            
            return Json(l_infos, "text/plain");
        }

        /// <summary>
        /// Retourne une image stockée dans la BDD sous forme d'un média
        /// </summary>
        /// <param name="id">L'identifiant du média</param>
        /// <returns>Instance d'un FileContentResult</returns>
        public ActionResult GetImage(Guid id)
        {
            Media l_media = Media.LoadById(id);
            byte[] l_bytes;
            using (Stream l_stream = l_media.Fichier.GetInputStream())
            {
                l_bytes = new byte[l_stream.Length];
                l_stream.Read(l_bytes, 0, (int)l_stream.Length);
            }
            return File(l_bytes, l_media.Fichier.ContentType);
        }

        /// <summary>
        /// Retourne des informations sur les images de texte riche disponibles pour le contenu 
        /// actuellement en création/modification
        /// </summary>
        /// <param name="path">Inutile</param>
        /// <returns>Instance d'un JsonResult contenant les info des images dispos</returns>
        public JsonResult Read(string path)
        {
            IEnumerable<Media> l_medias = MediaCollection.LoadRichTextAvailableImages(SessionHelper.ContenuInModificationId);
            List<ImageBrowserEntry> l_entries = new List<ImageBrowserEntry>();
            ImageBrowserEntry l_entry;
            foreach (Media l_media in l_medias)
            {
                l_entry = new ImageBrowserEntry()
                {
                    Size = l_media.Fichier.Size,
                    Name = l_media.Id.ToString()
                };

                l_entries.Add(l_entry);
            }

            return Json(l_entries);
        }

        /// <summary>
        /// Retourne la miniature d'une image stockée dans la BDD sous forme de média
        /// </summary>
        /// <param name="path">L'identifiant du média</param>
        /// <returns>Instance d'un FileContentResult contenant la miniature</returns>
        public ActionResult Thumbnail(string path)
        {
            Guid l_mediaId = new Guid(path);
            Media l_media = Media.LoadById(l_mediaId);

            FileContentResult l_fileContentResult;
            IThumbnailCreator l_thumbnailCreator = DI.Current.Resolve<IThumbnailCreator>();
            using (Stream l_stream = l_media.Fichier.GetInputStream())
            {
                ImageSize l_imageSize = new ImageSize();
                l_imageSize.Width = 80;
                l_imageSize.Height = 80;
                ImageSize imageSize1 = l_imageSize;
                l_fileContentResult = base.File(l_thumbnailCreator.Create(l_stream, l_imageSize, l_media.Fichier.ContentType), l_media.Fichier.ContentType);
            }

            return l_fileContentResult;
        }

        /// <summary>
        /// Contrôle le poids et les dimensions d'une image par rapport à des paramètres de configuration
        /// </summary>
        /// <param name="p_stream">
        /// Le flux d'octets de l'image.
        /// La position du curseur n'est pas changée.
        /// </param>
        /// <returns>true si l'image est valide, false sinon</returns>
        private bool ControlImage(Stream p_stream)
        {
            // Contrôler le poids de l'image
            double l_maxWeight = double.Parse(WebConfigurationManager.AppSettings["ImageMaxWeight"]);
            double l_imageWeight = p_stream.Length / 1000d;
            if (l_imageWeight > l_maxWeight)
            {
                return false;
            }

            // Contrôler les dimensions de l'image
            long l_position = p_stream.Position;
            Image l_image = Image.FromStream(p_stream);
            p_stream.Seek(l_position, SeekOrigin.Begin);

            int l_maxHeight = int.Parse(WebConfigurationManager.AppSettings["ImageMaxHeight"]);
            if (l_image.Height > l_maxHeight)
            {
                return false;
            }

            int l_maxWidth = int.Parse(WebConfigurationManager.AppSettings["ImageMaxWidth"]);
            if (l_image.Width > l_maxWidth)
            {
                return false;
            }

            return true;
        }
    }
}
