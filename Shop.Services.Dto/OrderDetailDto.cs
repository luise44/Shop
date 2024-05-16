using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Dto
{
    public record OrderDetailDto
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
