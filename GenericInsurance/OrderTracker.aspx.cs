using GenericInsurance.DataObjects;
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
using static GenericInsurance.DataObjects.OrderDetails;
using static GenericInsurance.DataObjects.Utility;

namespace GenericInsurance
{
    public partial class OrderTracker : System.Web.UI.Page
    {
        private IOrganizationService _orgService;
        private static OrganizationServiceProxy _serviceProxy;
        private static Uri uri;
        private static Uri homeRealmUri = null;
        private static ClientCredentials deviceCredentials = null;

        OrderDetails ordDetails;
        int status = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Order();
        }

        private void Order()
        {
            if (!CheckNull(txtName.Value, txtEmail.Value, txtPhone.Value, ddlProductName.SelectedItem.Text, txtQuantity.Value, txtPrice.Value))
            {
                //TODO : Error
                return;
            }
            status = (int)OrderStatus.Pending;
            ordDetails = new OrderDetails()
            {
                FullName = txtName.Value,
                EmailAddress = txtEmail.Value,
                Telephone = txtPhone.Value,
                Product = ddlProductName.SelectedItem.Text,
                Quantity = Convert.ToInt32(txtQuantity.Value),
                Price = Convert.ToInt32(txtPrice.Value),
                Total = Convert.ToInt32(txtQuantity.Value) * Convert.ToInt32(txtPrice.Value)
            };

            //Persist data into DB
            InsuranceContext context = new InsuranceContext();
            context.OrderDetails.Add(ordDetails);
            context.SaveChanges();

            //Persist data into CRM
            bool iResult = SendToCRM(ordDetails);
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

        #region CRM OPERATIONS
        public bool SendToCRM(OrderDetails atran)
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
                    using (InsuranceServiceContext context = new InsuranceServiceContext(_serviceProxy))
                    {
                        new_cornerstoneordertrack orderTracker = new new_cornerstoneordertrack()
                        {
                            new_FullName = atran.FullName,
                            new_Email = atran.EmailAddress,
                            new_Telephone = atran.Telephone,
                            new_ProductName = atran.Product,
                            new_Price = new Money(atran.Price),
                            new_Quantity = atran.Quantity,
                            new_Total = new Money(atran.Total),
                            new_OrderStatus = new OptionSetValue(status)
                        };
                        context.AddObject(orderTracker);
                        context.SaveChanges();
                        iSuccess = true;
                    }
                }
            }
            catch (Exception)
            {
                iSuccess = false;
            }

            return iSuccess;
        }
        #endregion

        private void Clear()
        {
            txtEmail.Value = string.Empty;
            txtName.Value = string.Empty;
            txtPhone.Value = string.Empty;
            txtPrice.Value = string.Empty;
            txtQuantity.Value = string.Empty;
            txtTotal.Value = string.Empty;
            ddlProductName.SelectedIndex = 0;
        }

        private bool CheckNull(string fullName, string email, string telephone, string productName, string quantity, string price)
        {
            bool iSuccess = false;
            if (!string.IsNullOrEmpty(fullName) || !string.IsNullOrEmpty(email) ||
                !string.IsNullOrEmpty(telephone) || !string.IsNullOrEmpty(productName) ||
                !string.IsNullOrEmpty(quantity) || !string.IsNullOrEmpty(price))
            {
                iSuccess = true;
                return iSuccess;
            }
            else
                return iSuccess;
        }
    }
}