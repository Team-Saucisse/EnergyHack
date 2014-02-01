using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace TheSaucisseFactory.Ecoinizer
{
    public partial class EnergyCoinEngine
    {
        List<DataSuite> m_dataSuites = new List<DataSuite>();
        AppartementCollection m_tousLesApparts = AppartementCollection.LoadAll();
        ChallengeCollection m_tousLesChallenges = ChallengeCollection.LoadAll();
        DateTime m_minDate;
        DateTime m_maxDate;

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
			Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == "Température idéale");

			Dictionary<Appartement, double> l_classement = new Dictionary<Appartement, double>();

			DateTime l_processingDate = m_minDate;
			while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
			{
				l_classement.Clear();
				IEnumerable<DataSuite> l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "TEMPER");

				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.TemperatureProcheCible();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				var l_classementTrie = l_classement.OrderByDescending(i => i.Value);

				l_classementTrie.ElementAt(0).Key.GagneEnergyCoin(l_challengeEnCours, 5, l_processingDate, "1er");
				l_classementTrie.ElementAt(1).Key.GagneEnergyCoin(l_challengeEnCours, 3, l_processingDate, "2nd");
				l_classementTrie.ElementAt(2).Key.GagneEnergyCoin(l_challengeEnCours, 2, l_processingDate, "3ème");

				l_processingDate = l_processingDate.AddDays(7);
			}
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
					double l_indice = l_candidat.ConsommationElectricite();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				var l_classementTrie = l_classement.OrderBy(i => i.Value);

				l_classementTrie.ElementAt(0).Key.GagneEnergyCoin(l_challengeEnCours, 5, l_processingDate, "1er");
				l_classementTrie.ElementAt(1).Key.GagneEnergyCoin(l_challengeEnCours, 3, l_processingDate, "2nd");
				l_classementTrie.ElementAt(2).Key.GagneEnergyCoin(l_challengeEnCours, 2, l_processingDate, "3ème");

				l_processingDate = l_processingDate.AddDays(7);
			}
		}

        public EnergyCoinEngine()
        {
			GainEnergyCoinCollection.DeleteAll();
            BuildDataSuites();
			//ProcessChallenge1();
			//ProcessChallenge2();
			//ProcessChallenge3();
			ProcessChallenge4();
			//ProcessChallenge5();
			//ProcessChallenge6();
			//ProcessChallenge7();
			//ProcessChallenge8();
			ProcessChallenge9();
			//ProcessChallenge10();
        }

		private void ProcessChallenge10()
		{
			throw new NotImplementedException();
		}

		// Classement global
		private void ProcessChallenge9()
		{
			Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == p_challengeName);

			Dictionary<Appartement, double> l_classement = new Dictionary<Appartement, double>();

			DateTime l_processingDate = m_minDate;
			while (DateTime.Compare(l_processingDate, m_maxDate) <= 0)
			{
				l_classement.Clear();
				IEnumerable<DataSuite> l_candidats = m_dataSuites.Where(ds => ds.Date == l_processingDate && ds.Type == "ELEC");
				foreach (DataSuite l_candidat in l_candidats)
				{
					double l_indice = l_candidat.ConsommationElectricite();
					l_classement.Add(l_candidat.Appartement, l_indice);
				}

				IOrderedEnumerable<KeyValuePair<Appartement, double>> l_classementTrie = l_classement.OrderBy(i => i.Value);

				l_processingDate = l_processingDate.AddDays(7);
			}
		}

        /// <summary>
        /// Periste les calculs
        /// </summary>
        public void Save()
        {

        }
    }
}
