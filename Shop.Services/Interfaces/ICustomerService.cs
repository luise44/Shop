using Shop.Services.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Interfaces
{
    public interface ICustomerService
    {
        Task<List<CustomerDto>> GetCustomersByName(int pageNumber, int pageSize, string searchString);
    }
}
