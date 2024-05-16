﻿namespace Shop.Services.Dto
{
    public record ProductDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public string Code { get; set; }
    }
}
