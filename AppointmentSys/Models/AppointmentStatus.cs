using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppointmentSys.Models
{
    public class AppointmentStatus
    {
        public int Id { get; set; }

        public string Name { get; set; }

        [ScaffoldColumn(false)]
        public bool? DefaultStatus { get; set; }
    }
}