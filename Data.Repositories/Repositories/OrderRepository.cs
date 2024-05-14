﻿using Data.Repositories.Interfaces;
using Shop.Data;
using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Repositories
{
    public class OrderRepository(ShopContext context) : 
        BaseRepository<Order, ShopContext>(context), IOrderRepository
    {
    }
}
