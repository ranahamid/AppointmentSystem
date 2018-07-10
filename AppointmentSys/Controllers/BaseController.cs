using Newtonsoft.Json;
using AppointmentSys.DAL;
using AppointmentSys.Filters;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;
using AppointmentSys.Models;
using Microsoft.AspNet.Identity.Owin;
using log4net;
using System.Reflection;
using Microsoft.Owin.Security;
using System.Text.RegularExpressions;
using Microsoft.AspNet.Identity;
using System.Net.Mail;
using System.Text;

namespace AppointmentSys.Controllers
{
    [ExceptionHandler]
    public class BaseController:Controller
    {
        public AppointmentSysDataContext Db = new AppointmentSysDataContext();
        public HttpClient client;
        public string url;
        public string baseUrl = ConfigurationManager.AppSettings["webapibaseurl"];
   

        /// <summary>
        /// caching implementation
        /// </summary>
        public ICacheStorage CacheStorage = new HttpContextCacheAdapter();
        //public ICacheStorage _cacheStorage = new NullObjectCache(); 


        public static readonly log4net.ILog Log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public BaseController()
        {
            client = new HttpClient {BaseAddress = new Uri(baseUrl)};
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.Timeout = TimeSpan.FromMinutes(30);
            //api url
      
        }

        public string GetTimeFromTimeSpan(TimeSpan start, TimeSpan end)
        {
            var timeStart = start.ToString(@"hh\:mm\:ss");
            var timeEnd = end.ToString(@"hh\:mm\:ss");
            return timeStart + " - " + timeEnd;
        }

        #region  dcoctorappointment        
        public async Task<List<SelectListItem>> GetAllDoctorWorkingTypes()
        {
            url = baseUrl + "api/DoctorWorkingAreaApi/GetAllDoctorWorkingAreasSelectList";
            var responseMessage = await client.GetAsync(url);

            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<SelectListItem>>(responseData);
                return entity;
            }
            return null;
        }

        public List<SelectListItem> GetAllWeekDaysName()
        {
            List<SelectListItem> days = new List<SelectListItem>
            {
                new SelectListItem { Value = "0", Text = "Sunday"},
                new SelectListItem { Value = "1", Text = "Monday"},
                new SelectListItem { Value = "2", Text = "Tuesday"},
                new SelectListItem { Value = "3", Text = "Wednesday"},
                new SelectListItem { Value = "4", Text = "Thursday"},
                new SelectListItem { Value = "5", Text = "Friday"},
                new SelectListItem { Value = "6", Text = "Saturday"},

            };
            return days;
        }

        public List<SelectListItem> GetAllSearchType()
        {
            List<SelectListItem> days = new List<SelectListItem>
            {
                new SelectListItem { Value = "0", Text = "All"},
                new SelectListItem { Value = "1", Text = "Today"},
                new SelectListItem { Value = "2", Text = "Next 7 Days"},
                new SelectListItem { Value = "3", Text = "Next 30 Days"},
                new SelectListItem { Value = "4", Text = "Previous 7 Days"},
                new SelectListItem { Value = "5", Text = "Previous 30 Days"},               

            };
            return days;
        }

        public List<string> GetListFromCommaSeparatedIntList(string list)
        {
            List<string> daysName = new List<string>();
            try
            {
                if (list != string.Empty)
                {

                    var daysIds = list.Split(',').Select(int.Parse).ToList();

                    foreach (var item in daysIds)
                    {
                        daysName.Add(item.ToString());
                    }
                }
            }
            catch (Exception)
            {
                return daysName;
            }
            return daysName;
        }


        public string GetHiddenDaysFromActiveDays(string dayLists)
        {
            StringBuilder daysName = new StringBuilder();
            try
            {
                if (dayLists != string.Empty)
                {
                    var daysIds = dayLists.Split(',').Select(int.Parse).ToList();
                    var numberList = Enumerable.Range(0, 7).ToList();
                    var resultList = numberList.Except(daysIds);
                    foreach (var item in resultList)
                    {
                        if (daysName.ToString() != string.Empty)
                        {
                            daysName.Append("," + item);
                        }
                        else
                        {
                            daysName.Append(item);
                        }
                    }
                }
            }
            catch (Exception)
            {
                return daysName.ToString();
            }
            return daysName.ToString();
        }



