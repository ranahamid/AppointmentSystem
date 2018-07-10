using AppointmentSys.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppointmentSys.Models
{
    public class DoctorViewModelDropDown: AppointmentSelectList
    {
        public AppointmentSysDataContext Db;
        public DoctorViewModelDropDown()
        {
            Db = new AppointmentSysDataContext();
        }
        public string SelectedWorkingTypeId { get; set; }

        // public string SelectedDoctorId { get; set; }

        public IEnumerable<SelectListItem> DoctorslList
        {
            get
            {
                IQueryable<DoctorTbl> docts;

                if (SelectedWorkingTypeId == null)
                {
                    docts = from x in Db.DoctorTbls
                            select x;
                }
                else
                {
                    docts = from x in Db.DoctorTbls
                            where x.WorkingArea == SelectedWorkingTypeId
                            select x;
                }


                List<SelectListItem> teachers = new List<SelectListItem>();


                foreach (var item in docts)
                {
                    teachers.Add(new SelectListItem
                    {
                        Text = item.FullName,
                        Value = item.Id.ToString()
                    });
                }

                return teachers;
            }
        }
    }
}