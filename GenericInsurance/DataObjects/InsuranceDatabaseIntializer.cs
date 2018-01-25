using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace GenericInsurance.DataObjects
{
    public class InsuranceDatabaseIntializer : CreateDatabaseIfNotExists<InsuranceContext>
    {
        protected override void Seed(InsuranceContext context)
        {
            base.Seed(context);
        }
    }
}