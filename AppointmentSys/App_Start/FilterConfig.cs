using AppointmentSys.Filters;
using System.Web.Mvc;

namespace AppointmentSys
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());

            //ExceptionHandlerAttribute
            filters.Add(new ExceptionHandlerAttribute());
        }
    }
}
