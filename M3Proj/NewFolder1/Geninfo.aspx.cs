﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Claims;
using System.Security.Principal;
using System.Web.Security;
using Microsoft.AspNet.Identity;
namespace M3Proj.NewFolder1
{
    public partial class stuGeninfo : System.Web.UI.Page
    {
        
        public string Name = " ";
        public string Surname = " ";
        public string Address = " ";
        public int age = 0;
        public string gender = " ";
        public decimal fees = 0;
        public string cont = " ";
        public string FullName = " ";
        public string str2 = " ";
        public string title = " ";
        public string gradeDiv = " ";
        public string teachId = " ";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userType"].ToString() == "Student")
            {
                int idClass = 0;
                int grade = 0;
                char div = ' ';
                title = Session["userType"].ToString();
                string str1 = Session["Email"].ToString();
                int n1 = str1.IndexOf("@");
                str2 = str1.Substring(0, n1);
                Session["ID"] = str2;
                string conString =
                    "Data Source=146.230.177.46;Initial Catalog=GroupPmb2;User ID=GroupPmb2;Password=b45dc2;Integrated Security=False";
                SqlConnection con = new SqlConnection(conString);
                string query = "SELECT * FROM student WHERE stu_email = @Email";
                SqlCommand sqlCommand = new SqlCommand(query, con);
                sqlCommand.Parameters.AddWithValue("@Email", Session["Email"]);
                SqlDataAdapter DA = new SqlDataAdapter(sqlCommand);
                DataTable dt = new DataTable();
                DA.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    Name = Convert.ToString(dr["stu_name"]);
                    Surname = Convert.ToString(dr["stu_surname"]);
                    Address = Convert.ToString(dr["stu_address"]);
                    age = Convert.ToInt32(dr["stu_age"]);
                    gender = Convert.ToString(dr["stu_gender"]);
                    fees = Convert.ToDecimal(dr["stu_Fees"]);
                    cont = Convert.ToString(dr["parentContact"]);
                    idClass = Convert.ToInt32(dr["classID"]);
                    
                }
                string query2 = "SELECT * FROM classes WHERE class_id= @classID";
                SqlCommand com = new SqlCommand(query2, con);
                com.Parameters.AddWithValue("@classID",idClass);
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable DT = new DataTable();
                da.Fill(DT);
                foreach(DataRow dr in DT.Rows)
                {
                    grade = Convert.ToInt32(dr["grade"]);
                    div = Convert.ToChar(dr["Division"]);
                    teachId = Convert.ToString(dr["teacher_id"]);
                }

                FullName = Name + " " + Surname;
                gradeDiv = grade.ToString()+div.ToString();

            }
            else if (Session["userType"].ToString() == "Teacher")
            {
                 
                string str1 = Session["Email"].ToString();
                int n1 = str1.IndexOf("@");
                str2 = str1.Substring(0, n1);
                Session["ID"] = str2;
                string conString =
                    "Data Source=146.230.177.46;Initial Catalog=GroupPmb2;User ID=GroupPmb2;Password=b45dc2;Integrated Security=False";
                SqlConnection con = new SqlConnection(conString);
                string query = "SELECT * FROM Teachers WHERE teach_email = @Email";
                SqlCommand sqlCommand = new SqlCommand(query, con);
                sqlCommand.Parameters.AddWithValue("@Email", Session["Email"]);
                SqlDataAdapter DA = new SqlDataAdapter(sqlCommand);
                DataTable dt = new DataTable();
                DA.Fill(dt);

                foreach(DataRow dr in dt.Rows)
                {
                    Name = Convert.ToString(dr["teach_firstname"]);
                    Surname = Convert.ToString(dr["teach_lastname"]);
                    Address = Convert.ToString(dr["Address"]);
                    age = Convert.ToInt32(dr["age"]);
                    gender = Convert.ToString(dr["gender"]);
                    //fees = Convert.ToDecimal(dr["stu_Fees"]);
                    cont = Convert.ToString(dr["contactNum"]);
                    title = Convert.ToString(dr["teach_title"]);

                }

                FullName = Name + " " + Surname;

            }
            
        }
    }
}