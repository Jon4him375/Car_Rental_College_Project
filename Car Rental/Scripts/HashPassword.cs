using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace Car_Rental.Scripts
{
    public class HashPassword
    {
        public string HashPwd(string password) 
        {
            using (var sha = new System.Security.Cryptography.SHA512Managed())
            {
                byte[] textBytes = System.Text.Encoding.UTF8.GetBytes(password);
                byte[] hashBytes = sha.ComputeHash(textBytes);

                string hash = BitConverter
                    .ToString(hashBytes)
                    .Replace("-", string.Empty);
                return hash;
            }
        }
    }
}