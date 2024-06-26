﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Services.Dto
{
    public record ProductsPaginatedDto
    {
        public int PageNumber { get; set; }
        public int TotalPages { get; set; }
        public int TotalRecords { get; set; }
        public IReadOnlyList<ProductDto> Products { get; set; }
    }
}
