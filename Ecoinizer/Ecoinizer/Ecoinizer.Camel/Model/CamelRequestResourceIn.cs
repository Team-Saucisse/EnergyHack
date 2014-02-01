using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Web.Script.Serialization;
using System.Xml.Serialization;

namespace Ecoinizer.Camel.Model.In
{
    [DataContract(Name = "CamelRequestResource")]
    public class CamelRequestResourceIn
    {
        [DataMember]
        public Data data { get; set; }

        public CamelRequestResourceIn() { }

        public bool IsValid()
        {
            return data != null;
        }

        public override string ToString()
        {
            JavaScriptSerializer l_javaScriptSerializer = new JavaScriptSerializer();

            return l_javaScriptSerializer.Serialize(this);
        }
    }

    [DataContract(Name = "CamelRequestResource")]
    public class Data
    {
        public string proto { get; set; }
        public string man { get; set; }
        public string sn { get; set; }
        public Value[] values { get; set; }
    }

    [DataContract(Name = "CamelRequestResource")]
    public class Value
    {
        public string ch { get; set; }
        public Val[] vals { get; set; }
    }

    [DataContract(Name = "CamelRequestResource")]
    public class Val
    {
        public string date { get; set; }
        public double val { get; set; }
        public string dt { get; set; }
    }
}
