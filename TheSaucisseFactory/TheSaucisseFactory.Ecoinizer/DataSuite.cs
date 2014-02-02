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

			if (p_appartement.SurfaceHabitable != 0)
			{
				foreach (Mesure mesure in this)
				{
					mesure.ValeurPonderee = mesure.Valeur / p_appartement.SurfaceHabitable;
					mesure.Save();
				}
			}
        }

        public double ConsommationTotale()
        {
            return this.Sum(m => m.ValeurPonderee); 
        }

		public double ConsommationMinimum()
		{
			if (this.Count == 0)
			{
				return 0;
			}
			else
			{
				return this.Min(m => m.ValeurPonderee);
			}
		}
    }
}
