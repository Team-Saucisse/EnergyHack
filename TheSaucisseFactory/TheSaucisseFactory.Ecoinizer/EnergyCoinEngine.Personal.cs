using System;
using System.Linq;
using System.Collections.Generic;

namespace TheSaucisseFactory.Ecoinizer
{
    /// <summary>
    /// Complément du moteur pour la partie challenge personnels
    /// </summary>
	public partial class EnergyCoinEngine
	{
		private void ProcessChallenge7()
		{
            foreach (Appartement l_appartement in m_tousLesApparts)
            {
                ProcessPersonnalChallenge(l_appartement, "Mon challenge électricité", "ELEC");
            }
		}

		private void ProcessChallenge6()
		{
            foreach (Appartement l_appartement in m_tousLesApparts)
            {

                ProcessPersonnalChallenge(l_appartement, "Mon challenge eau froide", "VEF");
            }
        }

		private void ProcessChallenge5()
		{
            foreach (Appartement l_appartement in m_tousLesApparts)
            {
				ProcessPersonnalChallenge(l_appartement, "Mon challenge eau chaude", "VECS");
            }
        }

		// Veille en mode personnel
		private void ProcessChallenge11()
		{
			foreach (Appartement l_appartement in m_tousLesApparts)
			{
				Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == "Mon challenge appareils en veille");

				// On restreint les données avec lesquelles on joue à celle de l'appart/type
				IEnumerable<DataSuite> l_personnalChallengeSuites = m_dataSuites.Where(ds => ds.Appartement == l_appartement && ds.Type == "ELEC"); ;

				DateTime l_processedDate = m_minDate.AddDays(7); // on démarre à la seconde semaine, forcément...

				// Dump de la semaine d'avant
				DataSuite l_previousDataSuite = l_personnalChallengeSuites.FirstOrDefault(ds => ds.Date == m_minDate);
				double l_previousIndice = l_previousDataSuite.ConsommationTotale();

				// On traite date par date
				while (DateTime.Compare(l_processedDate, m_maxDate) <= 0)
				{
					DataSuite l_candidat = m_dataSuites.FirstOrDefault(ds => ds.Date == l_processedDate);
					double l_indice = l_candidat.ConsommationMinimum();

					if (l_indice < l_previousIndice)
					{
						l_appartement.GagneEnergyCoin(l_challengeEnCours, 2, l_processedDate, string.Format("{0:0.00}%", (((l_indice - l_previousIndice) * 100) / l_previousIndice)));
					}

					// dump des valeurs courantes pour l'itération suivante
					l_previousDataSuite = l_candidat;
					l_previousIndice = l_indice;

					// Date suivante
					l_processedDate = l_processedDate.AddDays(7);

				}
			}
		}

        private void ProcessPersonnalChallenge(Appartement p_appartement, string p_challengeName, string p_subChallenge)
        {
            Challenge l_challengeEnCours = m_tousLesChallenges.FirstOrDefault(c => c.Nom == p_challengeName);

            // On restreint les données avec lesquelles on joue à celle de l'appart/type
            IEnumerable<DataSuite> l_personnalChallengeSuites = m_dataSuites.Where(ds => ds.Appartement == p_appartement && ds.Type == p_subChallenge); ;
            
            DateTime l_processedDate = m_minDate.AddDays(7); // on démarre à la seconde semaine, forcément...

            // Dump de la semaine d'avant
            DataSuite l_previousDataSuite = l_personnalChallengeSuites.FirstOrDefault(ds => ds.Date == m_minDate); 
            double l_previousIndice = l_previousDataSuite.ConsommationTotale();
            
            // On traite date par date
            while (DateTime.Compare(l_processedDate, m_maxDate) <= 0)
            {
                DataSuite l_candidat = m_dataSuites.FirstOrDefault(ds => ds.Date == l_processedDate);
				double l_indice = l_candidat.ConsommationTotale();

                if (l_indice < l_previousIndice)
                {
					p_appartement.GagneEnergyCoin(l_challengeEnCours, 4, l_processedDate, string.Format("{0:0.00}%", (((l_indice - l_previousIndice) * 100) / l_previousIndice)));
                }
                
                // dump des valeurs courantes pour l'itération suivante
                l_previousDataSuite = l_candidat;
                l_previousIndice = l_indice;

                // Date suivante
                l_processedDate = l_processedDate.AddDays(7);

            }
        }
	}
}
