using Microsoft.AspNetCore.Mvc;
using Shop.Services.Dto;
using Shop.Services.Interfaces;

namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController(ICustomerService customerService) : ControllerBase
    {
        private readonly ICustomerService _customerService = customerService;

        // GET: api/<CustomerController>
        [HttpGet("{pageNumber}/{pageSize}/{searchString}")]
        public async Task<IEnumerable<CustomerDto>> Get(int pageNumber, int pageSize, string searchString)
        {
            return await _customerService.GetCustomersByName(
                pageNumber,
                pageSize,
                searchString);
        }
    }
}
