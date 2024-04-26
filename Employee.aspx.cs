using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class Employee : System.Web.UI.Page
    {
        int varEmpID;
       // string fileName = "";

        string newFileName = "";

        //int imageCount = 1;

        string fileExtension;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //ddlHallType.SelectedIndex = 0;
                this.BindGrid();
                ResetRecords();



            }

        }

        protected string FormatImageUrl(string EmpImage)
        {

            if (EmpImage != null && EmpImage.Length > 0)

                return (@"~\" + EmpImage);
            else return null;

        }
        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblEmployee";
            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvEmployee.DataSource = dt;
                        gvEmployee.DataBind();

                    }
                }
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = Connection.GetConnection();
            con.Open();

             int currentID = 1;

           

           

            if (fuEmpImg.PostedFile != null)
            {
                string query = "SELECT COUNT(*) FROM tblEmployee";
                SqlCommand command = new SqlCommand(query, con);

                int latestId = (int)command.ExecuteScalar();

                fileExtension = Path.GetExtension(fuEmpImg.PostedFile.FileName);
                newFileName = "EmpImg" + (latestId + 1).ToString() + ".jpg";
                fuEmpImg.SaveAs(Server.MapPath(@"~\EmployeeImage\" + newFileName));

            }
                // fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));


                //if (IsImageFile(fileExtension))
                //{
                //    // Generate a new file name with an auto-incrementing number and .jpg extension
                //    newFileName = string.Format("EmpImg{0}.jpg", GetNextImageCount());

                //    // Save the uploaded file to the uploads folder with the new file name and .jpg extension
                //    fuEmpImg.SaveAs(Server.MapPath(@"~\EmployeeImage\" + newFileName));

                //    // Increment the image count
                //    //imageCount++;

                //}
            
            SqlCommand cmd;

            bool isNewRecord = true;

             var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblEmployee]
           ([EmpID]
           ,[EmpName]
           ,[EmpFatherName]
           ,[Gender]
           ,[DOB]
           ,[PhoneNo]
           ,[Qualification]
           ,[Designation]
           ,[Address]
           ,[EmpImage])
     VALUES
            (@EmpID,@EmpName,@EmpFatherName,@Gender,@DOB,@PhoneNo,@Qualification,@Designation,@Address,@EmpImage)";

                 
                 
                 
                 
                 
                 
                 
                var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblEmployee]
            SET
            [EmpName] = @EmpName
           ,[EmpFatherName] = @EmpFatherName
           ,[Gender] = @Gender
           ,[DOB]= @DOB
           ,[PhoneNo] = @PhoneNo
           ,[Qualification] = @Qualification
           ,[Designation] = @Designation
           ,[Address] = @Address
           ,[EmpImage] = @EmpImage

WHERE [EmpID] = @EmpID";
                
            // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
                isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@EmpID", currentID);
            }


             else
        {
            // Retrieve the current max ID value from the table and increment it to get the new ID value
            using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(EmpID) FROM tblEmployee", con))
            {
                object result = maxIDCommand.ExecuteScalar();
                if (result != DBNull.Value && result != null && int.TryParse(result.ToString(), out currentID))
                {
                    currentID++;
                }
            }
            //MAX(CusID)

            // Set the ViewState to the new ID value
            ViewState["CurrentID"] = currentID;

            // Set the command to the insert query
            cmd = new SqlCommand(SqlInsertQuery, con);
            cmd.Parameters.AddWithValue("@EmpID", currentID);
        }


           
            
                 // Add parameters for the other columns


            
                
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@EmpFatherName", txtEmpFatherName.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@DOB", string.Format("{0:dd-MM-yyy}", txtDOB.Text));
                cmd.Parameters.AddWithValue("@PhoneNo", string.Format("{0:(###) ###-####}", txtPhoneNo.Text));
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@EmpImage", @"\EmployeeImage\" + newFileName);
               

                // Execute the query and display a message to the user indicating success
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record Saved Successfully');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Data Successfully Updated');", true);

                }
            
             
            con.Close();



            this.BindGrid();
            ResetRecords();

        }

        private bool IsImageFile(string fileExtension)
        {
            fileExtension = fileExtension.ToLower();
            return (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".gif" || fileExtension == ".png");
        }

        private int GetNextImageCount()
        {
            // Get the current image count from the database or a file or any other storage method
            // In this example, we'll store the image count in the ViewState
            int currentImageCount = ViewState["ImageCount"] == null ? 1 : Convert.ToInt32(ViewState["ImageCount"]) + 1;

            // Save the updated image count to the ViewState
            ViewState["ImageCount"] = currentImageCount;

            return currentImageCount;
        }


        //private int IfEmpIDExists(SqlConnection con, string EmpID)
        //{
        //    SqlDataAdapter sda = new SqlDataAdapter("SELECT ISNULL (max(EmpID),0) +1 AS EmpID FROM tblEmployee", con);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);

        //    if (dt.Rows.Count > 0)
        //    {
        //        varEmpID = dt.Rows[0].Field<int>("EmpID");
        //        return varEmpID;

        //    }
        //    else
        //    {
        //        return 0;
        //    }


        //}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }
        private void ResetRecords()
        {
            //txtEmpID.Text = string.Empty;
            txtEmpName.Text = string.Empty;
            txtEmpFatherName.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            txtDOB.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtQualification.Text = string.Empty;
            txtDesignation.Text = string.Empty;
            txtAddress.Text = string.Empty;
            string fuEmpImg = string.Empty;

            btnSave.Text = "Save";

        }

        protected void gvEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";     
            //txtEmpID.Text = gvVehicleMaster.SelectedRow.Cells[1].Text;

            txtEmpName.Text = gvEmployee.SelectedRow.Cells[2].Text;
            txtEmpFatherName.Text = gvEmployee.SelectedRow.Cells[3].Text;
            ddlGender.SelectedIndex = ddlGender.Items.IndexOf(ddlGender.Items.FindByText(gvEmployee.SelectedRow.Cells[4].Text.Trim()));
            txtDOB.Text = gvEmployee.SelectedRow.Cells[5].Text;
            txtPhoneNo.Text = gvEmployee.SelectedRow.Cells[6].Text;
            txtQualification.Text = gvEmployee.SelectedRow.Cells[7].Text;
            txtDesignation.Text = gvEmployee.SelectedRow.Cells[8].Text;
            txtAddress.Text = gvEmployee.SelectedRow.Cells[9].Text;
            BindGrid();
        }



    }
}