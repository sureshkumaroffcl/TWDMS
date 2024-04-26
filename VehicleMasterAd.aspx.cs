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
    public partial class VehicleMasterAd : System.Web.UI.Page
    {
        int varVehicleID;

      //  string fileName = "";

        string newFileName = "";

        //int imageCount = 0;

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

        protected string FormatImageUrl(string VehicleImage)
        {

            if (VehicleImage != null && VehicleImage.Length > 0)

                return (@"~\" + VehicleImage);
            else return null;

        }
        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblVehicleMaster";
            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvVehicleMaster.DataSource = dt;
                        gvVehicleMaster.DataBind();

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


            if (fuVehicleImg.PostedFile != null)
            {


                string query = "SELECT COUNT(*) FROM tblVehicleMaster";
                SqlCommand command = new SqlCommand(query, con);

                int latestId = (int)command.ExecuteScalar();

                fileExtension = Path.GetExtension(fuVehicleImg.PostedFile.FileName);
                newFileName = "VehImg" + (latestId + 1).ToString() + ".jpg";
                fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));

            }

            // fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));


            //if (IsImageFile(fileExtension))
            //{
            //    // Generate a new file name with an auto-incrementing number and .jpg extension
            //    newFileName = string.Format("VehImg{0}.jpg", GetNextImageCount());

            //    // Save the uploaded file to the uploads folder with the new file name and .jpg extension
            //    fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));

            //    // Increment the image count
            //    //imageCount++;

            //}







            SqlCommand cmd;

            bool isNewRecord = true;

            var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblVehicleMaster]
           ([VehicleID]
           ,[VehicleName]
           ,[VehicleType]
           ,[CompanyName]
           ,[FuelType]
           ,[ChasisNo]
           ,[EngineNo]
           ,[Range]
           ,[WheelSize]
           ,[Tyres]
           ,[LoadingCapacity]
           ,[FrontSuspension]
           ,[RearSuspension]
           ,[Description]
           ,[Warranty]
           ,[Price]
           ,[VehicleImage])
     VALUES
           (@VehicleID,@VehicleName,@VehicleType,@CompanyName,@FuelType,@ChasisNo,@EngineNo,@Range,@WheelSize,@Tyres,
            @LoadingCapacity,@FrontSuspension,@RearSuspension,@Description,@Warranty,@Price,@VehicleImage)";



            var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblVehicleMaster]
   SET  
       [VehicleName] = @VehicleName
      ,[VehicleType] = @VehicleType
      ,[CompanyName] = @CompanyName
      ,[FuelType] = @FuelType
      ,[ChasisNo] = @ChasisNo
      ,[EngineNo] = @EngineNo
      ,[Range] = @Range
      ,[WheelSize] = @WheelSize
      ,[Tyres] = Tyres
      ,[LoadingCapacity] = @LoadingCapacity
      ,[FrontSuspension] = @FrontSuspension
      ,[RearSuspension] = @RearSuspension
      ,[Description] = @Description
      ,[Warranty] = @Warranty
      ,[Price] = @Price
      ,[VehicleImage] = @VehicleImage
 WHERE [VehicleID] = @VehicleID";

            // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
                isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@VehicleID", currentID);
            }


            else
            {
                // Retrieve the current max ID value from the table and increment it to get the new ID value
                using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(VehicleID) FROM tblVehicleMaster", con))
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
                cmd.Parameters.AddWithValue("@VehicleID", currentID);
            }




            // Add parameters for the other columns




            cmd.Parameters.AddWithValue("@VehicleName", txtVehicleName.Text);
            cmd.Parameters.AddWithValue("@VehicleType", ddlVehicleType.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@CompanyName", ddlCompanyName.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@FuelType", ddlFuelType.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@ChasisNo", txtChasisNo.Text);
            cmd.Parameters.AddWithValue("@EngineNo", txtEngineNo.Text);
            cmd.Parameters.AddWithValue("@Range", txtRange.Text);
            cmd.Parameters.AddWithValue("@WheelSize", txtWheelSize.Text);
            cmd.Parameters.AddWithValue("@Tyres", ddlTyres.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@LoadingCapacity", txtLoadingCapacity.Text);
            cmd.Parameters.AddWithValue("@FrontSuspension", txtFrontSuspension.Text);
            cmd.Parameters.AddWithValue("@RearSuspension", txtRearSuspension.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Warranty", ddlWarranty.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Price", string.Format("{0:0.00}", txtPrice.Text));
            cmd.Parameters.AddWithValue("@VehicleImage", @"\VehicleImage\" + newFileName);

          

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




        //private int IfVehicleIDExists(SqlConnection con, string VehicleID)
        //{
        //    SqlDataAdapter sda = new SqlDataAdapter("SELECT ISNULL (max(VehicleID),0) +1 AS VehicleID FROM tblVehicleMaster", con);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);

        //    if (dt.Rows.Count > 0)
        //    {
        //        varVehicleID = dt.Rows[0].Field<int>("VehicleID");
        //        return varVehicleID;

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
            //txtVehicleID.Text = string.Empty;

            txtVehicleName.Text = string.Empty;
            ddlVehicleType.SelectedIndex = 0;
            ddlCompanyName.SelectedIndex = 0;
            ddlFuelType.SelectedIndex = 0;

            txtChasisNo.Text = string.Empty;
            txtEngineNo.Text = string.Empty;
            txtRange.Text = string.Empty;
            txtWheelSize.Text = string.Empty;

            ddlTyres.SelectedIndex = 0;
            txtLoadingCapacity.Text = string.Empty;
            txtFrontSuspension.Text = string.Empty;
            txtRearSuspension.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlWarranty.SelectedIndex = 0;
            txtPrice.Text = string.Empty;
            string fuUploadImg = string.Empty;


            btnSave.Text = "Save";

        }

        protected void gvVehicleMaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";

            //txtVehicleID.Text = gvVehicleMaster.SelectedRow.Cells[1].Text;

            txtVehicleName.Text = gvVehicleMaster.SelectedRow.Cells[2].Text;
            ddlVehicleType.SelectedIndex = ddlVehicleType.Items.IndexOf(ddlVehicleType.Items.FindByText(gvVehicleMaster.SelectedRow.Cells[3].Text.Trim()));
            ddlCompanyName.SelectedIndex = ddlCompanyName.Items.IndexOf(ddlCompanyName.Items.FindByText(gvVehicleMaster.SelectedRow.Cells[4].Text.Trim()));
            ddlFuelType.SelectedIndex = ddlFuelType.Items.IndexOf(ddlFuelType.Items.FindByText(gvVehicleMaster.SelectedRow.Cells[5].Text.Trim()));
            txtChasisNo.Text = gvVehicleMaster.SelectedRow.Cells[6].Text;
            txtEngineNo.Text = gvVehicleMaster.SelectedRow.Cells[7].Text;
            txtRange.Text = gvVehicleMaster.SelectedRow.Cells[8].Text;
            txtWheelSize.Text = gvVehicleMaster.SelectedRow.Cells[9].Text;
            ddlTyres.SelectedIndex = ddlTyres.Items.IndexOf(ddlTyres.Items.FindByText(gvVehicleMaster.SelectedRow.Cells[10].Text.Trim()));

            txtLoadingCapacity.Text = gvVehicleMaster.SelectedRow.Cells[11].Text;


            txtFrontSuspension.Text = gvVehicleMaster.SelectedRow.Cells[12].Text;

            txtRearSuspension.Text = gvVehicleMaster.SelectedRow.Cells[13].Text;

            txtDescription.Text = gvVehicleMaster.SelectedRow.Cells[14].Text;

            ddlWarranty.SelectedIndex = ddlWarranty.Items.IndexOf(ddlWarranty.Items.FindByText(gvVehicleMaster.SelectedRow.Cells[15].Text.Trim()));

            txtPrice.Text = gvVehicleMaster.SelectedRow.Cells[16].Text;

            string fuUploadImg = gvVehicleMaster.SelectedRow.Cells[17].Text;

            this.BindGrid();


        }


        protected void gvVehicleMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the page index of the GridView
            gvVehicleMaster.PageIndex = e.NewPageIndex;

            // Rebind the data to the GridView for the requested page
            this.BindGrid();
        }
    }
}



 //if (File.Exists(newFileName))
 //               {

 //                   fileCount++;
 //                   newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);
                    

                    
 //               }
 //               else
 //               {
 //                   newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);

 //                   fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));
 //               }



