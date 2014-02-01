using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;

namespace TheSaucisseFactory.Ecoinizer
{
    class EnergyCoinEngine
    {
        List<DataSuite> m_dataSuites = new List<DataSuite>();
        AppartementCollection m_tousLesApparts = AppartementCollection.LoadAll();
        DateTime l_minDate;
        DateTime l_maxDate;

        void BuildDataSuites()
        {
            // On chope toutes les mesures
            MesureCollection l_toutesLesMesures = MesureCollection.LoadAll();

            // Calcul date min et max
            IOrderedEnumerable<Mesure> l_mesuresTriees = l_toutesLesMesures.OrderBy(m => m.Date);
            l_minDate = l_mesuresTriees.First().Date;
            l_minDate = l_minDate.AddDays(0 - l_minDate.DayOfWeek - 2);

            l_maxDate = l_mesuresTriees.Last().Date;
            l_maxDate = l_maxDate.AddDays(DayOfWeek.Friday - l_minDate.DayOfWeek);

            // Caluls des séries
            DateTime l_processingDate;
            foreach (var l_appartement in m_tousLesApparts)
            {
                // ELEC
                l_processingDate = l_minDate;
                while (DateTime.Compare(l_processingDate, l_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "ELEC");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // VEF
                l_processingDate = l_minDate;
                while (DateTime.Compare(l_processingDate, l_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "VEF");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // VECS
                l_processingDate = l_minDate;
                while (DateTime.Compare(l_processingDate, l_maxDate) <= 0)
                {
                    DataSuite l_suite = new DataSuite(l_toutesLesMesures, l_appartement, l_processingDate, "VECS");
                    m_dataSuites.Add(l_suite);
                    l_processingDate = l_processingDate.AddDays(7);
                }

                // TEMPER
                l_processingDate = l_minDate;
                while (DateTime.Compare(l_processingDate, l_maxDate) <= 0)
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
            
        }

        public EnergyCoinEngine()
        {
            
        }


        /// <summary>
        /// Periste les calculs
        /// </summary>
        public void Save()
        {
        }
    }
}
