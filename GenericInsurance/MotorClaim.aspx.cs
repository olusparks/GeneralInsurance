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
    public partial class MotorClaim : System.Web.UI.Page
    {

        private IOrganizationService _orgService;
        private static OrganizationServiceProxy _serviceProxy;
        private static Uri uri;
        private static Uri homeRealmUri = null;
        private static ClientCredentials deviceCredentials = null;

        DataObjects.Claims claims;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            CustomerClaim();
        }

        private void CustomerClaim()
        {
            try
            {
                claims = new DataObjects.Claims()
                {
                    ContactID = txtCustomerId.Value.Trim(),
                    PolicyTypeHolder = ddlPolicyholderType.SelectedIndex,
                    EmailAddress = txtEmail.Value.Trim(),
                    PhoneNo = txtPhone.Value.Trim(),
                    Address = txtAddress.Value.Trim(),
                    City = txtCity.Value.Trim(),
                    State = txtState.Value.Trim(),
                    DriverName = txtDriverName.Text.Trim(),
                    DriverAddress = txtDriverAddress.Text.Trim(),
                    PolicyNo = txtPolicyNumber.Value.Trim(),
                    VehicleRegNo = txtVechicleRegNo.Value.Trim(),
                    TimeOfIncident = Convert.ToDateTime(txtTimeofIncident.Value.Trim()),
                    DetailsOfIncident = txtDetailsofIncident.Value.Trim(),
                    Witness1Details = txtWitnessDetails1.Value.Trim(),
                    Witness2Details = txtWitnessDetails2.Value.Trim()
                };

                //Send Data to Database
                DataObjects.InsuranceContext ctx = new DataObjects.InsuranceContext();
                ctx.Claims.Add(claims);
                ctx.SaveChanges();

                //Send Data to CRM
                bool iResult = SendToCRM(claims);
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

        #region CRM OPERATIONS
        public bool SendToCRM(DataObjects.Claims claimTran)
        {
            bool iSuccess = false;

            //try
            //{
            //    CrmServiceClient crmServiceClientObj = new CrmServiceClient(ConfigurationManager.ConnectionStrings["CrmOnlineStringFromAppConfig"].ConnectionString);
            //    if (!crmServiceClientObj.IsReady || crmServiceClientObj == null)
            //    {
            //        lblMsg.Text = "Unable to connect";
            //        return iSuccess;
            //    }

            //    new_claim ctxClaim = new new_claim()
            //    {
            //        new_ContactID = claimTran.ContactID,
            //        new_PolicyholderType = new OptionSetValue(claimTran.PolicyTypeHolder),
            //        new_Email = claimTran.EmailAddress,
            //        new_PhoneNo = claimTran.PhoneNo,
            //        new_Address = claimTran.Address,
            //        new_City = claimTran.City,
            //        new_State = claimTran.State,
            //        new_DriverName = claimTran.DriverName,
            //        new_DriverAddress = claimTran.DriverAddress,
            //        new_PolicyNumber = claimTran.PolicyNo,
            //        new_VehicleRegistrationNumber = claimTran.VehicleRegNo,
            //        new_DetailsofIncident = claimTran.DetailsOfIncident,
            //        new_Witness1Details = claimTran.Witness1Details,
            //        new_Witness2Details = claimTran.Witness2Details
            //    };
            //    crmServiceClientObj.Create(ctxClaim);
            //    iSuccess = true;
            //}
            //catch (Exception ex)
            //{
            //    lblMsg.Text = ex.Message;
            //}

            //Using Web service
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
                        new_claim ctxclaim = new new_claim()
                        {
                            new_ContactID = claimTran.ContactID,
                            new_PolicyholderType = new OptionSetValue(claimTran.PolicyTypeHolder),
                            new_Email = claimTran.EmailAddress,
                            new_PhoneNo = claimTran.PhoneNo,
                            new_Address = claimTran.Address,
                            new_City = claimTran.City,
                            new_State = claimTran.State,
                            new_DriverName = claimTran.DriverName,
                            new_DriverAddress = claimTran.DriverAddress,
                            new_PolicyNumber = claimTran.PolicyNo,
                            new_VehicleRegistrationNumber = claimTran.VehicleRegNo,
                            new_DetailsofIncident = claimTran.DetailsOfIncident,
                            new_Witness1Details = claimTran.Witness1Details,
                            new_Witness2Details = claimTran.Witness2Details,
                            new_TimeofIncident = Convert.ToDateTime(txtTimeofIncident.Value)
                        };

                        List<OptionSetValue> drvSide = new List<OptionSetValue>();
                        List<OptionSetValue> passengerSide = new List<OptionSetValue>();
                        List<OptionSetValue> carCenter = new List<OptionSetValue>();

                        //(chkPassengerSide.Items).ForEach(delegate (OptionSetValue item)
                        //{
                        //    drvSide.Add(new OptionSetValue(Convert.ToInt32(item.Value)));
                        //});

                        foreach (ListItem item in chkDriverSide.Items)
                        {
                            if (item.Selected)
                                drvSide.Add(new OptionSetValue(Convert.ToInt32(item.Value)));

                        }
                        foreach (ListItem item in chkPassengerSide.Items)
                        {
                            if (item.Selected)
                                passengerSide.Add(new OptionSetValue(Convert.ToInt32(item.Value)));

                        }
                        foreach (ListItem item in chkCarCentre.Items)
                        {
                            if (item.Selected)
                                carCenter.Add(new OptionSetValue(Convert.ToInt32(item.Value)));

                        }

                        ctxclaim.new_DriverSide = new OptionSetValueCollection(drvSide);
                        ctxclaim.new_PassengerSide = new OptionSetValueCollection(passengerSide);
                        ctxclaim.new_Carcenter = new OptionSetValueCollection(carCenter);
                        context.AddObject(ctxclaim);
                        context.SaveChanges();
                        iSuccess = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
                iSuccess = false;
            }

            //Using Web Api
            /*clm.Add("new_ContactID", claimTran.ContactID);
            clm.Add("new_PolicyholderType", claimTran.PolicyTypeHolder);
            clm.Add("new_Email", claimTran.EmailAddress);
            clm.Add("new_PhoneNo", claimTran.PhoneNo);
            clm.Add("new_Address", claimTran.Address);
            clm.Add("new_City", claimTran.City);
            clm.Add("new_State", claimTran.State);
            clm.Add("new_DriverName", claimTran.DriverName);
            clm.Add("new_DriverAddress", claimTran.DriverAddress);
            clm.Add("new_PolicyNumber", claimTran.PolicyNo);
            clm.Add("new_VehicleRegistrationNumber", claimTran.VehicleRegNo);
            clm.Add("new_DetailsofIncident", claimTran.DetailsOfIncident);
            clm.Add("new_Witness1Details", claimTran.Witness1Details);
            clm.Add("new_Witness2Details", claimTran.Witness2Details);

            string apiVersion = "api/data/v9.0";
            httpClient = ConnectToCRM(apiVersion); //ConnectToCRM.TheHttpClient(apiVersion);
            //HttpResponseMessage createResponse = httpClient.PostAsync(httpClient.BaseAddress + "/contacts", 
            HttpRequestMessage createRequest1 = new HttpRequestMessage(HttpMethod.Post, httpClient.BaseAddress + "new_claim");
            createRequest1.Content = new StringContent(clm.ToString(), Encoding.UTF8, "application/json");
            HttpResponseMessage createResponse1 = await httpClient.SendAsync(createRequest1);
            if (createResponse1.StatusCode == HttpStatusCode.NoContent)  //204  
            {
                clmUri = createResponse1.Headers.GetValues("OData-EntityId").FirstOrDefault();
                lblMsg.Text = clmUri;
                iSuccess = true;
            }
            else
            {
                throw new CrmHttpException(createResponse1.Content);
            }*/
            return iSuccess;
        }
        #endregion

        private void Clear()
        {
            txtAddress.Value = string.Empty;
            txtCity.Value = string.Empty;
            txtCustomerId.Value = string.Empty;
            txtDetailsofIncident.Value = string.Empty;
            txtDriverAddress.Text = string.Empty;
            txtDriverName.Text = string.Empty;
            txtEmail.Value = string.Empty;
            txtPhone.Value = string.Empty;
            txtPolicyNumber.Value = string.Empty;
            txtState.Value = string.Empty;
            txtTimeofIncident.Value = "";
            txtVechicleRegNo.Value = string.Empty;
            txtWitnessDetails1.Value = string.Empty;
            txtWitnessDetails2.Value = string.Empty;
            ddlPolicyholderType.SelectedIndex = 0;
        }
    }
}