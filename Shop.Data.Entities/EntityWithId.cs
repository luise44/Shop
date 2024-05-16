using Data.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.Data.Entities
{
    public class EntityWithId : IEntityWithId
    {
        private int _id;
        public int Id {
            get => _id;
            set => _id = value;
        }
    }
}
