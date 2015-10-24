using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;

namespace RemoveSessionHost
{
    class Program
    {
        static void Main(string[] args)
        {
            string script = "Remove-RDSessionHost -SessionHost " + Environment.GetEnvironmentVariable("COMPUTERNAME") + ".safeweb.aws.net -ConnectionBroker safeweb-rdscb3.safeweb.aws.net -Force";
            PowerShell ps = PowerShell.Create();
            ps.AddScript(script);
            ps.Invoke();
            ps.Dispose();

            script = "Remove-RDServer -Server " + Environment.GetEnvironmentVariable("COMPUTERNAME") + ".safeweb.aws.net -Role RDS-RD-Server -ConnectionBroker safeweb-rdscb3.safeweb.aws.net -Force";
            ps = PowerShell.Create();
            ps.AddScript(script);
            ps.Invoke();
            ps.Dispose();
        }
    }
}