        public string GetDaysNameFromNumbers(string dayLists)
        {
            StringBuilder daysName = new StringBuilder();
            try
            {
                if (dayLists != string.Empty)
                {

                    var daysIds = dayLists.Split(',').Select(int.Parse).ToList();

                    foreach (var item in daysIds)
                    {
                        string dayInStr = GetDayByInt(item);

                        if (daysName.ToString() != string.Empty)
                        {
                            daysName.Append("," + dayInStr);
                        }
                        else
                        {
                            daysName.Append(dayInStr);
                        }
                    }
                }
            }
            catch (Exception )
            {
                return daysName.ToString();
            }
            return daysName.ToString();
        }

        public string GetDayByInt(int dayNumber)
        {
            switch (dayNumber)
            {

                case 0:
                    return "রবিবার";

                case 1:
                    return "সোমবার";

                case 2:
                    return "মঙ্গলবার";

                case 3:
                    return "বুধবার";


                case 4:
                    return "বৃহস্পতিবার";

                case 5:
                    return "শুক্রবার";

                case 6:
                    return "শনিবার";

                default:
                    return string.Empty;

            }
        }

        /// <summary>
        /// Dates  represented as Unix timestamp 
        /// with slight modification: it defined as the number
        /// of seconds that have elapsed since 00:00:00, Thursday, 1 January 1970.
        /// To convert it to .NET DateTime use following extension
        /// </summary>
        /// <param name="time">DateTime</param>
        /// <returns>Return as DateTime of uint time
        /// </returns>
        public DateTime ToDateTime(uint time)
        {
            return new DateTime(1970, 1, 1).AddSeconds(time);
        }
        public DateTime ToDateTime(ulong time)
        {
            return new DateTime(1970, 1, 1).AddSeconds(time/1000);
        }
        /// <summary>
        /// Dates  represented as Unix timestamp 
        /// with slight modification: it defined as the number
        /// of seconds that have elapsed since 00:00:00 Thursday, 1 January 1970.
        /// To convert .NET DateTime to Unix time use following extension
        /// </summary>
        /// <param name="time">DateTime</param>
        /// <returns>
        /// Return as uint time of DateTime
        /// </returns>

        public uint ToUnixTime(DateTime time)
        {
            return (uint)time.Subtract(new DateTime(1970, 1, 1)).TotalSeconds;
        }

        #endregion

        #region  user

        public ApplicationUser GetUserInfo(ApplicationUserManager UserManager, Guid? id)
        {
            ApplicationUser user = UserManager.FindById(id.ToString());
            if (user.IsFakeEmail)
                user.Email = null;
            return user;
        }

        #endregion


        #region Email
        public bool SendEmailBase(string receiver, string subject, string body)
        {
            var destination = receiver;
            MailMessage msg = new MailMessage();
            msg.To.Add(destination);
            msg.From = new System.Net.Mail.MailAddress(
                             ConfigurationManager.AppSettings["FromAddress"], ConfigurationManager.AppSettings["TeamName"]);
            msg.Subject = subject;

            msg.Body = body;

            SmtpClient smtpclient = new SmtpClient
            {
                UseDefaultCredentials = true,
                Host = ConfigurationManager.AppSettings["BaseMailHost"],
                Port = Int32.Parse(ConfigurationManager.AppSettings["Port"]),
                EnableSsl = false,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential
                (
                    ConfigurationManager.AppSettings["mailAccount"],
                    ConfigurationManager.AppSettings["mailPassword"]
                ),
                Timeout = 20000
            };

            try
            {
                smtpclient.Send(msg);
                return true;

            }
            catch (Exception )
            {
                return false;
            }

        }
        #endregion

        #region Basic
        private string SwitchEngBan(string number)
        {
            string en = "1234567890.,";
            string bn = "১২৩৪৫৬৭৮৯০.,";
            return number.Select(o => en.Contains(o)
                            ? bn.Substring(en.IndexOf(o), 1)
                            : en.Substring(bn.IndexOf(o), 1))
                            .Aggregate((a, b) => a + b);
        }
        #endregion

        #region usermanager, rolemanager
        public BaseController(ApplicationUserManager userManager, ApplicationRoleManager roleManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            RoleManager = roleManager;
            SignInManager = signInManager;
        }

