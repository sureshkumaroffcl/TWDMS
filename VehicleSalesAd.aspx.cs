using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class VehicleSalesAd : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               // ViewState["CurrentID"] = currentID;

                ddlCusID.DataBind();

                ddlVehicleID.DataBind();

                ddlEmpID.DataBind();

                BindGrid();

                ResetRecords();
            }

        }

        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);
        }

        private void BindGrid()
        {

            string SqlQuery = @"SELECT tblVehicleSales.SalesID,tblVehicleSales.CusID,tblVehicleSales.VehicleID,tblVehicleSales.EmpID,tblVehicleSales.SalesDate, tblVehicleSales.SalesPrice, 
tblCustomer.CusName, tblVehicleMaster.VehicleName, tblEmployee.EmpName  
FROM tblVehicleSales 
INNER JOIN tblCustomer ON tblVehicleSales.CusID = tblCustomer.CusID
INNER JOIN tblVehicleMaster ON tblVehicleSales.VehicleID = tblVehicleMaster.VehicleID
INNER JOIN tblEmployee ON tblVehicleSales.EmpID = tblEmployee.EmpID";

            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvVehicleSales.DataSource = dt;
                        gvVehicleSales.DataBind();

                    }
                }
            }
        }


         protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = Connection.GetConnection();
            con.Open();

           

            SqlCommand cmd;

            int currentID = 0;

            bool isNewRecord = true;

             var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblVehicleSales]
           ([SalesID]
           ,[CusID]
           ,[VehicleID]
           ,[EmpID]
           ,[SalesDate]
           ,[SalesPrice])
     VALUES
            
            (@SalesID,@CusID,@VehicleID,@EmpID,@SalesDate,@SalesPrice)";

             var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblVehicleSales]
   SET 
      [CusID] = @SalesID
      ,[VehicleID] = @VehicleID
      ,[EmpID] = @EmpID
      ,[SalesDate] = @SalesDate
      ,[SalesPrice] = @SalesPrice

 WHERE [SalesID] = @SalesID";

              // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
                isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@SalesID", currentID);
            }


             else
        {
            // Retrieve the current max ID value from the table and increment it to get the new ID value
            isNewRecord = true;

            using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(SalesID) FROM tblVehicleSales ", con))
            {
                
                object result = maxIDCommand.ExecuteScalar();

                if (result != DBNull.Value && result != null && int.TryParse(result.ToString(), out currentID))
                {
                   currentID++;

                 //   int maxID = Convert.ToInt32(result);
                   // currentID = maxID + 1;
                    //result !=DBNull.Value &&
                }
                //result != DBNull.Value &&
            }
            //MAX(CusID)

            // Set the ViewState to the new ID value
            ViewState["CurrentID"] = currentID;

            // Set the command to the insert query
            cmd = new SqlCommand(SqlInsertQuery, con);
            cmd.Parameters.AddWithValue("@SalesID", currentID);
            }


             // Add parameters for the other columns

             cmd.Parameters.AddWithValue("@CusID", Convert.ToInt32(ddlCusID.SelectedValue.ToString()));
             cmd.Parameters.AddWithValue("@VehicleID", Convert.ToInt32(ddlVehicleID.SelectedValue.ToString()));
             cmd.Parameters.AddWithValue("@EmpID", Convert.ToInt32(ddlEmpID.SelectedValue.ToString()));
             cmd.Parameters.AddWithValue("@SalesDate", string.Format("{0:dd-MM-yyyy}", txtSalesDate.Text));
             cmd.Parameters.AddWithValue("@SalesPrice", string.Format("{0:0.00}", txtSalesPrice.Text));

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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }
        private void ResetRecords()
        {
            //txtSalesID.Text = string.Empty;
            ddlCusID.SelectedIndex =0;
            ddlVehicleID.SelectedIndex = 0;
            ddlEmpID.SelectedIndex =0;
            txtSalesDate.Text = string.Empty;
            txtSalesPrice.Text = string.Empty;

            btnSave.Text = "Save";
        }

        protected void gvVehicleSales_SelectedIndexChanged(object sender, EventArgs e)

        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";

            //txtSalesID.Text = gvVehicleSales.SelectedRow.Cells[1].Text;

            ddlCusID.SelectedIndex = ddlCusID.Items.IndexOf(ddlCusID.Items.FindByText(gvVehicleSales.SelectedRow.Cells[2].Text));

            ddlVehicleID.SelectedIndex = ddlVehicleID.Items.IndexOf(ddlVehicleID.Items.FindByText(gvVehicleSales.SelectedRow.Cells[3].Text));

            ddlEmpID.SelectedIndex = ddlEmpID.Items.IndexOf(ddlEmpID.Items.FindByText(gvVehicleSales.SelectedRow.Cells[4].Text));

            txtSalesDate.Text = gvVehicleSales.SelectedRow.Cells[5].Text;
            txtSalesPrice.Text = gvVehicleSales.SelectedRow.Cells[6].Text;
            this.BindGrid();
        }

       

     
    }
}