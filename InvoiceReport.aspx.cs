using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class InvoiceReport1 : System.Web.UI.Page
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


                        gvInvoice.DataSource = dt;
                        gvInvoice.DataBind();

          }


        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();

            DataTable dt = GetDataFromDatabase();
            DataView dv = dt.DefaultView;

           //dv.RowFilter = "CusID,VehicleID LIKE '%" + searchTerm + "%'";

            //dv.RowFilter = string.Format("CusID LIKE '%{0}%'", searchTerm);
            //DataTable filteredDT = dv.ToTable();


      //      string filterExpression = string.Join(" OR ", dt.Columns.Cast<DataColumn>()
      //.Where(col => col.DataType == typeof(string))
      //      .Select(col => string.Format("{0} LIKE '%{1}%'", col.ColumnName, Regex.Replace(searchTerm, "[^a-zA-Z0-9]+", "")))
      //.ToArray());
      //      dv.RowFilter = filterExpression;

        //    string filterExpression = string.Join(" OR ", dt.Columns.Cast<DataColumn>()
        //.Where(col => col.DataType == typeof(string))
        //.Select(col => string.Format("{0} LIKE '%{1}%'", col.ColumnName, new string(searchTerm.Where(c => char.IsLetterOrDigit(c) || char.IsNumber(c) || char.IsSymbol(c)).ToArray())))
        //.ToArray());
        //    dv.RowFilter = filterExpression;


            string filterExpression = string.Join(" OR ", dt.Columns.Cast<DataColumn>()
       .Where(col => col.DataType == typeof(string) || Regex.IsMatch(searchTerm, "^[a-zA-Z0-9]*$"))
       .Select(col => string.Format("CONVERT({0}, 'System.String') LIKE '%{1}%'", col.ColumnName, searchTerm))
       .ToArray());

            dv.RowFilter = filterExpression;
            DataTable filteredDT = dv.ToTable();

            
          
            gvInvoice.DataSource = filteredDT;
            gvInvoice.DataBind();

        }


        private DataTable GetDataFromDatabase()
        {
            // create and open connection to database
            SqlConnection con = Connection.GetConnection();
            con.Open();

            // retrieve data from database

            string SqlQuery = @"SELECT tblInvoice.InvoiceID,tblInvoice.CusID,tblInvoice.VehicleID, tblInvoice.InvoiceDate, tblInvoice.SalesPrice,
 tblInvoice.CGST, tblInvoice.SGST, tblInvoice.TotalPrice,
tblCustomer.CusName, tblCustomer.Address,tblVehicleMaster.VehicleName,  tblVehicleMaster.CompanyName
FROM tblInvoice 
INNER JOIN tblCustomer ON tblInvoice.CusID = tblCustomer.CusID
INNER JOIN tblVehicleMaster ON tblInvoice.VehicleID = tblVehicleMaster.VehicleID";


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

            gvInvoice.DataSource = filteredDT;
            gvInvoice.DataBind();

            

            //DataTable dt = new DataTable();
            //dt = (DataTable)gvInvoice.DataSource;

            //gvInvoice.DataBind();

            ReportDocument rpt = new ReportDocument();

            rpt.Load(Server.MapPath("InvoiceReport.rpt"));

            rpt.SetDatabaseLogon("Suresh", "Heartking", @"DESKTOP-T4QBL8F\SQLEXPRESSADV", "TwoWheelerDealership");

           
            rpt.SetDataSource(dv.ToTable());

            rptvewInvocie.ReportSource = rpt;
            rptvewInvocie.RefreshReport();

            rptvewInvocie.DataBind();

            Response.ClearContent();
            Response.ClearHeaders();
            Response.Buffer = false;

            rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Tax Invoice");


        }
    }


}