using Microsoft.Practices.Unity;
using AppointmentSys.Controllers;
using AppointmentSys.Filters;
using AppointmentSys.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace AppointmentSys.DAL
{
    [ExceptionHandlerAttribute]
    public class AppointmentStatusDataAccessRepository : BaseController, IAppointmentStatusAccessRepository<AppointmentStatus, int>
    {
        public IEnumerable<AppointmentStatus> Get()
        {
            var entities = Db.AppointmentStatusTbls.Select(x => new AppointmentStatus()
            {
                Id = x.Id,
                Name = x.Name,
                DefaultStatus = x.DefaultStatus,
            }).ToList();

            return entities;
        }

        public AppointmentStatus Get(int id)
        {
            var entity = Db.AppointmentStatusTbls.Where(x => x.Id == id).Select(x => new AppointmentStatus()
            {
                Id = x.Id,
                Name = x.Name,
                DefaultStatus = x.DefaultStatus,
            }).SingleOrDefault();

            return entity;
        }

        public void Post(AppointmentStatus entity)
        {
            Db.AppointmentStatusTbls.InsertOnSubmit(new AppointmentStatusTbl
            {
                //   Id              = entity.Id,           
                Name = entity.Name,
                DefaultStatus = entity.DefaultStatus,

            });
            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

        public void Put(int id, AppointmentStatus entity)
        {
            var isEntity = from x in Db.AppointmentStatusTbls
                           where x.Id == entity.Id
                           select x;



            var entitySingle = isEntity.Single();

            entitySingle.Name = entity.Name;
            entitySingle.DefaultStatus = entity.DefaultStatus;


            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

        public void Delete(int id)
        {
            var query = from x in Db.AppointmentStatusTbls
                        where x.Id == id
                        select x;

            if (query.Count() == 1)
            {
                var entity = query.SingleOrDefault();
                Db.AppointmentStatusTbls.DeleteOnSubmit(entity ?? throw new InvalidOperationException());
            }

            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

        //custom
        public List<System.Web.Mvc.SelectListItem> GetAllOrderStatusSelectList()
        {
            var entities = Db.AppointmentStatusTbls.Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.Name,
                // Selected = (item.Value.ToLower() == entity..ToString().ToLower()) ? true : false
            }).ToList();

            return entities;
        }
    }
}