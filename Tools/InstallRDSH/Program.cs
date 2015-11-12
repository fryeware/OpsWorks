using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;
using System.Collections.ObjectModel;
using System.Net;

namespace InstallRDSH
{
    class Program
    {
        static void Main(string[] args)
        {
            string script = "\"this is where we will install session hosting\" | out-file $Env:TEMP\\InstallRDSH.txt";
            PowerShell ps = PowerShell.Create();
            ps.AddScript(script);
            ps.Invoke();
            ps.Dispose();
        }

        private static string getInstanceId()
        {
            WebClient webClient = new WebClient();
            string rc = webClient.DownloadString("http://instance-data/latest/meta-data/instance-id");
            return rc;
        }
    }
}
