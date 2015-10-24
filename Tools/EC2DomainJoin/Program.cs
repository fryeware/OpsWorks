using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Management.Automation;
using System.Collections.ObjectModel;

namespace EC2DomainJoin
{
    class Program
    {
        static void Main(string[] args)
        {
            int rdsCount = 0;
            string script = "\"hi\" | out-file $Env:TEMP\\test.txt";
            PowerShell ps = PowerShell.Create();
            ps.AddScript(script);
            ps.Invoke();
            ps.Dispose();
        }

    }
}
