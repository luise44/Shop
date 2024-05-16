using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Dto
{
    public record OrderDto
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public IList<OrderDetailDto> OrderDetails { get; set; }
    }
}
