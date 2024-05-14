using Shop.Services.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Interfaces
{
    public interface IProductService
    {
        Task<List<ProductDto>> GetAllProducts(int pageNumber, int pageSize);
    }
}
