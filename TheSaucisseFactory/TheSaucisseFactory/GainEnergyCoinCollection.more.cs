using System;
using System.Linq;


namespace TheSaucisseFactory
{
    public partial class GainEnergyCoinCollection
    {
        public static GainEnergyCoinCollection LoadByAppartementDate(Appartement p_appartement, DateTime p_date)
        {
            GainEnergyCoinCollection l_result = new GainEnergyCoinCollection();

            GainEnergyCoinCollection l_intermediateResult = GainEnergyCoinCollection.LoadByAppartementDateRange(p_appartement, p_date);

            DateTime l_maxDate = DateTime.MinValue;
            foreach (GainEnergyCoin l_gain in l_intermediateResult)
            {
                if ((l_gain.Date - l_maxDate).Seconds > 0)
                {
                    l_maxDate = l_gain.Date;
                }
            }

            l_result.AddRange(l_intermediateResult.Where(r => r.Date == l_maxDate));

            return l_result;
        }
    }
}