        public ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get => _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            private set => _userManager = value;
        }
        public ISecureDataFormat<AuthenticationTicket> AccessTokenFormat { get;  set; }
        public ApplicationRoleManager _roleManager;
        public ApplicationRoleManager RoleManager
        {
            get => _roleManager ?? HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            private set => _roleManager = value;
        }

        private ApplicationSignInManager _signInManager;

        public ApplicationSignInManager SignInManager
        {
            get => _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            private set => _signInManager = value;
        }
        #endregion

        #region Account
        public IdentityResult CreatePatientUser(ApplicationUser user, string password, ApplicationUserManager UserManager)
        {
            IdentityResult result = UserManager.Create(user, password);
            if (!result.Succeeded)
            {
                return result;
            }
            
            //customer role
            var role = "Patient";
            var resultRole = UserManager.AddToRole(user.Id, role);
            return result;
        }

        public IdentityResult CreateCustomerUser(ApplicationUser user, string password, ApplicationUserManager UserManager)
        {
            IdentityResult result = UserManager.Create(user, password);
            if (!result.Succeeded)
            {
                return result;
            }
            //customer role
            var role = "Customer";
            var resultRole = UserManager.AddToRole(user.Id, role);
            return result;
        }

        public async Task<string> GetUserNameAsync(LoginViewModel model, ApplicationUserManager UserManager)
        {
            if (model.UserName.IndexOf('@') > -1)
            {
                //Validate email format
                string emailRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                                       @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                                          @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.UserName))
                {
                    ModelState.AddModelError("UserName", "Email is not valid");
                }
            }
            else
            {
                //validate mobile format
                string emailRegex = @"^[+0-9]*$";
                Regex re = new Regex(emailRegex);
                if (!re.IsMatch(model.UserName))
                {
                    ModelState.AddModelError("UserName", "Username is not valid");
                }
            }

            var userName = model.UserName;
            if (userName.IndexOf('@') > -1)
            {
                var user = await UserManager.FindByEmailAsync(model.UserName);

                if (user == null)
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return null;
                }
                else
                {
                    userName = user.UserName;
                    // userName = user.PhoneNumber;
                }
            }

            return userName;
        }


        public ApplicationUser GetApplicationUserPatient(RegisterPatient model)
        {
            bool isFakeMail = false;
            if (string.IsNullOrEmpty(model.Email))
            {
                model.Email = GetGeneratedEmail();
                isFakeMail = true;
            }

            var user = new ApplicationUser()
            {
                UserName        = model.PhoneNumber,
                Email           = model.Email,
                PhoneNumber     = model.PhoneNumber,
                Address         = model.Address,
                Name            = model.Name,
                DoctorName      = model.DoctorName,
                HospitalName    = model.HospitalName,
                Description     = model.Description,
                IsFakeEmail = isFakeMail,
            };
            return user;
        }


        public ApplicationUser GetApplicationUser(RegisterViewModel model)
        {
            bool isFakeMail = false;
            if (string.IsNullOrEmpty(model.Email))
            {
                model.Email = GetGeneratedEmail();
                isFakeMail = true;
            }

            var user = new ApplicationUser()
            {
                UserName = model.PhoneNumber,
                Email = model.Email,
                PhoneNumber = model.PhoneNumber,
                Address = model.Address,
                Name = model.Name,
                IsFakeEmail= isFakeMail,
            };
            return user;
        }


        public string GetGeneratedEmail()
        {
            string email = string.Empty;

            email= "temp" + GetRandomNumber() +System.DateTime.Now.Ticks+ "@gmail.com";

            return email;
        }


        // Generate random number for email address
        public static int GetRandomNumber()
        {
            return new Random().Next(100000, 100000000);
        }

        #endregion

    

  

        #region all
        public List<SelectListItem> SetSelectedItem(List<SelectListItem> items, int? id)
        {
            List<SelectListItem> tempItems = new List<SelectListItem>();

            foreach (var item in items)
            {
                tempItems.Add(new SelectListItem
                {
                    Text = item.Text,
                    Value = item.Value,
                    Selected = (String.Equals(item.Value, id.ToString(), StringComparison.CurrentCultureIgnoreCase)) ? true : false
                });
            }
            return tempItems;
        }
        #endregion



    }
}