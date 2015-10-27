using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;

namespace RemoveSessionHost
{
    class Program
    {
        static void Main(string[] args)
        {
            //string script = "Remove-RDSessionHost -SessionHost " + Environment.GetEnvironmentVariable("COMPUTERNAME") + ".safeweb.aws.net -ConnectionBroker safeweb-rdscb3.safeweb.aws.net -Force";
            //PowerShell ps = PowerShell.Create();
            //ps.AddScript(script);
            //ps.Invoke();
            //ps.Dispose();

            //script = "Remove-RDServer -Server " + Environment.GetEnvironmentVariable("COMPUTERNAME") + ".safeweb.aws.net -Role RDS-RD-Server -ConnectionBroker safeweb-rdscb3.safeweb.aws.net -Force";
            //ps = PowerShell.Create();
            //ps.AddScript(script);
            //ps.Invoke();
            //ps.Dispose();

            //WebRequest request = WebRequest.Create("http://safeweb-wf1:8080/RemoveSafewebServer/" + Environment.GetEnvironmentVariable("COMPUTERNAME").ToLower() + ".safeweb.aws.net");
            //request.Credentials = CredentialCache.DefaultCredentials;
            //WebResponse response = request.GetResponse();
            Console.WriteLine("WP1");
            RDSHelper.RDSProvisioningClient rdsHelper = new RDSHelper.RDSProvisioningClient();

            Console.WriteLine("WP2");
            string cname = Environment.GetEnvironmentVariable("COMPUTERNAME") + ".safeweb.aws.net";
            rdsHelper.RemoveMeLS(cname);
            Console.WriteLine("WP3");
        }
    }
}
