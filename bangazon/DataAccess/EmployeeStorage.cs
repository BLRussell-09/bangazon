﻿using bangazon.Models;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace bangazon.DataAccess
{
  public class EmployeeStorage
  {
    private readonly string conString;

    public EmployeeStorage(IConfiguration config)
    {
      conString = config.GetSection("ConnectionString").Value;
    }

    public IEnumerable<Employee> GetEmployees()
    {
      using (var database = new SqlConnection(conString))
      {
        var result = database.Query<Employee>(@"select e.name as employee_name, e.id as employee_id , is_supervisor, e.department_id, d.name as department_name 
                            from employee as e
                            left join department as d on e.department_id = d.id");

        return result;
      } 
    }
  }
}
