using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using AppointmentSys.Models;
using AppointmentSys.DAL;

namespace AppointmentSys.Controllers.Api
{
    public class AppointmentStatusApiController : ApiController
    {
        private IAppointmentStatusAccessRepository<AppointmentStatus, int> _repository;

        public AppointmentStatusApiController(IAppointmentStatusAccessRepository<AppointmentStatus, int> r)
        {
            _repository = r;
        }


        [Route("api/AppointmentStatus/")]
        public IEnumerable<AppointmentStatus> GetOrderPaymentMethods()
        {
            return _repository.Get();
        }

        [Route("api/AppointmentStatus/{id}")]
        [ResponseType(typeof(AppointmentStatus))]
        public IHttpActionResult GetOrderPaymentMethod(int id)
        {
            var item = _repository.Get(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [Route("api/AppointmentStatus/{id}")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutOrderPaymentMethod(int id, AppointmentStatus entity)
        {
            _repository.Put(id, entity);
            return StatusCode(HttpStatusCode.NoContent);
        }

        [Route("api/AppointmentStatus/")]
        [ResponseType(typeof(AppointmentStatus))]
        public IHttpActionResult PostOrderPaymentMethod(AppointmentStatus entity)
        {
            _repository.Post(entity);
            return Ok(entity);
        }

        [Route("api/AppointmentStatus/{id}")]
        [ResponseType(typeof(AppointmentStatus))]
        public IHttpActionResult DeleteOrderPaymentMethod(int id)
        {
            _repository.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }

        ////custom api 
        [Route("api/AppointmentStatus/GetAllOrderStatusSelectList/")]
        // GetAllBrandsSelectList: api/AppointmentStatus/GetAllOrderStatusSelectList
        public List<System.Web.Mvc.SelectListItem> GetAllOrderStatusSelectList()
        {
            return _repository.GetAllOrderStatusSelectList();
        }
    }
}
