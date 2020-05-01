using System.Net.Mail;
using DietcalAPI.Models;
using Microsoft.Extensions.Configuration;
using System.Net;
using System;
using DietcalAPI.Utilities;

namespace DietcalAPI.Services
{
    public class EmailService
    {
        private IConfiguration _configuration;

        public EmailService (IConfiguration Iconfig)
        {
            _configuration = Iconfig;
        }
        public string RecoverPassword (string to)
        {
            string NewPassword= ChangePassword.newpassword();
            using (MailMessage message = new MailMessage (_configuration.GetSection("MailSettings").GetSection("FromMail").Value,to))
            {
                message.Subject = "Usted ha solicitado un cambio de contraseña";
                message.Body = NewPassword;
                message.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient ();
                smtp.Host = _configuration.GetValue<string>("MailSettings:Host");
                smtp.Port = int.Parse(_configuration.GetSection("MailSettings").GetSection("Port").Value);
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential(_configuration.GetSection("MailSettings").GetSection("Username").Value,
                                                                    _configuration.GetSection("MailSettings").GetSection("Password").Value);
                smtp.Send(message);
                System.Threading.Thread.Sleep(3000);
            }

            return NewPassword;
        }
    }
}