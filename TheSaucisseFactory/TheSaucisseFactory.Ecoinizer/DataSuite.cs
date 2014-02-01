using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TheSaucisseFactory.Ecoinizer
{
    class DataSuite : List<Mesure>
    {
        public Appartement Appartement
        {
            get;
            private set;
        }

        public DateTime Date
        {
            get;
            private set;
        }

        public string Type
        {
            get;
            private set;
        }

        public DataSuite(MesureCollection p_mesures, Appartement p_appartement, DateTime p_date, string p_type)
        {
            if (p_mesures == null)
            {
                throw new ArgumentNullException("p_gains");
            }

            if (p_appartement == null)
            {
                throw new ArgumentNullException("p_appartement");
            }

            Appartement = p_appartement;
            Date = p_date;
            Type = p_type;

            AddRange(p_mesures.Where(
                g => g.AppartementId == p_appartement.Id
                    && DateTime.Compare(g.Date, p_date) <= 0
                    && (p_date - g.Date).TotalDays < 7
                    && g.Type == p_type));
        }

        public double ConsommationElectricite()
        {
            return this.Sum(m => m.Valeur); 
        }

		private static List<double> _temperatureTarget = null;
		private static readonly int SeuilNuit = 19;
		private static readonly int SeuilJour = 21;

		public double TemperatureProcheCible()
		{
			if (_temperatureTarget == null)
			{
				_temperatureTarget = new List<double>();

				// Construire le schéma de comparaison cible pour la température
				for (int i = 0; i < 168; i++)
				{
					if ((i % 24) < 6 || (i % 24) > 22)
						_temperatureTarget.Add(SeuilNuit);
					else
						_temperatureTarget.Add(SeuilJour);
				}
			}

			double sumDelta = 0;

			for (int i = 0; i < 168; i++)
			{
				sumDelta += (_temperatureTarget[i] - this[i].Valeur);
			}

			return sumDelta;
		}
    }
}
