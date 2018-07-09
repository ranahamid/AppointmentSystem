using AppointmentSys.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace AppointmentSys.DAL
{
    public interface IAccountAccessRepository<TEntity, in TPrimaryKey> where TEntity : class
    {
        
        //custom
        UserStatusInfo Register(RegisterViewModel model, ApplicationUserManager UserManager);
        UserStatusInfo RegisterPatient(RegisterPatient model, ApplicationUserManager UserManager);

        Task<UserStatusInfo> Login(LoginViewModel model, ApplicationSignInManager SignInManager, ApplicationUserManager UserManager);

    }
}
