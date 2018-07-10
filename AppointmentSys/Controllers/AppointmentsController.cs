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
    [Authorize(Roles = "Admin")]
    public class AppointmentsController : BaseController
    {

        public AppointmentsController()
        {
            //api url                  
            url = baseUrl + "api/AppointmentsApi";
        }


        // GET: Appointments
        public async Task<ActionResult> Index()
        {
            return await IndexBaseTask();
        }

        public async Task<ActionResult> List()
        {           
            AppointmentViewModel vm = new AppointmentViewModel();
            AppointmentSelectList appointment = await GetDoctorsAndWorkingArea();
            vm.appointmentSelect = appointment;

            url = baseUrl + "api/AppointmentsApi";
            var responseMessage = await client.GetAsync(url);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<Appointment>>(responseData);
                vm.appointment = entity;
            }
            vm.baseUrl = baseUrl;
            vm.SearchType = GetAllSearchType();
            return View(vm);
        }

        public async Task<ActionResult> GetAppointmentData(string selectedDoctorId, string doctortypeId, string searchTypeId)
        {
            AppointmentViewModel vm = new AppointmentViewModel();
            List<Appointment> entity = new List<Appointment>();
            url = baseUrl + "api/AppointmentsApi";
            var responseMessage = await client.GetAsync(url);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                entity = JsonConvert.DeserializeObject<List<Appointment>>(responseData);             
            }
            // bind
           
           

            AppointmentSelectList appSelect = new AppointmentSelectList();
            var AllDoctors = await GetAllDoctor();
            appSelect.AllDoctors = AllDoctors;

            //doctortypeId 
            if (!string.IsNullOrEmpty(doctortypeId))
            {
                int docType = Int32.Parse(doctortypeId);
                var entities = Db.DoctorWorkingAreaTbls.Select(x => new SelectListItem()
                {
                    Value = x.Id.ToString(),
                    Text = x.WorkingArea,
                    Selected = (x.Id == docType)
                }).ToList();

                appSelect.SelectedDoctorWorkingTypeId = doctortypeId;
                appSelect.AllWorkingSelectListItems = entities;
            }
            else
            {
                var allWorkingTypes = await GetAllDoctorWorkingTypes();
                appSelect.AllWorkingSelectListItems = allWorkingTypes;
            }
            if (!string.IsNullOrEmpty(selectedDoctorId))
            {
                appSelect.SelectedDoctorId = selectedDoctorId;
            }
            else
            {

            }

            if (!string.IsNullOrEmpty(searchTypeId))
            {
                vm.SearchTypeId = searchTypeId;
            }
            else
            {

            }


            vm.appointmentSelect = appSelect;
            //get others

            vm.appointment = entity;

            
            vm.baseUrl = baseUrl;
            vm.SearchType = GetAllSearchType();
            return View("List", vm);
        }

        public async Task<AppointmentSelectList> GetDoctorsAndWorkingArea()
        {
            AppointmentSelectList appointment = new AppointmentSelectList();
            var entity = await GetAllDoctor();
            var allWorkingTypes = await GetAllDoctorWorkingTypes();

            if (entity != null)
            {
                appointment = new AppointmentSelectList
                {
                    AllDoctors = entity,
                    AllWorkingSelectListItems = allWorkingTypes
                };            
            }
            return appointment;
        }

        public async Task<ActionResult> IndexBaseTask()
        {
            AppointmentSelectList appointment =await GetDoctorsAndWorkingArea();
            if (appointment != null)
            {
                return View("Index", appointment);
            }
            throw new Exception("Exception");
        }

     
        public async Task<List<SelectListItem>> GetAllDoctor()
        {
            var responseMessage = await client.GetAsync(url + "/" + "GetAllDoctorsSelectList");
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<SelectListItem>>(responseData);
                return entity;
            }
            return null;
        }
        


        // GET: Appointments/Create
        public async Task< ActionResult > Create(int doctorId)
        {
            var responseMessage = await client.GetAsync(url+"/"+ "GetByDoctor" + "/" + doctorId);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<Appointment>>(responseData);

                //doctor details
                HttpResponseMessage responseMessageDoctor = await client.GetAsync(baseUrl+ "api/DoctorsApi" + "/" + doctorId);
                if (!responseMessageDoctor.IsSuccessStatusCode) throw new Exception("Exception");

                var responseDataDoctro = responseMessageDoctor.Content.ReadAsStringAsync().Result;
                var detailsOfDoctor = JsonConvert.DeserializeObject<Doctor>(responseDataDoctro);

             

                //Appointment newAppointment = new Appointment {AssignDoctorId = int.Parse(doctorId) };

                AppoinmentCreate createAppointment = new AppoinmentCreate
                {
                    Appointments = entity,
                    DoctorId = doctorId.ToString(),
                    DoctorDetails= detailsOfDoctor,                  
                };

                return View(createAppointment);
            }
            return View();
        }

      

        // POST: Appointments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]      
        public async Task<ActionResult> Create( string patientName, string startTime, string endtime, string address, string phoneNumber, string advanceAmount, string assigndoctorid, string doctorfullName)
        {
            //string patientName, string assignDoctorId, string address, string phoneNumber, string advanceAmount, string startTime, string endTime
            Appointment entity = new Appointment
            {
                PatientName = patientName,
                StartTime = long.Parse(startTime),
                EndTime = long.Parse(endtime),
                Address = address,
                PhoneNumber = phoneNumber,
                AdvanceAmount = Int32.Parse(advanceAmount),                
                AssignDoctorId = Int32.Parse( assigndoctorid),
                AssignDoctorName = doctorfullName,
            };

            if (!ModelState.IsValid)
                return Json(new { success = false, responseText = "An error occured." }, JsonRequestBehavior.AllowGet);
            //end parent name
            var responseMessage = await client.PostAsJsonAsync(url+"/"+ "PostWeb", entity);
            if (responseMessage.IsSuccessStatusCode)
            {
                // return View();
                return Json(new { success = true, responseText = "Successfully executed." }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = false, responseText = "An error occured." }, JsonRequestBehavior.AllowGet);
        }


        [AllowAnonymous]
        public ActionResult FillDoctors(string id)
        {
            var vm = new AppointmentSys.Models.DoctorViewModel()
            {
                SelectedWorkingTypeId = id
            };

            return PartialView("_DoctorsDrop", vm);
        }

        [AllowAnonymous]
        public ActionResult FillDoctorsDropDown(string id)
        {
            var vm = new AppointmentSys.Models.DoctorViewModelDropDown()
            {
                SelectedWorkingTypeId = id
            };

            return PartialView("_DoctorsDropDown", vm);
        }

        public async  Task<ActionResult> GetDoctorAppoinmentLists(string doctorId)
        {
            var responseMessage = await client.GetAsync(url + "/" + "GetByDoctor" + "/" + doctorId);
            if (responseMessage.IsSuccessStatusCode)
            {
                var responseData = responseMessage.Content.ReadAsStringAsync().Result;
                var entity = JsonConvert.DeserializeObject<List<Appointment>>(responseData);

                string data = JsonConvert.SerializeObject(entity);
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            return null;
        }

        // GET: Appointments/Details/5
        public ActionResult Details(int? id)
        {
            return View();
        }

        // GET: Appointments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View();
        }

        // POST: Appointments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Appointment appointment)
        {
            return View();
        }

        // GET: Appointments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View();
        }

        // POST: Appointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            return View();
        }

    }
}
