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
    public class ProductService(
        IProductRepository productRepository,
        IMapper mapper
        ) : IProductService
    {
        private readonly IProductRepository _productRepository = productRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<ProductsPaginatedDto> GetAllProductsPaginated(int pageNumber, int pageSize)
        {
            var totalRecords = await _productRepository.Count();

            var products = (await _productRepository
                .GetAll(pageNumber, pageSize))
                .Select(x => _mapper.Map<ProductDto>(x))
                .ToList();

            return new ProductsPaginatedDto
            { 
                PageNumber = pageNumber,
                TotalPages = totalRecords / pageSize,
                TotalRecords = totalRecords,
                Products = products
            }; 
        }
    }
}
