using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Practices.Unity;
using AppointmentSys.Controllers;
using AppointmentSys.DAL;
using AppointmentSys.Models;
using System;
using System.Data.Entity;
using System.Web.Http;
using System.Web.Mvc;
using Unity.WebApi;

namespace AppointmentSys
{
    public static class UnityConfig
    {
    

        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

         
            //Log
            container.RegisterType<ILogAccessRepository<Log, int>, LogDataAccessRepository>();
            //Product
          
            //account
            container.RegisterType<IAccountAccessRepository<RegisterViewModel, int>, AccountDataAccessRepository>();
           
            //Doctors
            container.RegisterType<IDoctorAccessRepository<Doctor, int>, DoctorDataAccessRepository>();
            //Appointment
            container.RegisterType<IAppointmentAccessRepository<Appointment, int>, AppointmentDataAccessRepository>();
            //DoctorWorkingArea
            container.RegisterType<IDoctorWorkingAreaAccessRepository<DoctorWorkingArea, int>, DoctorWorkingAreaDataAccessRepository>();

            //AppointmentStatus
            container.RegisterType<IAppointmentStatusAccessRepository<AppointmentStatus, int>, AppointmentStatusDataAccessRepository>();

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}