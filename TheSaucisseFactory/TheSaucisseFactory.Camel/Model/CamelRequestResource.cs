using System.Runtime.Serialization;
using System.Web.Script.Serialization;

namespace TheSaucisseFactory.Camel.Model
{
    public static class CamelConstants
    {
        public const string GRAN_LAST = "LAST";
        public const string GRAN_HOUR = "HOUR";
        public const string GRAN_MONTH = "MONTH";
        public const string GRAN_DAY = "DAY";

        public const string MEASURE_FLOW_TEMPER = "TEMPER";
    }

    [DataContract(Name = "CamelRequestResource")]
    public class CamelRequestResource
    {
        [DataMember]
        public string jsonrpc { get; set; }

        [DataMember]
        public string method { get; set; }

        [DataMember]
        public Params[] @params { get; set; }

        [DataMember]
        public string id { get; set; }

        public CamelRequestResource(string p_jsonrpc, string p_method, string p_id)
        {
            jsonrpc = p_jsonrpc;
            method = p_method;
            id = p_id;
        }

        public CamelRequestResource(string p_jsonrpc, string p_method)
        {
            jsonrpc = p_jsonrpc;
            method = p_method;
        }

        public bool IsValid()
        {
            return !string.IsNullOrEmpty(jsonrpc) &&
                   !string.IsNullOrEmpty(method) &&
                   @params != null && @params.Length > 0 &&
                   !string.IsNullOrEmpty(@params[0].prog) &&
                   !string.IsNullOrEmpty(@params[0].build) &&
                   !string.IsNullOrEmpty(@params[0].gran) &&
                   @params[0].lots != null && @params[0].lots.Length > 0 &&
                   @params[0].types != null && @params[0].types.Length > 0 &&
                   @params[0].begin > 0 && @params[0].end > 0 &&
                   @params[0].ctx == "GLOBAL" &&
                   !string.IsNullOrEmpty(id);
        }

        public override string ToString()
        {
            JavaScriptSerializer l_javaScriptSerializer = new JavaScriptSerializer();

            return l_javaScriptSerializer.Serialize(this);
        }
    }

    [DataContract(Name = "CamelRequestResource")]
    public class Params
    {
        [DataMember]
        public string prog { get; set; }

        [DataMember]
        public string build { get; set; }

        [DataMember]
        public string ctx { get; set; }

        [DataMember]
        public int ind { get; set; }

        [DataMember]
        public string[] lots { get; set; }

        [DataMember]
        public string[] types { get; set; }

        [DataMember]
        public string gran { get; set; }

        [DataMember]
        public long begin { get; set; }

        [DataMember]
        public long end { get; set; }
    }
}