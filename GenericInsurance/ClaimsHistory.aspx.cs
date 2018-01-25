using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GenericInsurance.DataObjects;

namespace GenericInsurance
{
    public partial class ClaimsHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["contactid"];
            GetData(id);
        }

        private bool GetData(string id)
        {
            bool iSuccess = false;

            try
            {
                //Connect to Database
                InsuranceContext ctx = new InsuranceContext();
                if (!ctx.Database.Exists())
                {
                    return iSuccess;
                }
                //DataObjects.Claims claimsRecords = ctx.Claims.Find(id);

                var claimsRecords = (from vc in ctx.Claims
                                     where vc.ContactID == id
                                     select vc).ToList();

                GrdClaimsHistory.DataSource = claimsRecords;
                GrdClaimsHistory.DataBind();
                iSuccess = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
            return iSuccess;
        }
    }
}