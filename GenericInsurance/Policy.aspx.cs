using Insurance;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.ServiceModel.Description;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GenericInsurance.DataObjects.Utility;

namespace GenericInsurance
{
    public partial class Policy : System.Web.UI.Page
    {
        private IOrganizationService _orgService;
        private static OrganizationServiceProxy _serviceProxy;
        private static Uri uri;
        private static Uri homeRealmUri = null;
        private static ClientCredentials deviceCredentials = null;
        private DataObjects.Policy policyObj;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPolicy_Click(object sender, EventArgs e)
        {
            CustomerPolicy();
        }

        public void CustomerPolicy()
        {
            try
            {
                DataObjects.Policy policy = new DataObjects.Policy()
                {
                    PolicyName = txtPolicyName.Text,
                    PolicyCategory = ddlPolicyCategory.SelectedIndex,
                    PolicyCategoryName = ddlPolicyCategory.SelectedItem.Text,
                    Carrier = txtCarrier.Text,
                    PolicyStatus = ddlPolicyStatus.SelectedIndex,
                    PolicyStatusName = ddlPolicyStatus.SelectedItem.Text,
                    Coverage = ddlCoverage.SelectedIndex,
                    CoverageName = ddlCoverage.SelectedItem.Text,
                    EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text).Date,
                    RenewalDate = Convert.ToDateTime(txtRenewalDate.Text).Date,
                    AnnualPremium = Convert.ToDecimal(txtAnnualPremium.Text),
                    MonthlyPremium = Convert.ToDecimal(txtMonthlyPremium.Text),
                    Lives = Convert.ToInt32(txtLives.Text),
                    ContactId = txtContactId.Text

                };

                //Send Data to Database
                DataObjects.InsuranceContext ctx = new DataObjects.InsuranceContext();
                policyObj = ctx.Policies.Add(policy);
                ctx.SaveChanges();

                bool iResult = SendToCRM(policy);
                if (iResult)
                {
                    lblMsg.Text = "Form successfully submitted. Thank you!";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showModal();", true);
                    Clear();
                }
                else
                {
                    lblMsg.Text = "Error";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showModal();", true);
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }

        #region "CRM OPERATION"

        public bool SendToCRM(DataObjects.Policy atran)
        {
            bool iSuccess = false;

            ClientCredentials cred = getCredentials();

            var appSettings = ConfigurationManager.AppSettings;
            uri = new Uri(appSettings["urlName"]);

            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                using (_serviceProxy = new OrganizationServiceProxy(uri, homeRealmUri, cred, deviceCredentials))
                {
                    _serviceProxy.EnableProxyTypes();
                    _orgService = _serviceProxy;
                    using (InsuranceServiceContext context = new InsuranceServiceContext(_orgService))
                    {
                        //Query for the contact guid based on the customerId
                        var contactQuery = (from c in context.ContactSet
                                            where c.new_contactid1 == atran.ContactId
                                            select new
                                            {
                                                contactGuid = c.ContactId,
                                                contactName = c.FullName,
                                                contactLogicalName = c.LogicalName
                                            }).FirstOrDefault();

                        new_policy ctxPolicy = new new_policy()
                        {
                            new_Carrier = atran.Carrier,
                            new_PolicyCategory = new OptionSetValue(atran.PolicyCategory),
                            new_name = atran.PolicyName,
                            new_PolicyStatus = new OptionSetValue(atran.PolicyStatus),
                            new_Coverage = new OptionSetValue(atran.Coverage),
                            new_EffectiveDate = Convert.ToDateTime(atran.EffectiveDate),
                            new_RenewalDate = Convert.ToDateTime(atran.RenewalDate),
                            new_AnnualPremium = new Money(atran.AnnualPremium),
                            new_MonthlyPremium = new Money(atran.MonthlyPremium),
                            new_Lives = atran.Lives,
                            new_CustomerId = new EntityReference(contactQuery.contactLogicalName, (Guid)contactQuery.contactGuid),
                            new_ContactId = atran.ContactId
                        };
                        Guid policyGuid = _serviceProxy.Create(ctxPolicy);

                        //context.AddObject(ctxPolicy);
                        //context.SaveChanges();
                        //Guid policyGuid = ctxPolicy.Id;

                        //Retrieve policy no from CRM
                        var policyQuery = (from pc in context.new_policySet
                                           where pc.new_policyId == policyGuid
                                           select new
                                           {
                                               PolicyNo = pc.new_PolicyNo
                                           }).FirstOrDefault();

                        //Update policy database with policy no
                        DataObjects.InsuranceContext ctx = new DataObjects.InsuranceContext();
                        DataObjects.Policy policyObjectToUpdate = ctx.Policies.Find(policyObj.PolicyID);
                        policyObjectToUpdate.PolicyNo = policyQuery.PolicyNo;
                        ctx.SaveChanges();

                        iSuccess = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex?.Message ?? ex.InnerException.Message;
            }

            return iSuccess;
        }
        #endregion

        private void Clear()
        {
            txtAnnualPremium.Text = string.Empty;
            txtCarrier.Text = string.Empty;
            txtEffectiveDate.Text = string.Empty;
            txtLives.Text = string.Empty;
            txtMonthlyPremium.Text = string.Empty;
            txtPolicyName.Text = string.Empty;
            txtContactId.Text = string.Empty;
            txtRenewalDate.Text = string.Empty;
            ddlCoverage.SelectedIndex = 0;
            ddlPolicyCategory.SelectedIndex = 0;
            ddlPolicyStatus.SelectedIndex = 0;
        }
    }
}