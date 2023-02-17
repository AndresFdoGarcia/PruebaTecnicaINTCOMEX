using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaINTCOMEX.Data.Model
{
    public class RequestApi
    {
        public TypeCon typeCon { get; set; }
        public string Name { get; set; }
        public int Size { get; set; }
        public int Pag { get; set; }
    }

    public enum TypeCon
    {
        CAT,
        SUB
    }
}
