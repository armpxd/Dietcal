using System.Linq;
using DietcalAPI.Data;
using DietcalAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace DietcalAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController : ControllerBase
    {
        private readonly ContextDietcal _dbDietcal;

        public LoginController (ContextDietcal data)
        {
            _dbDietcal = data;
        }
        [HttpPost]
        public ActionResult Register([FromBody] Usuario user)
        {
            var target = _dbDietcal.Usuario.FirstOrDefault(x => x.Email == user.Email);

            if (target == null)
            {
                _dbDietcal.Add(user);
                _dbDietcal.SaveChanges();
            }
            else
            {
                return BadRequest("El usuario existe");
            }
            return Ok();
        }
        
    }
}