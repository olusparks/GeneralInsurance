using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Description;
using System.Web;

namespace GenericInsurance.DataObjects
{
    public static class Utility
    {
        public static ClientCredentials getCredentials()
        {
            ClientCredentials cred = new ClientCredentials();
            cred.UserName.UserName = "jide@genericinsurancedemo.onmicrosoft.com";
            cred.UserName.Password = "pass@word1";
            return cred;
        }
    }
}