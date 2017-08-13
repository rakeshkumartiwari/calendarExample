using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace CalendarExample
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employees = GetAllEmployees();
            var js = new JavaScriptSerializer();
            hdnEmployees.Value = js.Serialize(employees);
        }

        public List<Employee> GetAllEmployees()
        {
            var EmployeeList = new List<Employee>();


            EmployeeList.Add(new Employee
            {
                id=111,
                title = "Rakesh",
                start = "2017-05-09",
                end = "2017-05-10",
                backgroundColor="blue"
            });
            EmployeeList.Add(new Employee
            {
                id=222,
                title = "Vikash",
                start = "2017-05-14",
                end = "2017-05-19",
                backgroundColor="red"

            });


            return EmployeeList;
        }

    }
    public class Employee
    {
        public int id { get; set; }
        public string title { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public string backgroundColor { get; set; }
    }
}


