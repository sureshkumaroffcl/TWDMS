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
    public partial class CustomerAd : System.Web.UI.Page
    {
        int varCusID;

        string fileName = "";

        string newFileName = "";

        int imageCount = 1;

        string fileExtension;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();
                ResetRecords();
            }
        }

        protected string FormatImageUrl(string CusImage)
        {

            if (CusImage != null && CusImage.Length > 0)

                return (@"~\" + CusImage);
            else return null;

        }

        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblCustomer";
            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvCustomer.DataSource = dt;
                        gvCustomer.DataBind();

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

           



            if (fuCusImg.PostedFile != null)
            {

                string query = "SELECT COUNT(*) FROM tblCustomer";
                SqlCommand command = new SqlCommand(query, con);

                int latestId = (int)command.ExecuteScalar();

                fileExtension = Path.GetExtension(fuCusImg.PostedFile.FileName);
                newFileName = "CusImg" + (latestId + 1).ToString() + ".jpg";
                fuCusImg.SaveAs(Server.MapPath(@"~\CustomerImage\" + newFileName));

            }

            //string oldFileName = GetOldFileNameFromDatabase();

            //if (oldFileName != newFileName)
            //{
            //    // Delete the old file.
            //    DeleteFile(oldFileName);

            //    // Save the new file.
            //    fuCusImg.SaveAs(Server.MapPath(@"~\CustomerImage\" + newFileName));
            //    // Save the new file name to the database along with other details.

            //    // ...
            //}


            





                // fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));


                //if (IsImageFile(fileExtension))
               // {
                    // Generate a new file name with an auto-incrementing number and .jpg extension
                   // newFileName = string.Format("CusImg{0}.jpg", GetNextImageCount());

                    // Save the uploaded file to the uploads folder with the new file name and .jpg extension
                    //fuCusImg.SaveAs(Server.MapPath(@"~\CustomerImage\" + newFileName));

                    // Increment the image count
                    //imageCount++;

                //}
            


       
           

            SqlCommand cmd;

            bool isNewRecord = true;

             var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblCustomer]
           ([CusID]
           ,[CusName]
           ,[Gender]
           ,[DOB]
           ,[PhoneNo]
           ,[AadharNo]
           ,[DrivingLicenseNo]
           ,[Address]
           ,[CusImage])
     VALUES

        (@CusID,@CusName,@Gender,@DOB,@PhoneNo,@AadharNo,@DrivingLicenseNo,@Address,@CusImage)";


             var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblCustomer]
   SET 
      [CusName] = @CusName
      ,[Gender] = @Gender
      ,[DOB] = @DOB
      ,[PhoneNo] = @PhoneNo
      ,[AadharNo] = @AadharNo
      ,[DrivingLicenseNo] = @DrivingLicenseNo
      ,[Address] = @Address
      ,[CusImage] = @CusImage

 WHERE [CusID] = @CusID";




            // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
                isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@CusID", currentID);
            }


             else
        {
            // Retrieve the current max ID value from the table and increment it to get the new ID value
            using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(CusID) FROM tblCustomer", con))
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
            cmd.Parameters.AddWithValue("@CusID", currentID);
        }


           
            
                 // Add parameters for the other columns


               

             
                cmd.Parameters.AddWithValue("@CusName", txtCusName.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@DOB", string.Format("{0:dd-MM-yyyy}", txtDOB.Text));
                cmd.Parameters.AddWithValue("@PhoneNo", string.Format("{0:(###) ###-####}",txtPhoneNo.Text));
                cmd.Parameters.AddWithValue("@AadharNo", string.Format("{0:#### #### ####}",txtAadharNo.Text));
                cmd.Parameters.AddWithValue("@DrivingLicenseNo", string.Format("{0:AA#-###-##-####}", txtDrivingLicenseNo.Text));
                cmd.Parameters.AddWithValue("@Address",txtAddress.Text);
                cmd.Parameters.AddWithValue("@CusImage", @"\CustomerImage\" + newFileName);

                 

                
            
            
            

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




         private int IfCusIDExists(SqlConnection con, string CusID)
         {
             SqlDataAdapter sda = new SqlDataAdapter("SELECT ISNULL (max(CusID),0) +1 AS CusID FROM tblCustomer", con);
             DataTable dt = new DataTable();
             sda.Fill(dt);

             if (dt.Rows.Count > 0)
             {
                 varCusID = dt.Rows[0].Field<int>("CusID");
                 return varCusID;

             }
             else
             {
                 return 0;
             }


         }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }
        private void ResetRecords()
        {
            //txtCusID.Text = string.Empty;
            txtCusName.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            txtDOB.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtAadharNo.Text = string.Empty;
            txtDrivingLicenseNo.Text = string.Empty;
            txtAddress.Text = string.Empty;
            string fuEmpImg = string.Empty;

            btnSave.Text = "Save";
        }

        protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";
            //txtCusID.Text = gvCustomer.SelectedRow.Cells[1].Text;

            txtCusName.Text = gvCustomer.SelectedRow.Cells[2].Text;
            ddlGender.SelectedIndex = ddlGender.Items.IndexOf(ddlGender.Items.FindByText(gvCustomer.SelectedRow.Cells[3].Text.Trim()));
            txtDOB.Text = gvCustomer.SelectedRow.Cells[4].Text;
            txtPhoneNo.Text = gvCustomer.SelectedRow.Cells[5].Text;
            txtAadharNo.Text = gvCustomer.SelectedRow.Cells[6].Text;
            txtDrivingLicenseNo.Text = gvCustomer.SelectedRow.Cells[7].Text;
            txtAddress.Text = gvCustomer.SelectedRow.Cells[8].Text;

            Image img = gvCustomer.SelectedRow.FindControl("CusImage") as Image;

            FileUpload fileUpload = gvCustomer.SelectedRow.FindControl("fuCusImg") as FileUpload;


            this.BindGrid();
        }



    }
}