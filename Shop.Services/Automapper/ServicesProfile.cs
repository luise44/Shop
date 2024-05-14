using AutoMapper;
using Shop.Data.Entities;
using Shop.Services.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Automapper
{
    public class ServicesProfile : Profile
    {
        public ServicesProfile()
        {
            CreateMap<Product, ProductDto>();
            CreateMap<Customer, CustomerDto>();
        }
    }
}
