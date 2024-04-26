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
    public partial class InvoiceAd : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ddlCusID.DataBind();

                ddlVehicleID.DataBind();
                BindGrid();
                ResetRecords();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);
        }

        protected void txtSalesPrice_TextChanged(object sender, EventArgs e)
        {

            // Get the default CGST and SGST rates from your database or some other source
            decimal CGST = 2.5m; // example default CGST rate
            decimal SGST = 2.5m; // example default SGST rate

            // Calculate the tax amount based on the sales price, CGST rate, and SGST rate
            decimal salesPrice = decimal.Parse(txtSalesPrice.Text);

            decimal taxAmount = salesPrice * (CGST / 100 + SGST / 100);

            // Calculate the total amount by adding the sales price and tax amount
            decimal totalAmount= salesPrice + taxAmount;

            // Display the total amount in the total amount textbox
            txtTotalAmt.Text = totalAmount.ToString("C2");



            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);
        }


        private void BindGrid()
        {

            string SqlQuery = @"SELECT tblInvoice.InvoiceID,tblInvoice.CusID,tblInvoice.VehicleID, tblInvoice.InvoiceDate, tblInvoice.SalesPrice,
 tblInvoice.CGST, tblInvoice.SGST, tblInvoice.TotalPrice,
tblCustomer.CusName, tblVehicleMaster.VehicleName  
FROM tblInvoice 
INNER JOIN tblCustomer ON tblInvoice.CusID = tblCustomer.CusID
INNER JOIN tblVehicleMaster ON tblInvoice.VehicleID = tblVehicleMaster.VehicleID";


            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvInvoice.DataSource = dt;
                        gvInvoice.DataBind();

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

             var SqlInsertQuery = @"INSERT INTO [TwoWheelerDealership].[dbo].[tblInvoice]
           ([InvoiceID]
           ,[CusID]
           ,[VehicleID]
           ,[InvoiceDate]
           ,[SalesPrice]
           ,[CGST]
           ,[SGST]
           ,[TotalPrice])
     VALUES

            (@InvoiceID,@CusID,@VehicleID,@InvoiceDate,@SalesPrice,@CGST,@SGST,@TotalPrice)";


              var SqlUpdateQuery = @"UPDATE [TwoWheelerDealership].[dbo].[tblInvoice]
   SET 
      [CusID] = @CusID
      ,[VehicleID] = @VehicleID
      ,[InvoiceDate] = @InvoiceDate
      ,[SalesPrice] = @SalesPrice
      ,[CGST] = @CGST
      ,[SGST] = @SGST
      ,[TotalPrice] = @TotalPrice
 WHERE [InvoiceID] = @InvoiceID";


             // Check if the ID field has a value (i.e., if we are updating an existing record)
            if (ViewState["CurrentID"] != null)
            {
                // Parse the ID value and set the isNewRecord flag to false
                currentID = Convert.ToInt32(ViewState["CurrentID"]);
                isNewRecord = false;

                // Set the command to the update query

                cmd = new SqlCommand(SqlUpdateQuery, con);
                cmd.Parameters.AddWithValue("@InvoiceID", currentID);
            }


             else
        {
            // Retrieve the current max ID value from the table and increment it to get the new ID value
            using (SqlCommand maxIDCommand = new SqlCommand("SELECT MAX(InvoiceID) FROM tblInvoice ", con))
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
            cmd.Parameters.AddWithValue("@InvoiceID", currentID);
            }

             
             decimal CGST = 2.5m; // example default CGST rate
            decimal SGST = 2.5m; // example default SGST rate

            // Calculate the tax amount based on the sales price, CGST rate, and SGST rate
            decimal salesPrice = decimal.Parse(txtSalesPrice.Text);

            decimal CGSTAmount =  salesPrice *(CGST / 100 );


               decimal SGSTAmount =salesPrice *( SGST / 100);

               decimal taxAmount = CGSTAmount + SGSTAmount;








            // Calculate the total amount by adding the sales price and tax amount
            decimal totalAmount = salesPrice + taxAmount;

            // Display the total amount in the total amount textbox
            txtTotalAmt.Text = totalAmount.ToString();

            // decimal totalAmount = decimal.Parse(txtTotalAmt.Text);

             // Add parameters for the other columns

             cmd.Parameters.AddWithValue("@CusID", Convert.ToInt32(ddlCusID.SelectedValue.ToString()));
             cmd.Parameters.AddWithValue("@VehicleID", Convert.ToInt32(ddlVehicleID.SelectedValue.ToString()));


             cmd.Parameters.AddWithValue("@InvoiceDate", string.Format("{0:dd-MM-yyyy}", txtInvoiceDate.Text));

             cmd.Parameters.AddWithValue("@SalesPrice", string.Format("{0:0.00}", txtSalesPrice.Text));

             cmd.Parameters.AddWithValue("@CGST", string.Format("{0:0.00}", CGSTAmount));

             cmd.Parameters.AddWithValue("@SGST", string.Format("{0:0.00}", SGSTAmount));

             cmd.Parameters.AddWithValue("@TotalPrice", string.Format("{0:0.00}", totalAmount));



             //string.Format("{0:0.00}", Convert.ToInt32(SGST))
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
         
             ddlCusID.SelectedIndex = 0;
             ddlVehicleID.SelectedIndex = 0;
             txtInvoiceDate.Text = string.Empty;
             txtSalesPrice.Text = string.Empty;
            // txtCGST.Text = string.Empty;
            // txtSGST.Text = string.Empty;
             txtTotalAmt.Text = string.Empty;

         }

         protected void gvInvoice_SelectedIndexChanged(object sender, EventArgs e)
         {
             ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

             btnSave.Text = "Update";

             //txtInvoiceID.Text = gvVehicleSales.SelectedRow.Cells[1].Text;

             ddlCusID.SelectedIndex = ddlCusID.Items.IndexOf(ddlCusID.Items.FindByText(gvInvoice.SelectedRow.Cells[2].Text));

             ddlVehicleID.SelectedIndex = ddlVehicleID.Items.IndexOf(ddlVehicleID.Items.FindByText(gvInvoice.SelectedRow.Cells[3].Text));

             txtInvoiceDate.Text = gvInvoice.SelectedRow.Cells[4].Text;

             txtSalesPrice.Text = gvInvoice.SelectedRow.Cells[5].Text;

             txtCGST.Text = gvInvoice.SelectedRow.Cells[6].Text;

             txtSGST.Text = gvInvoice.SelectedRow.Cells[7].Text;

             txtTotalAmt.Text = gvInvoice.SelectedRow.Cells[8].Text;

             this.BindGrid();

         }



    }
}