// fileCount++;
// newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);

// fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));




// if (File.Exists(fileName))
// {
//int n = 0;
//string plainName = destFile.Remove(destFile.Length - 4);
//string newName;
//do
//{
//    fileCount++;
//    newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);
//}
//while (File.Exists(newFileName));
//}

// fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));

//while (File.Exists(newFileName))
//{
//    fileCount++;
//    newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);

//    fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));

//}




//if (fileName == null)
//{
//    fileCount++;

//    newFileName = "VehImg" + fileCount + Path.GetExtension(fileName);

//    fuVehicleImg.SaveAs(Server.MapPath(@"~\VehicleImage\" + newFileName));

// //   newFileName = fileName;


//}

//else if (File.Exists(fileName))
//{
//    fileCount++;
//    fileName = "VehImg" + fileCount + ".jpg";
//}



// fileName = "file" + varVehicleID + Path.GetFileName(fileName) + ".jpg";

//newFileName = "VehImg"   + Path.GetExtension(filename);

//fileCount++;



//private int GetNextFileCount()
//        {
//            //int nextNumber = 1;

//            // Check if the file with the current file name already exists
//          //  while (File.Exists(Server.MapPath("~/Uploads/File_" + nextNumber.ToString("0000") + fileExtension)))

         

//            do
//            {
//                fileCount++;
//            }
//            while (File.Exists(Server.MapPath(@"~\VehicleImage\" + fileCount + newFileName)));

//            return fileCount;
//        }