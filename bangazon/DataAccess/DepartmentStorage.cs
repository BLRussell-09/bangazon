﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using bangazon.Models;
using System.Data.SqlClient;

namespace bangazon.DataAccess
{
    public class DepartmentStorage
    {
        private const string ConnectionInfo = "Server = (local); Database=Bangazon; Trusted_Connection=True";

        public List<Department> GetAllDepartments()
        {
            using (var db = new SqlConnection(ConnectionInfo))
            {
                db.Open();

                List<Department> AllDepartments = new List<Department>();

                var command = db.CreateCommand();
                command.CommandText = @"SELECT *
                                        FROM [dbo].department";

                var reader = command.ExecuteReader();

                int supervisorId;
                while (reader.Read())
                {
                    if(DBNull.Value.Equals(reader["supervisor_id"]))
                    {
                        supervisorId = 0;
                    } else
                    {
                        supervisorId = (int)reader["supervisor_id"];
                    }
                    var currentDepartment = new Department()
                    {
                        Name = reader["name"].ToString(),
                        Budget = (int)reader["expense_budget"],
                        SupervisorId = supervisorId,
                        Id = (int)reader["id"]
                    };

                    AllDepartments.Add(currentDepartment);
                }

                return AllDepartments;
            }
        }

        public List<DepartmentAndEmployees> GetDepartmentsWithEmployees()
        {
            List<DepartmentAndEmployees> departmentsAndEmployees = new List<DepartmentAndEmployees>();

            using (var db = new SqlConnection(ConnectionInfo))
            {
                db.Open();

                var command = db.CreateCommand();
                command.CommandText = @"SELECT *
                                        FROM [dbo].department";
                var reader = command.ExecuteReader();

                int supervisorId;

                while (reader.Read())
                {
                    if (DBNull.Value.Equals(reader["supervisor_id"]))
                    {
                        supervisorId = 0;
                    }
                    else
                    {
                        supervisorId = (int)reader["supervisor_id"];
                    }
                    var dAndE = new DepartmentAndEmployees()
                    {
                        Name = reader["name"].ToString(),
                        Budget = (int)reader["expense_budget"],
                        SupervisorId = supervisorId,
                        Id = (int)reader["id"]
                    };

                    departmentsAndEmployees.Add(dAndE);
                }

                command.CommandText = @"SELECT *
                                        FROM [dbo].employee";

                while (reader.Read())
                {
                    int departmentId = (int)reader["department_id"];

                    var employee = new Employee()
                    {
                        employee_name = reader["name"].ToString(),
                        is_supervisor = (bool)reader["is_supervisor"],
                        department_name = "WIP",
                        employee_id = (int)reader["id"]
                    };

                    foreach(DepartmentAndEmployees department in departmentsAndEmployees)
                    {
                        if(department.Id == departmentId)
                        {
                            department.Employees.Add(employee);
                        }
                    }
                }
            }
            return departmentsAndEmployees;
        }

        public Department GetDepartmentById(int id)
        {
            using (var db = new SqlConnection(ConnectionInfo))
            {
                db.Open();

                var command = db.CreateCommand();
                command.CommandText = @"SELECT *
                                        FROM [dbo].department
                                        WHERE id = @Id";

                command.Parameters.AddWithValue("@Id", id);

                var reader = command.ExecuteReader();

                int supervisorId;
                var result = new Department();

                while (reader.Read())
                {
                    if (DBNull.Value.Equals(reader["supervisor_id"]))
                    {
                        supervisorId = 0;
                    }
                    else
                    {
                        supervisorId = (int)reader["supervisor_id"];
                    }

                    result.Name = reader["name"].ToString();
                    result.Budget = (int)reader["expense_budget"];
                    result.SupervisorId = supervisorId;
                    result.Id = (int)reader["id"];
                }
                return result;
            }
        }
    }
}
