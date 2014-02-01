using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheSaucisseFactory.Camel
{
    public class CamelException : Exception
    {
        public string CamelMessage { get; set; }

        public CamelException() : base()
        {

        }

        public CamelException(string p_message) : base(p_message)
        {
            CamelMessage = p_message;
        }

        public CamelException(string p_message, Exception p_ex) : base(p_message, p_ex)
        {
            CamelMessage = p_message;
        }
    }
}