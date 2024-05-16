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
        public async Task<ProductsPaginatedDto> Get(int pageNumber, int pageSize)
        {
            return await _productService
                .GetAllProductsPaginated(pageNumber, pageSize);
        }
    }
}
