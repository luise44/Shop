using AutoMapper;
using Data.Repositories.Interfaces;
using Shop.Services.Dto;
using Shop.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Services
{
    public class CustomerService(
        ICustomerRepository customerRepository,
        IMapper mapper
    ) : ICustomerService
    {
        private readonly ICustomerRepository _customerRepository = customerRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<CustomerDto>> GetCustomersByName(
            int pageNumber,
            int pageSize,
            string searchString)
        {
            return (await _customerRepository.GetCustomersByName(pageNumber,pageSize,searchString))
                .Select(x=> _mapper.Map<CustomerDto>(x))
                .ToList();
        }
    }
}
