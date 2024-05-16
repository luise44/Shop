using Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Shop.Data;
using Shop.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories.Repositories
{
    public class BaseRepository<T, TContext> : IBaseRepository<T> 
        where T : EntityWithId, new()
        where TContext : DbContext
    {
        readonly TContext _context;
        private readonly DbSet<T> _dbSet;

        public BaseRepository(TContext context)
        {
            _dbSet = context.Set<T>();
            _context = context;
        }

        public T GetById(int id)
        {
            return _context
                .Set<T>()
                .First(x => x.Id == id);
        }

        public async Task<IList<T>> GetAll()
        {
            return await _context
                .Set<T>()
                .ToListAsync();
        }

        public async Task Add(T Entity)
        {
            _dbSet.Add(Entity);
            await _context.SaveChangesAsync();
        }

        public async Task Update(T Entity)
        {
            _dbSet.Update(Entity);
            await _context.SaveChangesAsync();
        }

        public async Task Delete(T Entity)
        {
            _dbSet.Remove(Entity);
            await _context.SaveChangesAsync();
        }

        public async Task<int> Count()
        {
            return await _context
                .Set<T>()
                .CountAsync();
        }

    }
}
