using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorRSI
{
    public partial class altaEmpleados : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Conservar el id
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos();
                }

                if (Request.QueryString["op"] != null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch (sOpc)
                    {
                        case "C":
                            this.lbltitulo.Text = "Ingresar nuevo empleado";
                            this.BtnCreate.Visible = true;
                            break;
                        case "R":
                            this.lbltitulo.Text = "Consulta de empleado";
                            break;
                        case "U":
                            this.lbltitulo.Text = "Modificar empleado";
                            this.BtnUpdate.Visible = true;
                            break;
                        case "D":
                            this.lbltitulo.Text = "Eliminar empleado";
                            this.BtnDelete.Visible = true;
                            break;
                    }
                }
            }
        }

        void CargarDatos()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_readEmpleado", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@IDEmpleado", SqlDbType.Int).Value = sID;
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];
            tbNombre.Text = row[1].ToString();

            DateTime date1 = (DateTime)row[2];
            tbFechaNacimiento.Text = date1.ToString("yyyy/MM/dd");

            tbDireccion.Text = row[3].ToString();
            tbDepartamento.Text = row[4].ToString();

            DateTime date2 = (DateTime)row[5];
            tbFechaIngreso.Text = date2.ToString("yyyy/MM/dd");
            con.Close();
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("./consultarEmpleados.aspx?op=C");
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_createEmpleado", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = tbNombre.Text;
            cmd.Parameters.Add("@fechaNacimiento", SqlDbType.Date).Value = tbFechaNacimiento.Text;
            cmd.Parameters.Add("@direccion", SqlDbType.VarChar).Value = tbDireccion.Text;
            cmd.Parameters.Add("@IDDepartamento", SqlDbType.VarChar).Value = tbDepartamento.Text;
            cmd.Parameters.Add("@fechaIngreso", SqlDbType.Date).Value = tbFechaIngreso.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("./consultarEmpleados.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_updateEmpleado", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDEmpleado", SqlDbType.Int).Value = sID;
            cmd.Parameters.Add("@nombre", SqlDbType.VarChar).Value = tbNombre.Text;
            cmd.Parameters.Add("@fechaNacimiento", SqlDbType.Date).Value = tbFechaNacimiento.Text;
            cmd.Parameters.Add("@direccion", SqlDbType.VarChar).Value = tbDireccion.Text;
            cmd.Parameters.Add("@IDDepartamento", SqlDbType.VarChar).Value = tbDepartamento.Text;
            cmd.Parameters.Add("@fechaIngreso", SqlDbType.Date).Value = tbFechaIngreso.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("./consultarEmpleados.aspx");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_deleteEmpleado", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@IDEmpleado", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("./consultarEmpleados.aspx");
        }
    }
}