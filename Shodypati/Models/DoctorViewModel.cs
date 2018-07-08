using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using Shodypati.Controllers;
using Shodypati.DAL;

namespace Shodypati.Models
{
    public class DoctorViewModel : BaseController
    {
        public DoctorViewModel()
        {
              Db = new ShodypatiDataContext();
        }
        public string SelectedWorkingTypeId { get; set; }
        
        public List<Doctor> DoctorslList
        {
            get
            {
                var entities = Db.DoctorTbls.Select(x => new Doctor()
                {
                    Id = x.Id,
                    FullName = x.FullName,
                    RegistrationNo = x.RegistrationNo,
                    RegistrationType = x.RegistrationType,
                    ClinicHospitalName = x.ClinicHospitalName,
                    Designation = x.Designation,
                    YearOfExperience = x.YearOfExperience,
                    SelectedDoctorWorkingTypeId = x.WorkingArea,
                    Addresss = x.Addresss,
                    DateOfBirth = x.DateOfBirth,
                    PhoneNumber = x.PhoneNumber,
                    Email = x.Email,
                    SelectedVisitDaysStr = GetDaysNameFromNumbers(x.CanVisitDays),
                    VisitTimeStart = x.VisitTimeStart,
                    VisitTimeEnd = x.VisitTimeEnd,
                    VisitTime = GetTimeFromTimeSpan(x.VisitTimeStart, x.VisitTimeEnd),
                    SlotDuration = x.SlotDuration,
                    VisitFee = x.VisitFee,
                    VisitingCard = HttpUtility.UrlPathEncode(baseUrl + x.VisitingCard),
                    RawDBImagePath = x.VisitingCard,
                    CreatedOnUtc = x.CreatedOnUtc,
                    UpdatedOnUtc = x.UpdatedOnUtc,
                    Active = x.Active,
                }).ToList();

                if (string.IsNullOrEmpty( SelectedWorkingTypeId ))
                {                   
                    return entities;
                }
                else
                {
                    var doctorsList = (from x in entities
                                where x.SelectedDoctorWorkingTypeId == SelectedWorkingTypeId
                                select x).ToList();  
                    
                    return doctorsList;
                }
            }
        }

    }
}