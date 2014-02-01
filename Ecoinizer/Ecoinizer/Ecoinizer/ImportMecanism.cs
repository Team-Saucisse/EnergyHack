using Ecoinizer.Camel;
using Ecoinizer.Camel.Helper;
using Ecoinizer.Camel.Model;
using System.Web.Script.Serialization;

namespace Ecoinizer
{
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Text;
	using TheSaucisseFactory;

	/// <summary>
	/// TODO: Update summary.
	/// </summary>
	public class ImportMecanism
	{
		private MainWindow main;
		private readonly DateTime end = new DateTime(2014, 31, 1);

		public ImportMecanism(MainWindow main)
		{
			this.main = main;
		}

		public void Run()
		{
			foreach (string batCamelId in batiments)
			{
				// Création du batiment
				Batiment batiment = new Batiment();
				batiment.CamelId = batCamelId;
				batiment.Save();

				Log("création batiment A");

				foreach (string camelIdApart in batimentA)
				{
					// Création de l'appartement
					Appartement apart = new Appartement();
					apart.Nom = camelIdApart;
					apart.CamelId = camelIdApart;
					apart.Batiment = batiment;
					apart.Save();

					Log("création apart " + camelIdApart);

					foreach (string voie in voies)
					{
						// Récupération des mesures semaine par semaine
						for (DateTime begin = new DateTime(2013, 6, 1); begin <= end; begin = begin.AddMonths(1))
						{
							CamelResponseResource l_res = CamelGet(batCamelId, camelIdApart, voie, begin, begin.AddMonths(1));

							// Sauvegarde des mesures en base de données
							if (l_res != null && l_res.error == null && l_res.result != null &&
								l_res.result[0].chs != null && l_res.result[0].chs[0] != null &&
								l_res.result[0].chs[0].vals != null && l_res.result[0].chs[0].vals.Length > 1)
							{
								foreach (vals values in l_res.result[0].chs[0].vals)
								{
									DateTime date = DateTimeHelper.ConvertTimeStampToDateTime(values.date);
									Mesure mes = new Mesure();
									mes.Date = date;
									mes.Appartement = apart;
									mes.Type = voie;
									mes.Valeur = values.val;

									mes.Save();
								}
							}
						}
					}
				}
			}
		}

		#region référentiel
		private List<string> voies = new List<string>()
		{
			"ELEC", "VEF", "VECS", "TEMP",
		};

		private List<string> batiments = new List<string>()
		{
			"BatimentA", "BatimentB",
		};

		private List<string> batimentA = new List<string>()
		{
			"A201",
			"A202",
			"A211",
			"A212",
			"A221",
			"A222",
			"A231",
			"A232",
			"A241",
			"A242",
			"A251",
			"A261",
		};

		private List<string> batimentB = new List<string>()
		{
			"B101",
			"B102",
			"B103",
			"B104",
			"B111",
			"B112",
			"B113",
			"B114",
			"B115",
			"B116",
			"B121",
			"B122",
			"B123",
			"B124",
			"B125",
			"B126",
			"B131",
			"B132",
			"B133",
			"B134",
			"B135",
			"B136",
			"B141",
			"B142",
			"B143",
			"B144",
			"B145",
			"B146",
			"B151",
			"B152",
			"B153",
			"B154",
			"B155",
			"B156",
			"B161",
			"B162",
			"B163",
			"B164",
			"B165",
			"B166",
		};
#endregion
		
		private CamelResponseResource CamelGet(string batiment, string apart, string voie, DateTime begin, DateTime end)
		{
			CamelRequestResource l_req = new CamelRequestResource("2.0", "energy");
			l_req.id = "test";
			l_req.@params = new Params[1];
			l_req.@params[0] = new Params();
			l_req.@params[0].begin = DateTimeHelper.ConvertDateTimeToUnixTimeStamp(begin);
			l_req.@params[0].end = DateTimeHelper.ConvertDateTimeToUnixTimeStamp(end);
			l_req.@params[0].ctx = "GLOBAL";
			l_req.@params[0].gran = "HOUR";
			l_req.@params[0].ind = 0;
			l_req.@params[0].lots = new string[1];
			l_req.@params[0].lots[0] = apart;
			l_req.@params[0].build = batiment;
			l_req.@params[0].prog = "CERGY01";
			l_req.@params[0].types = new string[1];
			l_req.@params[0].types[0] = voie;

			if (l_req.IsValid())
			{
				JavaScriptSerializer l_javaScriptSerializer = new JavaScriptSerializer();
				string l_json = l_javaScriptSerializer.Serialize(l_req);

				try
				{
					return CamelService.Post("https://camel.steria.fr:4043/CamelWebService/energy", l_json);
				}
				catch (CamelException ex)
				{
					Log("exception " + ex.CamelMessage + " " + batiment + " " + apart + " " + voie);
				}
			}

			return null;
		}

		private void Log(string mess)
		{
			main.Log.Text += mess + "\r\n";
		}
	}
}
