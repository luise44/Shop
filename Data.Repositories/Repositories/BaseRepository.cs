using Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Repositories
{
    public class BaseRepository<T, TContext> : IBaseRepository<T> 
        where T : BaseEntity, new()
        where TContext : DbContext
    {
        readonly TContext _context;
        private readonly DbSet<T> _dbSet;

        public BaseRepository(TContext context)
        {
            _dbSet = context.Set<T>();
            _context = context;
        }

        public void Add(T Entity)
        {
            _dbSet.Add(Entity);
            _context.SaveChanges();
        }

        public void Update(T Entity)
        {
            _dbSet.Update(Entity);
            _context.SaveChanges();
        }

        public void Delete(T Entity)
        {
            _dbSet.Remove(Entity);
            _context.SaveChanges();
        }

    }
}
