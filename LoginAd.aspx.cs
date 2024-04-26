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
    public partial class LoginAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ResetRecords();
            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //TO-DO: Check login Username & Password
            SqlConnection con = Connection.GetConnection();
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(@"SELECT * FROM tblLogin WHERE UserName ='" + txtLogin.Text + "' and Password = '" + txtPasswd.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Response.Redirect("HomeAd.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Username or Password')", true);
            }
            con.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }

        private void ResetRecords()
        {
            txtLogin.Text = string.Empty;
            txtPasswd.Text = string.Empty;
        }
    }
}