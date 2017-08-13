using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalendarExample
{
    public partial class calendar_with_popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnEmployees.Value = Employee.GenerateEmployeesJSON();
        }
    }
}