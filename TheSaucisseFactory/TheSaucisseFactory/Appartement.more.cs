using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TheSaucisseFactory
{
    public partial class Appartement
    {
        public void GagneEnergyCoin(Challenge p_challenge, int p_quantite, DateTime p_date, string p_meta)
        {
            GainEnergyCoin l_newCoin = new GainEnergyCoin();

            l_newCoin.Appartement = this;
            l_newCoin.Challenge = p_challenge;
            l_newCoin.Quantite = p_quantite;
            l_newCoin.Meta = p_meta;
            l_newCoin.Date = p_date;

            l_newCoin.Save();

            SoldeEnergyCoin += p_quantite;
        }
    }
}
