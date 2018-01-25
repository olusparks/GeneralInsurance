using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace GenericInsurance.DataObjects
{
    public class InsuranceContext : DbContext
    {
        public InsuranceContext() : base("claimsDBCS")
        {

        }
        public DbSet<Claims> Claims { get; set; }
        public DbSet<Policy> Policies { get; set; }
        public DbSet<OrderDetails> OrderDetails { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //base.OnModelCreating(modelBuilder);
        }
    }
}