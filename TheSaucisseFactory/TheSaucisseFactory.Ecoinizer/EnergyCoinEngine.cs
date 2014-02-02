using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Diagnostics;

namespace TheSaucisseFactory.Ecoinizer
{
    public partial class EnergyCoinEngine
    {
        List<DataSuite> m_dataSuites = new List<DataSuite>();
        AppartementCollection m_tousLesApparts = AppartementCollection.LoadAll();
        ChallengeCollection m_tousLesChallenges = ChallengeCollection.LoadAll();
        DateTime m_minDate;
        DateTime m_maxDate;
		MainWindow m_main = null;

		public EnergyCoinEngine(MainWindow mainWindow)
		{
			m_main = mainWindow;
			// ExportCsv();

			Stopwatch l_watch = new Stopwatch();
			l_watch.Start();
			Log("Remise à zéro des e-coins !");
			GainEnergyCoinCollection.DeleteAll();
			Log("Construction des séries de mesure !");
			BuildDataSuites();
			Log("Calcul challenge Electricité entre voisins !");
			ProcessChallenge1();
			Log("Calcul challenge Eau froide entre voisins !");
			ProcessChallenge2();
			Log("Calcul challenge Eau chaude entre voisins !");
			ProcessChallenge3();
			Log("Calcul challenge température idéale !");
			ProcessChallenge4();
			Log("Calcul challenge Mon challenge eau chaude !");
			ProcessChallenge5();
			Log("Calcul challenge Mon challenge eau froide !");
			ProcessChallenge6();
			Log("Calcul challenge Mon challenge électricité !");
			ProcessChallenge7();
			Log("Calcul challenge Classement global !");
			ProcessChallenge9();
			Log("Calcul challenge Appareil en veille !");
			ProcessChallenge10();
			Log("Calcul challenge Mon challenge veille électrique !");
			ProcessChallenge11();

			l_watch.Start();
			Log("Temps : " + l_watch.ElapsedMilliseconds + " ms");
		}

