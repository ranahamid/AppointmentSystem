using Shodypati.DAL;
using Shodypati.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shodypati.Controllers
{
    [Authorize(Roles = "Admin")]
    [ExceptionHandler]
    public class DashboardController : BaseController
    {
        public DashboardController()
        {
            Db = new ShodypatiDataContext();
        }
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }

        public int NewDoctor30Days()
        {
            DateTime startDate = DateTime.UtcNow;
            DateTime expiryDate = startDate.AddDays(-30);

            var doctorCount = Db.DoctorTbls.Where(x => x.CreatedOnUtc >= expiryDate).ToList().Count();
            return doctorCount;

        }
        public int NewAppointments30Days()
        {
            DateTime startDate = DateTime.UtcNow;
            DateTime expiryDate = startDate.AddDays(-30);
            var staringVisitTimeDay =long.Parse( ToUnixTime(expiryDate).ToString());
            
            var appointmentCount = Db.DoctorAppointmentTbls.Where(x =>  x.StartTime >= staringVisitTimeDay).ToList().Count();
            return appointmentCount;

        }
        public int UpComingAppointments()
        {
            DateTime startDate = DateTime.UtcNow;
            var staringVisitTimeDay = ToUnixTime(startDate);

            var appointmentCount = Db.DoctorAppointmentTbls.Where(x => x.StartTime >= staringVisitTimeDay).ToList().Count();
            return appointmentCount;
        }

        public int TotalDoctors()
        {
            var doctorCount = Db.DoctorTbls.ToList().Count();
            return doctorCount;

        }
        public int TotalAppointments()
        {
            DateTime startDate = DateTime.UtcNow;
            DateTime expiryDate = startDate.AddDays(-30);

            var doctorCount = Db.DoctorAppointmentTbls.ToList().Count();
            return doctorCount;

        }
        public int TotalFinishedAppointments()
        {
            DateTime startDate = DateTime.UtcNow;
            var staringVisitTimeDay = ToUnixTime(startDate);

            var appointmentCount = Db.DoctorAppointmentTbls.Where(x => x.StartTime < staringVisitTimeDay).ToList().Count();
            return appointmentCount;

        }

        public int TotalLogs()
        {
            var doctorCount = Db.LogTbls.ToList().Count();
            return doctorCount;

        }
        public int TotalWorkingAreas()
        {
            var doctorCount = Db.DoctorWorkingAreaTbls.ToList().Count();
            return doctorCount;

        }
    }
}