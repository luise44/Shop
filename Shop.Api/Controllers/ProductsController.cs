using Microsoft.AspNetCore.Mvc;
using Shop.Services.Dto;
using Shop.Services.Interfaces;

namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController(IProductService productService) : ControllerBase
    {
        private readonly IProductService _productService = productService;

        // GET: api/<ProductsController>
        [HttpGet("{pageNumber}/{pageSize}")]
        public async Task<IEnumerable<ProductDto>> Get(int pageNumber, int pageSize)
        {
            return await _productService
                .GetAllProducts(pageNumber, pageSize);
        }

        // GET api/<ProductsController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProductsController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ProductsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProductsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
