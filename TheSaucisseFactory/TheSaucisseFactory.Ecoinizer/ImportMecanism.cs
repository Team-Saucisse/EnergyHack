using System.Web.Script.Serialization;

namespace TheSaucisseFactory.Ecoinizer
{
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Text;
	using TheSaucisseFactory;
	using TheSaucisseFactory.Camel.Model;
	using TheSaucisseFactory.Camel;
	using TheSaucisseFactory.Camel.Helper;
	using System.Diagnostics;

	/// <summary>
	/// TODO: Update summary.
	/// </summary>
	public class ImportMecanism
	{
		private MainWindow main;
		private readonly DateTime end = new DateTime(2014, 1, 31);

		public ImportMecanism(MainWindow main)
		{
			this.main = main;
		}

		public void Run()
		{
			Residence residence = ResidenceCollection.LoadAll().First();

			int batId = 0;

			foreach (string batCamelId in batiments)
			{
				// Création du batiment
				Batiment batiment = BatimentCollection.LoadAll().Where(b => b.CamelId == batCamelId).First();

				Log("création batiment " + batId);

				List<string> aparts = batId++ == 0 ? batimentA : batimentB;
				int nb = 0;

				foreach (string camelIdApart in aparts)
				{
					// Création de l'appartement
					Appartement apart = AppartementCollection.LoadAll().Where(a => a.CamelId == camelIdApart).First();

					Log("création apart " + camelIdApart);

					foreach (string[] coupleVoie in voies)
					{
						Log("traitement " + coupleVoie[0] + " & " + coupleVoie[1]);
						// Récupération des mesures semaine par semaine
						for (DateTime begin = new DateTime(2013, 12, 1); begin <= end; begin = begin.AddMonths(1))
						{
							Log("Période " + begin + " -> " + begin.AddMonths(1).AddSeconds(-1));
							CamelResponseResource l_res = CamelGet(batCamelId, camelIdApart, coupleVoie, begin, begin.AddMonths(1).AddSeconds(-1));
							
							CodeFluent.Runtime.CodeFluentPersistence.RunTransaction("TheSaucisseFactory", delegate()
							{
								// Sauvegarde des mesures en base de données
								if (l_res != null && l_res.error == null && l_res.result != null &&
									l_res.result[0].chs != null && l_res.result[0].chs[0] != null &&
									l_res.result[0].chs[0].vals != null && l_res.result[0].chs[0].vals.Length > 1)
								{
									for (int i = 0; i < 2; i++)
									{
										foreach (vals values in l_res.result[0].chs[i].vals)
										{
											DateTime date = DateTimeHelper.ConvertTimeStampToDateTime(values.date);
											Mesure mes = new Mesure();
											mes.Date = date;
											mes.Appartement = apart;
											mes.Type = l_res.result[0].chs[i].type;
											mes.Valeur = values.val;

											mes.Save();
										}
									}
								}
							});
						}
					}
				}
			}
		}

		#region référentiel
		private List<string[]> voies = new List<string[]>()
		{
			new string[2] {"ELEC", "VEF",},
			new string[2] {"VECS", "TEMPER",},
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
		};

		private List<string> batimentB = new List<string>()
		{
			"B101",
			"B102",
			"B103",
			"B104",
			"B121",
		};
#endregion
		
		private CamelResponseResource CamelGet(string batiment, string apart, string[] voies, DateTime begin, DateTime end)
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
			//l_req.@params[0].types = new string[1];
			l_req.@params[0].types = voies;

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
					Log("exception " + ex.CamelMessage + " " + batiment + " " + apart + " " + voies);
				}
			}

			return null;
		}

		private void Log(string mess, bool crlf = true)
		{
			if (crlf)
			{
				mess += "\r\n";
			}
			
			main.Dispatcher.Invoke((Action) delegate
				{
					main.Log.Text += mess;
				});
		}
	}
}
