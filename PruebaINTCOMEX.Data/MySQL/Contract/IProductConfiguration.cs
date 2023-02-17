using PruebaINTCOMEX.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaINTCOMEX.Data.MySQL.Contract
{
    public interface IProductConfiguration
    {
        Task<IEnumerable<Product>> GetAllProducts();
        Task<IEnumerable<Product>> GetProdByData(RequestApi request);

    }
}
