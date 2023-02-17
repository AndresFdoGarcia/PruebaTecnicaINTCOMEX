using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaINTCOMEX.Data.Model
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SKU { get; set; }
        public string MPN { get; set; }
        public List<string> Categorias { get; set; }
        public List<string> SubCategorias { get; set; }
        public List<Atributes> Atributos { get; set; }

    }

    public class Atributes
    {
        public string name { get; set; }
        public string data { get; set; }
    }
}
