using Microsoft.AspNetCore.Mvc;
using Shop.Services.Dto;
using Shop.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController(
        IOrderService orderService
    ) : ControllerBase
    {
        private readonly IOrderService _orderService = orderService;

        // POST api/<OrderController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] OrderDto order)
        {
            try
            {
                await _orderService.CreateOrder(order);
                return Ok();
            } catch (ApplicationException ex )
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
