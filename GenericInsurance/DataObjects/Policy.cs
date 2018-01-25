using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GenericInsurance.DataObjects
{
    public class Policy
    {
        public int PolicyID { get; set; }
        public string PolicyName { get; set; }
        public string PolicyNo { get; set; }
        public int PolicyCategory { get; set; }
        public string PolicyCategoryName { get; set; }
        public string Carrier { get; set; }
        public int PolicyStatus { get; set; }
        public string PolicyStatusName { get; set; }
        public int Coverage { get; set; }
        public string CoverageName { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime RenewalDate { get; set; }
        public decimal AnnualPremium { get; set; }
        public decimal MonthlyPremium { get; set; }
        public int Lives { get; set; }
        public string CustomerId { get; set; }
        public string ContactId { get; set; }
    }
}