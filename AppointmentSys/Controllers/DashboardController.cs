using AppointmentSys.DAL;
using AppointmentSys.Filters;
using AppointmentSys.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppointmentSys.Controllers
{
    [Authorize(Roles = "Admin")]
    [ExceptionHandler]
    public class DashboardController : BaseController
    {
        public DashboardController()
        {
            Db = new AppointmentSysDataContext();
        }
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }

        public int NewDoctor30Days()
        {
            int doctorCount = 0;
            object cachedObjectData = ContextCache.Get("NewDoctor30Days");
            if (cachedObjectData != null)
            {
                doctorCount = (int)cachedObjectData;

            }
            else
            {

                DateTime startDate = DateTime.UtcNow;
                DateTime expiryDate = startDate.AddDays(-30);
                doctorCount = Db.DoctorTbls.Where(x => x.CreatedOnUtc >= expiryDate).ToList().Count();
                ContextCache.MaxOneMinute("NewDoctor30Days", doctorCount);
            }
            return doctorCount;

        }
        public int NewAppointments30Days()
        {
            int appointmentCount = 0;
            object cachedObjectData = ContextCache.Get("NewAppointments30Days");
            if (cachedObjectData != null)
            {
                appointmentCount = (int)cachedObjectData;

            }
            else
            {

                DateTime startDate = DateTime.UtcNow;
                DateTime expiryDate = startDate.AddDays(-30);
                var staringVisitTimeDay = long.Parse(ToUnixTime(expiryDate).ToString());

                appointmentCount = Db.DoctorAppointmentTbls.Where(x => x.StartTime >= staringVisitTimeDay).ToList().Count();
                ContextCache.MaxOneMinute("NewDoctor30Days", appointmentCount);
            }

            return appointmentCount;

        }
        public int UpComingAppointments()
        {
            int appointmentCount = 0;
            object cachedObjectData = ContextCache.Get("NewAppointments30Days");
            if (cachedObjectData != null)
            {
                appointmentCount = (int)cachedObjectData;

            }
            else
            {
                DateTime startDate = DateTime.UtcNow;
                var staringVisitTimeDay = ToUnixTime(startDate);

                appointmentCount = Db.DoctorAppointmentTbls.Where(x => x.StartTime >= staringVisitTimeDay).ToList().Count();
                ContextCache.MaxOneMinute("NewAppointments30Days", appointmentCount);
            }
            return appointmentCount;
        }

        public int TotalDoctors()
        {
            int doctorCount = 0;           
            object cachedObjectData = ContextCache.Get("TotalDoctors");
            if (cachedObjectData != null)
            {
                doctorCount = (int)cachedObjectData;

            }
            else
            {
                doctorCount = Db.DoctorTbls.ToList().Count();
                 ContextCache.MaxOneMinute("TotalDoctors", doctorCount);
            }
            return doctorCount;

        }
        public int TotalAppointments()
        {
            int doctorCount = 0;
            object cachedObjectData = ContextCache.Get("TotalAppointments");
            if (cachedObjectData != null)
            {
                doctorCount = (int)cachedObjectData;

            }
            else
            {
                DateTime startDate = DateTime.UtcNow;
                DateTime expiryDate = startDate.AddDays(-30);

                doctorCount = Db.DoctorAppointmentTbls.ToList().Count();
                ContextCache.MaxOneMinute("TotalAppointments", doctorCount);
            }
            return doctorCount;

        }
        public int TotalFinishedAppointments()
        {
            int appointmentCount = 0;
            object cachedObjectData = ContextCache.Get("TotalFinishedAppointments");
            if (cachedObjectData != null)
            {
                appointmentCount = (int)cachedObjectData;

            }
            else
            {
                DateTime startDate = DateTime.UtcNow;
                var staringVisitTimeDay = ToUnixTime(startDate);

                appointmentCount = Db.DoctorAppointmentTbls.Where(x => x.StartTime < staringVisitTimeDay).ToList().Count();
                ContextCache.MaxOneMinute("TotalFinishedAppointments", appointmentCount);
            }
            return appointmentCount;

        }

        public int TotalLogs()
        {
            int logsCount = 0;
            object cachedObjectData = ContextCache.Get("TotalLogs");
            if (cachedObjectData != null)
            {
                logsCount = (int)cachedObjectData;

            }
            else
            {
                logsCount = Db.LogTbls.ToList().Count();
                ContextCache.MaxOneMinute("TotalLogs", logsCount);
            }        
            return logsCount;

        }
        public int TotalWorkingAreas()
        {
            int doctorWorkCount = 0;
            object cachedObjectData = ContextCache.Get("TotalWorkingAreas");
            if (cachedObjectData != null)
            {
                doctorWorkCount = (int)cachedObjectData;

            }
            else
            {
                doctorWorkCount = Db.DoctorWorkingAreaTbls.ToList().Count();
                ContextCache.MaxOneMinute("TotalWorkingAreas", doctorWorkCount);
            }
          
            return doctorWorkCount;

        }
        public int AppointmentStatus()
        {
            int appointmentStatusCount = 0;
            object cachedObjectData = ContextCache.Get("AppointmentStatus");
            if (cachedObjectData != null)
            {
                appointmentStatusCount = (int)cachedObjectData;

            }
            else
            {
                appointmentStatusCount = Db.AppointmentStatusTbls.ToList().Count();
                ContextCache.MaxOneMinute("AppointmentStatus", appointmentStatusCount);
            }

            return appointmentStatusCount;

        }

    }
}