        void BuildDataSuites()
        {
            // On chope toutes les mesures
            MesureCollection l_toutesLesMesures = MesureCollection.LoadAll();

            // Calcul date min et max
            IOrderedEnumerable<Mesure> l_mesuresTriees = l_toutesLesMesures.OrderBy(m => m.Date);
            m_minDate = l_mesuresTriees.First().Date;
            m_minDate = m_minDate.AddDays(0 - m_minDate.DayOfWeek - 2);

            m_maxDate = l_mesuresTriees.Last().Date;
            m_maxDate = m_maxDate.AddDays(DayOfWeek.Friday - m_minDate.DayOfWeek);

            // Caluls des séries
            DateTime l_processingDate;
            foreach (var l_appartement in m_tousLesApparts)
            {
				// RAZ des ecoins
				l_appartement.SoldeEnergyCoin = 0;

                // ELEC
                l_processingDate = m_minDate;
                while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "ELEC");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // VEF
                l_processingDate = m_minDate;
                while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "VEF");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // VECS
                l_processingDate = m_minDate;
                while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "VECS");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // TEMPER
                l_processingDate = m_minDate;
                while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "TEMPER");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }
            }
        }

        // Electricité entre voisins 
        void ProcessChallenge1()
        {
			ProcessGenericChallenge("Electricité entre voisins", "ELEC");
        }

		// Volume d'eau froide
		private void ProcessChallenge2()
		{
			ProcessGenericChallenge("Eau froide entre voisins", "VEF");
		}

		// Volume d'eau chaude sanitaire
		private void ProcessChallenge3()
		{
			ProcessGenericChallenge("Eau chaude entre voisins", "VECS");
		}

		// Température
		private void ProcessChallenge4()
		{
			ProcessGenericChallenge("Température idéale", "TEMPER");
		}

		private void ProcessGenericChallenge(string p_challengeName, string p_type)
		{
			Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == p_challengeName);

			Dictionary<Appartement, double> l_classement = new Dictionary<Appartement, double>();

			DateTime l_processingDate = m_minDate;
			while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
			{
				l_classement.Clear();
				IEnumerable<DataSuite> l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == p_type);
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationTotale();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				var l_classementTrie = l_classement.OrderBy(i => i.Value);

				l_classementTrie.ElementAt(0).Key.GagneEnergyCoin(l_challengeEnCours, 8, l_processingDate, "Bien joué, vous êtes le meilleur!");
				l_classementTrie.ElementAt(1).Key.GagneEnergyCoin(l_challengeEnCours, 5, l_processingDate, "Second ! Encore un effort !");
				l_classementTrie.ElementAt(2).Key.GagneEnergyCoin(l_challengeEnCours, 2, l_processingDate, "Pas mal du tout !");

				l_processingDate = l_processingDate.AddDays(7);
			}
		}

		// Appareil en veille
		private void ProcessChallenge10()
		{
			Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == "Appareil en veille");

			Dictionary<Appartement, double> l_classement = new Dictionary<Appartement, double>();

			DateTime l_processingDate = m_minDate;
			while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
			{
				l_classement.Clear();
				IEnumerable<DataSuite> l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "ELEC");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationMinimum();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				var l_classementTrie = l_classement.OrderBy(i => i.Value);

				l_classementTrie.ElementAt(0).Key.GagneEnergyCoin(l_challengeEnCours, 6, l_processingDate, "Bien joué, vous êtes le meilleur !");
				l_classementTrie.ElementAt(1).Key.GagneEnergyCoin(l_challengeEnCours, 4, l_processingDate, "Second ! Encore un effort !");
				l_classementTrie.ElementAt(2).Key.GagneEnergyCoin(l_challengeEnCours, 2, l_processingDate, "Pas mal du tout !");

				l_processingDate = l_processingDate.AddDays(7);
			}
		}

		// Classement global
		private void ProcessChallenge9()
		{
			Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == "Podium général entre voisins");

			IOrderedEnumerable<KeyValuePair<Appartement, double>> l_classementTrieElec;
			IOrderedEnumerable<KeyValuePair<Appartement, double>> l_classementTrieVef;
			IOrderedEnumerable<KeyValuePair<Appartement, double>> l_classementTrieVecs;
			IOrderedEnumerable<KeyValuePair<Appartement, double>> l_classementTrieTemper;

			Dictionary<Appartement, double> l_classement = new Dictionary<Appartement, double>();
			
			DateTime l_processingDate = m_minDate;

			while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
			{
				l_classement.Clear();
				IEnumerable<DataSuite> l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "ELEC");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationTotale();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				l_classementTrieElec = l_classement.OrderBy(i => i.Value);

				l_classement = new Dictionary<Appartement, double>();

				l_classement.Clear();
				l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "VEF");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationTotale();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				l_classementTrieVef = l_classement.OrderBy(i => i.Value);


			    l_classement = new Dictionary<Appartement, double>();

				l_classement.Clear();
				l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "VECS");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationTotale();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				l_classementTrieVecs = l_classement.OrderBy(i => i.Value);

				l_classement.Clear();
				l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "TEMPER");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationTotale();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				l_classementTrieTemper = l_classement.OrderBy(i => i.Value);

				List<KeyValuePair<Appartement, double>> l_classementDesClassements = new List<KeyValuePair<Appartement, double>>();

				foreach (Appartement apart in AppartementCollection.LoadAll())
				{
					var elec = l_classementTrieElec.Where(t => t.Key.Equals(apart)).FirstOrDefault();
					var vef = l_classementTrieVef.Where(t => t.Key.Equals(apart)).FirstOrDefault();
					var vecs = l_classementTrieVecs.Where(t => t.Key.Equals(apart)).FirstOrDefault();
					var temp = l_classementTrieTemper.Where(t => t.Key.Equals(apart)).FirstOrDefault();

					double l_moyenne = (l_classementTrieElec.Where(t => t.Key.Equals(apart)).First().Value +
						l_classementTrieVef.Where(t => t.Key.Equals(apart)).First().Value +
						l_classementTrieVecs.Where(t => t.Key.Equals(apart)).First().Value +
						l_classementTrieTemper.Where(t => t.Key.Equals(apart)).First().Value) / 4;
					KeyValuePair<Appartement, double> l_appartMoy = new KeyValuePair<Appartement, double>(apart, l_moyenne);
					l_classementDesClassements.Add(l_appartMoy);
				}

				var l_classementClassementTrie = l_classementDesClassements.OrderBy(cl => cl.Value);

				l_classementClassementTrie.ElementAt(0).Key.GagneEnergyCoin(l_challengeEnCours, 10, l_processingDate, "Number one !");
				l_classementClassementTrie.ElementAt(1).Key.GagneEnergyCoin(l_challengeEnCours, 6, l_processingDate, "Second ! Encore un effort !");
				l_classementClassementTrie.ElementAt(2).Key.GagneEnergyCoin(l_challengeEnCours, 3, l_processingDate, "3ème ! Pas mal !");

				l_processingDate = l_processingDate.AddDays(7);
			}
		}

        /// <summary>
        /// Periste les calculs
        /// </summary>
        public void Save()
        {
			m_tousLesApparts.SaveAll();
        }

		private void ExportCsv()
		{
			// Export temporaire d'un CSV brut
			MesureCollection mesures = MesureCollection.LoadAll();
			var filtrees = mesures.Where(m => m.Type == "ELEC").OrderBy(m => m.Date);

			using (System.IO.StreamWriter pen = new System.IO.StreamWriter(@"d:\temp\energyhack\export.csv"))
			{
				foreach (var item in filtrees)
				{
					pen.Write(string.Format("{0};{1};{2}\r\n", item.Date, item.Valeur, item.AppartementId));
				}
			}

			return;
		}

		private void Log(string mess, bool crlf = true)
		{
			if (crlf)
			{
				mess += "\r\n";
			}

			m_main.Dispatcher.Invoke((Action)delegate
			{
				m_main.Log.Text += mess;
			});
		}
    }
}
