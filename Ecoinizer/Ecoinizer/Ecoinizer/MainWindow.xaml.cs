using System; 
using System.Windows;
using Ecoinizer.Camel;
using Ecoinizer.Camel.Helper;
using Ecoinizer.Camel.Model;
using System.Web.Script.Serialization;

namespace Ecoinizer
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();

			CamelRequestResource l_req = new CamelRequestResource("2.0", "energy");
			l_req.id = "test";
			l_req.@params = new Params[1];
			l_req.@params[0] = new Params();
			l_req.@params[0].begin = DateTimeHelper.ConvertDateTimeToUnixTimeStamp(new DateTime(2013, 10, 1));
			l_req.@params[0].end = DateTimeHelper.ConvertDateTimeToUnixTimeStamp(new DateTime(2013, 11, 1));
			l_req.@params[0].ctx = "GLOBAL";
			l_req.@params[0].gran = "DAY";
			l_req.@params[0].ind = 0;
			l_req.@params[0].lots = new string[1];
			l_req.@params[0].lots[0] = "B101";
			l_req.@params[0].build = "BatimentB";
			l_req.@params[0].prog = "CERGY01";
			l_req.@params[0].types = new string[1];
			l_req.@params[0].types[0] = "ELEC";

			if (l_req.IsValid())
			{
				JavaScriptSerializer l_javaScriptSerializer = new JavaScriptSerializer();
				string l_json = l_javaScriptSerializer.Serialize(l_req);

				try
				{
					CamelResponseResource l_res = CamelService.Post("https://camel.steria.fr:4043/CamelWebService/energy", l_json);
				}
				catch (CamelException ex)
				{
					Log.Text += ex.Message + ex.CamelMessage;
				}
			}
		}
	}
}
