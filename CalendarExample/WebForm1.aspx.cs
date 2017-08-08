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
                Id=111,
                Name = "Rakesh",
                StartDate = "2017-05-09",
                EndDate = "2017-05-10"
            });
            EmployeeList.Add(new Employee
            {
                Id=222,
                Name = "Vikash",
                StartDate = "2017-05-14",
                EndDate = "2017-05-18"
            });


            return EmployeeList;
        }

    }
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
    }
}


