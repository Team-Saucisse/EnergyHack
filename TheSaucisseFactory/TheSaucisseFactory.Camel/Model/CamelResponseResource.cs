using System.Web.Script.Serialization;

namespace TheSaucisseFactory.Camel.Model
{
    // ReSharper disable InconsistentNaming
    public class CamelResponseResource
    {
        public string jsonrpc { get; set; }
        public result[] result { get; set; }
        public string id { get; set; }
        public error error { get; set; }

        public override string ToString()
        {
            JavaScriptSerializer l_javaScriptSerializer = new JavaScriptSerializer();
            return l_javaScriptSerializer.Serialize(this);
        }
    }

    public class result
    {
        public string prog { get; set; }
        public string build { get; set; }
        public string lot { get; set; }
        public chs[] chs { get; set; }
    }

    public class chs
    {
        public string type { get; set; }
        public string ctx { get; set; }
        public int ind { get; set; }
        public vals[] vals { get; set; }

        public override bool Equals(object p_obj)
        {
            bool l_isEqual = false;
            
            if (p_obj.GetType() == typeof(chs))
            {
                chs l_obj = (chs)p_obj;
                l_isEqual = l_obj.ctx.Equals(this.ctx) &&
                    l_obj.ind == this.ind &&
                    l_obj.type.Equals(this.type);
            }

            return l_isEqual;
        }

        public override int GetHashCode()
        {
            string l_composed = string.Format("{0}{1}{2}", this.ctx, this.ind, this.type);

            return l_composed.GetHashCode();
        }
    }

    public class vals
    {
        public long date { get; set; }
        public double val { get; set; }
    }

    public class error
    {
        public int code { get; set; }
        public string message { get; set; }
        public data data { get; set; }
    }

    public class data
    {
        public string exceptionTypeName { get; set; }
        public string message { get; set; }

        public override string ToString()
        {
            string l_dataError = string.Format("Exception name : {0}\r\nMessage : {1}", 
                exceptionTypeName,
                message);

            return l_dataError;
        }
    }
    // ReSharper restore InconsistentNaming
}