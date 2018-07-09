using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppointmentSys.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Threading.Tasks;
using AppointmentSys.DAL;
using System.Configuration;
using AppointmentSys.Filters;


namespace AppointmentSys.Controllers
{
    [ExceptionHandler]
    public class HomeController : BaseController
    {
        
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Dashboard");
        }
    }
}
