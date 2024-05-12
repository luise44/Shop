using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Data.Entities
{
    public class Order : BaseEntity
    {
        public int Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public Decimal Total { get; set; }
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        public IList<OrderDetail> OrderDetails { get; set; }
    }
}
