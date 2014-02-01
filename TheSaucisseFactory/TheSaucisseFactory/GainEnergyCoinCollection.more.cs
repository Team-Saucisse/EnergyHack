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

            DateTime l_maxDate = l_intermediateResult.OrderBy(g => g.Date).Last().Date;

            l_result.AddRange(l_intermediateResult.Where(r => r.Date == l_maxDate));

            return l_result;
        }
    }
}
