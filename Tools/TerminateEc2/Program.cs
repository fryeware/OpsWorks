using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;

namespace TerminateEc2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Creating web service client");
            RDSHelper.RDSProvisioningClient rdsHelper = new RDSHelper.RDSProvisioningClient();
            Console.WriteLine("Getting Ec2 Id from metadata");
            string instanceId = getInstanceId();
            Console.WriteLine("Making web request with params: " + instanceId);
            rdsHelper.TerminateEc2(instanceId);
            Console.WriteLine("Complete");
        }

        private static string getInstanceId()
        {
            WebClient webClient = new WebClient();
            string rc = webClient.DownloadString("http://instance-data/latest/meta-data/instance-id");
            return rc;
        }
    }
}
