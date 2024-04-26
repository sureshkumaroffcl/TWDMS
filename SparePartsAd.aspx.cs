using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class SparePartsAd : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                this.BindGrid();
                ResetRecords();
                
            }

        }

        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblSpareparts";
            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvSpareParts.DataSource = dt;
                        gvSpareParts.DataBind();

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

               SqlCommand cmd;

           

             var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblSpareparts]
           ([SparePartID]
           ,[SpareName]
           ,[Description]
           ,[Manufacture]
           ,[VehicleType]
           ,[YearFrom]
           ,[YearTo]
           ,[Price])
     VALUES

            (@SparePartID,@SpareName,@Description,@Manufacture,@VehicleType,@YearFrom,@YearTo,@Price)";
                    
       
                    var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblSpareparts]
   SET 
      [SpareName] = @SpareName
      ,[Description] = @Description
      ,[Manufacture] = @Manufacture
      ,[VehicleType] = @VehicleType
      ,[YearFrom] = @YearFrom
      ,[YearTo] = @YearTo
      ,[Price] = @Price

 WHERE [SparePartID] = @SparePartID";

                 // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
              bool isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@SparePartID", currentID);
            }


             else
        {
            // Retrieve the current max ID value from the table and increment it to get the new ID value
            using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(SparePartID) FROM tblSpareparts", con))
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
            cmd.Parameters.AddWithValue("@SparePartID", currentID);
        }


           
            
                 // Add parameters for the other columns

                      //  cmd.Parameters.AddWithValue("@SparePartID", SparePartsID);
                        cmd.Parameters.AddWithValue("@SpareName", txtSparePartName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@Manufacture", ddlManufacturer.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@VehicleType", ddlVehicleType.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@YearFrom", string.Format("{0:yyy}", txtYearFrom.Text));
                        cmd.Parameters.AddWithValue("@YearTo", string.Format("{0:yyy}", txtYearTo.Text));
                        cmd.Parameters.AddWithValue("@Price", string.Format("{0:0.00}", txtPrice.Text));



                        // Execute the query and display a message to the user indicating success

                      

                        int rowsAffected= cmd.ExecuteNonQuery();

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



       


        


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }
        private void ResetRecords()
        {
            //txtSparePartID.Text = string.Empty;
            txtSparePartName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlManufacturer.SelectedIndex = 0;
            ddlVehicleType.SelectedIndex = 0;
            txtYearFrom.Text = string.Empty;
            txtYearTo.Text = string.Empty;
            txtPrice.Text = string.Empty;

            btnSave.Text = "Save";
        }

        protected void gvSpareParts_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";

            //txtVehicleID.Text = gvSpareParts.SelectedRow.Cells[1].Text;

            txtSparePartName.Text = gvSpareParts.SelectedRow.Cells[2].Text;
            txtDescription.Text = gvSpareParts.SelectedRow.Cells[3].Text;
            ddlManufacturer.SelectedIndex = ddlManufacturer.Items.IndexOf(ddlManufacturer.Items.FindByText(gvSpareParts.SelectedRow.Cells[4].Text.Trim()));
            ddlVehicleType.SelectedIndex = ddlVehicleType.Items.IndexOf(ddlVehicleType.Items.FindByText(gvSpareParts.SelectedRow.Cells[5].Text.Trim()));
            txtYearFrom.Text = gvSpareParts.SelectedRow.Cells[6].Text;
            txtYearTo.Text = gvSpareParts.SelectedRow.Cells[7].Text;
            txtPrice.Text = gvSpareParts.SelectedRow.Cells[8].Text;

            BindGrid();
        }
    }
}