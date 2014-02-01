using System;
using System.Globalization;
using Ecoinizer.Camel.Model;

namespace Ecoinizer.Camel.Helper
{
    public static class DateTimeHelper
    {
        /// <summary>
        /// DateTime correspondant au 01/01/1970 00:00:00
        /// </summary>
        private static readonly DateTime Origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);

        /// <summary>
        /// Définit le préfixe du premier jour de la semaine sélectionnée
        /// </summary>
        private const string WeekPeriodPrefixFirstDay = "Du ";

        /// <summary>
        /// Définit le préfixe du dernier jour de la semaine sélectionnée
        /// </summary>
        private const string WeekPeriodPrefixLastDay = " au ";

        /// <summary>
        /// Format de date à saisir dans l'interface graphique
        /// </summary>
        private const string DateFormat = "dd/MM/yyyy";

        /// <summary>
        /// Convertit un timestamp unix (millisecondes) en DateTime
        /// </summary>
        /// <param name="p_timestamp"></param>
        /// <returns></returns>
        public static DateTime ConvertTimeStampToDateTime(long p_timestamp)
        {
            DateTime l_result = Origin.AddMilliseconds(p_timestamp);
            l_result = DateTime.SpecifyKind(l_result, DateTimeKind.Utc);
            l_result = l_result.ToLocalTime();

            return l_result;
        }

        /// <summary>
        /// Convertit un datetime en Timestamp unix en ms
        /// </summary>
        /// <param name="p_dateToConvert"></param>
        /// <returns></returns>
        public static long ConvertDateTimeToUnixTimeStamp(DateTime p_dateToConvert)
        {
            DateTime l_test = DateTime.SpecifyKind(p_dateToConvert, DateTimeKind.Local);
            l_test = l_test.ToUniversalTime();

            long l_temp = (long)l_test.Subtract(Origin).TotalMilliseconds;

            return l_temp;
        }

        /// <summary>
        /// Passe un timestamp au format unix UTC en timestamp format unix local
        /// </summary>
        /// <param name="p_timestamp"></param>
        /// <returns></returns>
        public static long UniversalTimestampToLocal(long p_timestamp)
        {
            DateTime l_result = Origin.AddMilliseconds(p_timestamp);
            l_result = DateTime.SpecifyKind(l_result, DateTimeKind.Utc);
            l_result = l_result.ToLocalTime();

            long l_temp = (long)l_result.Subtract(Origin).TotalMilliseconds;

            return l_temp;
        }

        /// <summary>
        /// Retourne le jour passé en paramètre pour 23h59:59
        /// </summary>
        /// <param name="p_day">Le jour dont on soughait récupérer la fin</param>
        /// <returns>p_day avec l'heure suivante 23:59:59</returns>
        public static DateTime GetEndOfDay(DateTime p_day)
        {
            return new DateTime(p_day.Year, p_day.Month, p_day.Day, 23, 59, 59);
        }

        /// <summary>
        /// Retourne la date de début saisie par directement ou indirectement par l'utilisateur dans l'interface graphique
        /// </summary>
        /// <returns>DateTime</returns>
        public static DateTime GetBeginOfPeriod(string p_period)
        {
            DateTime l_result = DateTime.Now;

            try
            {
                if (IsWeekFormat(p_period))
                {
                    int l_indexOfFrom = p_period.IndexOf(WeekPeriodPrefixFirstDay) + WeekPeriodPrefixFirstDay.Length;
                    int l_indexOfEndFirtDateTime = p_period.IndexOf(WeekPeriodPrefixLastDay);
                    string l_firstDayOfWeek = p_period.Substring(l_indexOfFrom, l_indexOfEndFirtDateTime - l_indexOfFrom);
                    l_result = DateTime.ParseExact(l_firstDayOfWeek, DateFormat, CultureInfo.GetCultureInfo("fr-FR"));
                }
                else if (IsMonthFormat(p_period))
                {
                    l_result = DateTime.ParseExact(p_period, "MMMM yyyy", CultureInfo.GetCultureInfo("fr-FR"));
                }
                else
                {
                    // On traite par défaut un cas de période Journée
                    l_result = DateTime.ParseExact(p_period, DateFormat, CultureInfo.GetCultureInfo("fr-FR"));
                }
            }
            catch
            {
                l_result = DateTime.Now;
            }

            return l_result;
        }

        /// <summary>
        /// Retourne la date de fin saisie par directement ou indirectement par l'utilisateur dans l'interface graphique
        /// </summary>
        /// <returns></returns>
        public static DateTime GetEndOfPeriod(string p_period, DateTime? p_begin = null)
        {
            DateTime l_result = DateTime.Now;
            DateTime? l_begin = p_begin;

            try
            {
                if (!l_begin.HasValue)
                {
                    l_begin = GetBeginOfPeriod(p_period);
                }

                if (IsWeekFormat(p_period))
                {
                    int l_indexOfBeginLastDay = p_period.IndexOf(WeekPeriodPrefixLastDay) + WeekPeriodPrefixLastDay.Length;
                    string l_lastDayOfWeek = p_period.Substring(l_indexOfBeginLastDay).TrimEnd();
                    l_result = DateTime.ParseExact(l_lastDayOfWeek, DateFormat, CultureInfo.CurrentCulture);
                    l_result = DateTimeHelper.GetEndOfDay(l_result);
                }
                else if (IsMonthFormat(p_period))
                {
                    l_result = l_begin.Value.AddMonths(1).AddSeconds(-1);
                }
                else
                {
                    // On traite par défaut un cas de période Journée
                    l_result = GetEndOfDay(l_begin.Value);
                }
            }
            catch
            {
                l_result = DateTime.Now;
            }

            return l_result;
        }

        /// <summary>
        /// Permet de savoir si le format de la période saisie est de type Semaine
        /// </summary>
        /// <param name="p_period"></param>
        private static bool IsWeekFormat(string p_period)
        {
            return p_period.StartsWith("Du");
        }

        /// <summary>
        /// Permet de savoir si le format de la période saisie est de type Mois
        /// </summary>
        /// <param name="p_period"></param>
        private static bool IsMonthFormat(string p_period)
        {
            // Lorsque la saisie est un mois, aucun caractère / n'apparait
            return !p_period.Contains("/");
        }

        /// <summary>
        /// Retourne la granularité CAMEL en fonction de la date sélectionné
        /// Règle métier : 
        ///     Jour : granularité HEURE
        ///     Semaine : granularité JOUR
        ///     Mois : granularité JOUR
        /// </summary>²
        /// <param name="p_date"></param>
        /// <returns></returns>
        public static string GetGranularityFromDate(string p_date)
        {
            string l_granularity = "";

            if (IsMonthFormat(p_date))
            {
                l_granularity = CamelConstants.GRAN_DAY;
            }
            else if (IsWeekFormat(p_date))
            {
                l_granularity = CamelConstants.GRAN_DAY;
            }
            else
            {
                l_granularity = CamelConstants.GRAN_HOUR;
            }

            return l_granularity;
        }
    }
}