using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalendarExample
{
    public partial class select_dates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userId.Value = "30";
            hdnEmployees.Value = Employee.GenerateEmployeesJSON();
            if (IsPostBack)
            {
                var eventData = eventFromCalander.Value;
            }
        }
    }
}