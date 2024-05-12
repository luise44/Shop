using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Interfaces
{
    public interface IBaseRepository<T> where T : IBaseEntity
    {
        void Add(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
