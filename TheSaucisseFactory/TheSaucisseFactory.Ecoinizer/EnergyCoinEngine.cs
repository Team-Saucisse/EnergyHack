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

        public EnergyCoinEngine()
        {
            MesureCollection l_toutesLesMesures = MesureCollection.LoadAll();
            AppartementCollection l_tousLesApparts = AppartementCollection.LoadAll();

            IOrderedEnumerable<Mesure> l_mesuresTriees = l_toutesLesMesures.OrderBy(m => m.Date);
            DateTime l_minDate = l_mesuresTriees.First().Date;
            DateTime l_maxDate = l_mesuresTriees.Last().Date;

            l_minDate = new DateTime(2013, 10, 4);
            l_maxDate = new DateTime(2013, 11, 29);

            DateTime l_processingDate;
            foreach (var l_appartement in l_tousLesApparts)
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

        /// <summary>
        /// Periste les calculs
        /// </summary>
        public void Save()
        {
        }
    }
}
