using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace CalendarExample
{
    public class Employee
    {
        public int id { get; set; }
        public string title { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public string backgroundColor { get; set; }
        public static string GenerateEmployeesJSON()
        {
            var employeeList = new List<Employee>();


            employeeList.Add(new Employee
            {
                id = 111,
                title = "Rakesh",
                start = "2017-05-09",
                end = "2017-05-10",
                backgroundColor = "blue"
            });
            employeeList.Add(new Employee
            {
                id = 222,
                title = "Vikash",
                start = "2017-05-14",
                end = "2017-05-19",
                backgroundColor = "red"

            });

            var js = new JavaScriptSerializer();
            return js.Serialize(employeeList);
        }
    }
}


