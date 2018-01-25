using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace GenericInsurance.DataObjects
{
    public class Claims
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity), Key()]
        public int ID { get; set; }
        public string ContactID { get; set; }
        public int PolicyTypeHolder { get; set; }
        public string EmailAddress { get; set; }
        public string PhoneNo { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string DriverName { get; set; }
        public string DriverAddress { get; set; }
        public string PolicyNo { get; set; }
        public string VehicleRegNo { get; set; }
        public DateTime TimeOfIncident { get; set; }
        public string DetailsOfIncident { get; set; }
        public string Witness1Details { get; set; }
        public string Witness2Details { get; set; }
    }
}