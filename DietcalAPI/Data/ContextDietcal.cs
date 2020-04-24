using DietcalAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace DietcalAPI.Data
{
    public class ContextDietcal : DbContext
    {
        public ContextDietcal(DbContextOptions<ContextDietcal> options)
        :base(options)
        {
            
        }

        public DbSet<Usuario> Usuario {get; set;}
    }
}