using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Text.RegularExpressions;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class VehicleSalesReport1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();

            }

        }

        private void BindGrid()
        {
            DataTable dt = GetDataFromDatabase();


            gvVehicleSales.DataSource = dt;
            gvVehicleSales.DataBind();

        }

         protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();

            DataTable dt = GetDataFromDatabase();
            DataView dv = dt.DefaultView;
            string filterExpression = string.Join(" OR ", dt.Columns.Cast<DataColumn>()
     .Where(col => col.DataType == typeof(string) || Regex.IsMatch(searchTerm, "^[a-zA-Z0-9]*$"))
     .Select(col => string.Format("CONVERT({0}, 'System.String') LIKE '%{1}%'", col.ColumnName, searchTerm))
     .ToArray());

            dv.RowFilter = filterExpression;
            DataTable filteredDT = dv.ToTable();



            gvVehicleSales.DataSource = filteredDT;
            gvVehicleSales.DataBind();

        }
         private DataTable GetDataFromDatabase()
         {
             // create and open connection to database
             SqlConnection con = Connection.GetConnection();
             con.Open();

             // retrieve data from database
             string SqlQuery = @" SELECT tblVehicleSales.SalesID,tblVehicleSales.CusID,tblVehicleSales.VehicleID,tblVehicleSales.EmpID,
tblVehicleSales.SalesDate, tblVehicleSales.SalesPrice,tblCustomer.CusName, tblCustomer.Address,
tblVehicleMaster.VehicleName,tblVehicleMaster.VehicleType, tblEmployee.EmpName  
FROM tblVehicleSales 
INNER JOIN tblCustomer ON tblVehicleSales.CusID = tblCustomer.CusID
INNER JOIN tblVehicleMaster ON tblVehicleSales.VehicleID = tblVehicleMaster.VehicleID
INNER JOIN tblEmployee ON tblVehicleSales.EmpID = tblEmployee.EmpID";

             SqlCommand cmd = new SqlCommand(SqlQuery, con);

             SqlDataAdapter da = new SqlDataAdapter(cmd);
             DataTable dt = new DataTable();
             da.Fill(dt);

             // close connection to database
             con.Close();

             return dt;
         }

         protected void btnPrint_Click(object sender, EventArgs e)
         {
             string searchTerm = txtSearch.Text.Trim();



             DataTable dt = GetDataFromDatabase();

             DataView dv = dt.DefaultView;

             string filterExpression = string.Join(" OR ", dt.Columns.Cast<DataColumn>()
        .Where(col => col.DataType == typeof(string) || Regex.IsMatch(searchTerm, "^[a-zA-Z0-9]*$"))
        .Select(col => string.Format("CONVERT({0}, 'System.String') LIKE '%{1}%'", col.ColumnName, searchTerm))
        .ToArray());

             dv.RowFilter = filterExpression;
             DataTable filteredDT = dv.ToTable();

             gvVehicleSales.DataSource = filteredDT;
             gvVehicleSales.DataBind();



             //DataTable dt = new DataTable();
             //dt = (DataTable)gvInvoice.DataSource;

             //gvInvoice.DataBind();

             ReportDocument rpt = new ReportDocument();

             rpt.Load(Server.MapPath("VehicleSalesReport.rpt"));

             rpt.SetDatabaseLogon("Suresh", "Heartking", @"DESKTOP-T4QBL8F\SQLEXPRESSADV", "TwoWheelerDealership");


             rpt.SetDataSource(dv.ToTable());

             rptvewVehicleSales.ReportSource = rpt;
             rptvewVehicleSales.RefreshReport();

             rptvewVehicleSales.DataBind();

             Response.ClearContent();
             Response.ClearHeaders();
             Response.Buffer = false;

             rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Vehicle Sales Details");


         }


    }
}