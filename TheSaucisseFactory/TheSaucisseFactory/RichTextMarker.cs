using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TheSaucisseFactory
{
    /// <summary>
    /// Attribut indiquant qu'une propriété d'un objet est un texte riche
    /// </summary>
    [AttributeUsage(AttributeTargets.Property)]
    class RichTextMarkerAttribute : Attribute
    {
    }
}
