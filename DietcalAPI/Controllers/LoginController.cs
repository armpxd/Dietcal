using System.Linq;
using DietcalAPI.Data;
using DietcalAPI.Models;
using DietcalAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace DietcalAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly ContextDietcal _dbDietcal;
        private IConfiguration _configuration;
        public LoginController (ContextDietcal data, IConfiguration Iconfig)
        {
            _dbDietcal = data;
            _configuration = Iconfig;
        }
        
        [HttpPost]
        public ActionResult Register([FromBody] Usuario user)
        {
            var target = _dbDietcal.Usuario.FirstOrDefault(x => x.Email == user.Email);

            if (target == null)
            {
                user.TemporyPassword = false;
                _dbDietcal.Usuario.Add(user);
                _dbDietcal.SaveChanges();
            }
            else
            {
                return BadRequest("El usuario existe");
            }
            return Ok();
        }

        [HttpPost]
        public ActionResult ForgetPassword([FromForm]string email)
        {
            var target = _dbDietcal.Usuario.FirstOrDefault( x => x.Email == email);

            if (target == null)
            {
                return NotFound();
            }
            EmailService newpassword = new EmailService(_configuration);
            var password = newpassword.RecoverPassword(email);

            target.Contraseña = password;
            target.TemporyPassword = true;
            _dbDietcal.SaveChanges();
            return Ok();
        }
        
    }
}