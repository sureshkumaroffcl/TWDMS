using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace TwoWheelerDealership.TWD.TWD_Admin
{
    public partial class SparePartsReport1 : System.Web.UI.Page
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


            gvSpareParts.DataSource = dt;
            gvSpareParts.DataBind();

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



            gvSpareParts.DataSource = filteredDT;
            gvSpareParts.DataBind();

        }

        private DataTable GetDataFromDatabase()
        {
            // create and open connection to database
            SqlConnection con = Connection.GetConnection();
            con.Open();

            // retrieve data from database

            string SqlQuery = @"SELECT * FROM tblSpareparts";

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

            gvSpareParts.DataSource = filteredDT;
            gvSpareParts.DataBind();

            ReportDocument rpt = new ReportDocument();

            rpt.Load(Server.MapPath("SparePartsReport.rpt"));

            rpt.SetDatabaseLogon("Suresh", "Heartking", @"DESKTOP-T4QBL8F\SQLEXPRESSADV", "TwoWheelerDealership");


            rpt.SetDataSource(dv.ToTable());

            rptvewSpareParts.ReportSource = rpt;
            rptvewSpareParts.RefreshReport();

            rptvewSpareParts.DataBind();

            Response.ClearContent();
            Response.ClearHeaders();
            Response.Buffer = false;

            rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Spare Parts Details");


        }

    }
}