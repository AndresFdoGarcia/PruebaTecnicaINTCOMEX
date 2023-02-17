using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaINTCOMEX.Data.Model;
using PruebaINTCOMEX.Data.MySQL.Contract;

namespace PruebaINTCOMEX.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductConfiguration _productConfiguration;

        public ProductController(IProductConfiguration productConfiguration)
        {
            _productConfiguration = productConfiguration;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            return Ok(await _productConfiguration.GetAllProducts());
        }

        [HttpPost]
        public async Task<IActionResult> GetProductByData([FromBody] RequestApi request)
        {
            return Ok(await _productConfiguration.GetProdByData(request));
        }
    }
}
