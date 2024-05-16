using Data.Repositories.Interfaces;
using Shop.Data.Entities;
using Shop.Services.Dto;
using Shop.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Services
{
    public class OrderService(
        IOrderRepository orderRepository,
        IProductRepository productRepository
    ) : IOrderService
    {
        private readonly IOrderRepository _orderRepository = orderRepository;
        private readonly IProductRepository _productRepository = productRepository;

        public async Task CreateOrder(OrderDto order)
        {
            var sequence = 0;
            var newDetails = new List<OrderDetail>();

            foreach (var orderDetail in order.OrderDetails)
            {
                sequence++;
                var product = _productRepository.GetById(orderDetail.ProductId);

                if (orderDetail.Quantity > product.Stock)
                {
                    throw new ApplicationException(
                        $"The article {product.Title} with code {product.Code} has not stock available for this order, current stock is {product.Stock}..!"
                    );
                }
                else {
                    product.Stock -= orderDetail.Quantity;
                    await _productRepository.Update(product);
                }

                var newOrderDetail = new OrderDetail
                {
                    Sequence = sequence,
                    ProductId = product.Id,
                    Quantity = orderDetail.Quantity,
                    Price = product.Price,
                    DetailTotal = orderDetail.Quantity * product.Price
                };

                newDetails.Add(newOrderDetail);
            }

            var newOrder = new Order
            {
                CreatedDate = DateTime.Now,
                CustomerId = order.CustomerId,
                OrderDetails = newDetails,
                Total = newDetails.Sum(x=> x.DetailTotal)
            };
            await _orderRepository.Add(newOrder);
        }
    }
}
