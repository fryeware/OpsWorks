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
            OpsWorksServer server = new OpsWorksServer();
            server.Name = Environment.GetEnvironmentVariable("COMPUTERNAME");
            server.InstanceId = getInstanceId();
            Console.WriteLine("attempting to call DELETE method.  params:  NAME: " + server.Name + " id: " + server.InstanceId);
            doDELETE(server);
            Console.WriteLine("Complete");
        }

        static async Task doDELETE(OpsWorksServer serverObj)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeObject(serverObj);
            WebClient web = new WebClient();
            //web.UploadString("http://safeweb-wf1/OpsWorksApi/api/SessionHost?serverObj=" + json, "DELETE", json);
            web.UploadString("http://safeweb-wf1/OpsWorksApiDev/api/SessionHost?serverObj=" + json, "DELETE", json);
        }

        private static string getInstanceId()
        {
            WebClient webClient = new WebClient();
            string rc = webClient.DownloadString("http://instance-data/latest/meta-data/instance-id");
            return rc;
        }
    }

    public class OpsWorksServer
    {
        public string Name { get; set; }
        public string InstanceId { get; set; }
        public string Broker { get; set; }
    }
}

