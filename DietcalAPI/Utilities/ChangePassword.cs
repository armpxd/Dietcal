using System;
using System.Text;

namespace DietcalAPI.Utilities
{
    public class ChangePassword
    {
        public static string newpassword()
        {
        var lengt = 6;
        const string valid = "@.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < lengt--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
        }

        
        
    }
}