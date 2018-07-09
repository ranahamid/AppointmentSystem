using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using AppointmentSys.Helpers;


namespace AppointmentSys.Models
{
    public class FilesViewModel
    {
        public ViewDataUploadFilesResult[] Files { get; set; }
    }
}