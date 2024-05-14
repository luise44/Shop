using Microsoft.AspNetCore.Mvc;
using Shop.Services.Dto;
using Shop.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

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

        // GET api/<CustomerController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<CustomerController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<CustomerController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<CustomerController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
