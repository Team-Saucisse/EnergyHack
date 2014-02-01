using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace TheSaucisseFactory
{
    public partial class MediaCollection
    {
        /// <summary>
        /// Expression régulère permettant de parser un texte riche pour en extraire 
        /// les ids des médias qu'il embarque
        /// </summary>
        private static Regex m_richTextMediaParser = new Regex(
                @"\<img.+?src=""/EditorImageBrowser/GetImage/(?<mediaId>.+?)""",
                System.Text.RegularExpressions.RegexOptions.Compiled);

        /// <summary>
        /// Retourne les identifiants des médias de type image uploadées via l'éditeur de texte riche
        /// </summary>
        /// <param name="p_richText">Texte riche dans lequel les caractères de la syntaxe HTML ne sont pas encodés</param>
        /// <returns>Une instance IEnumerable des ids de média utilisés</returns>
        private static IEnumerable<Guid> GetArgumentaireImagesId(string p_richText)
        {
            if (p_richText == null)
                p_richText = string.Empty;
            MatchCollection l_matches = m_richTextMediaParser.Matches(p_richText);
            return from Match l_match in l_matches select new Guid(l_match.Groups["mediaId"].Value);
        }

        /// <summary>
        /// Retourne les images disponibles pour l'éditeur texte riche lors
        /// de la création/modification d'un contenu
        /// </summary>
        /// <param name="p_contenuId">Id éventuel du Contenu édité</param>
        /// <returns>Instance de IEnumerable&lt;Media&gt; contenant les images dispos</returns>
        public static IEnumerable<Media> LoadRichTextAvailableImages(Guid? p_contenuId)
        {
            return MediaCollection.LoadAll();
        }

        /// <summary>
        /// Retourne les images disponibles pour être liées à un Contenu (comme Logo par exemple)
        /// </summary>
        /// <param name="p_contenuId">Id éventuel du Contenu édité</param>
        /// <returns>Instance de IEnumerable&lt;Media&gt; contenant les images dispos</returns>
        public static IEnumerable<Media> LoadPropertyAvailableImages(Guid? p_contenuId)
        {
            return MediaCollection.LoadAll();
        }

        /// <summary>
        /// Charge la totalité des médias dans le cadre d'un LoadAll par web service.
        /// </summary>
        /// <returns>Instance de MediaCollection dans laquelle l'Origine des éléments est 
        /// remplacée par l'extension du fichier associé</returns>
        public static MediaCollection ServiceLoadAll()
        {
            MediaCollection l_medias = MediaCollection.LoadAll();
            foreach (Media l_media in l_medias)
            {
                l_media.Origine = l_media.Fichier.FileExtension;
            }

            return l_medias;
        }
    }
}
