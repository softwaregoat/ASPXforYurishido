using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComplianceSite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //Populating a DataTable from database.
                DataTable dt = this.GetData();

                // You will have to set the function if userRole is Admin or not here.
                var userRole = "Admin"; // Admin or something else.
                //userRole = Page.User.Identity.Name;
                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class='table table-bordered table-striped'><thead class='thead-dark'>");
                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                if (userRole == "Admin")
                {
                    html.Append("<th>Update</th></tr></thead>");
                }
                else
                {
                    html.Append("</tr></thead>");
                }


                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        if (userRole == "Admin")
                        {
                            if (column.ColumnName == "IssueDesc")
                            {
                                html.Append("<td><input type='text' value='");
                                html.Append(row[column.ColumnName]);
                                html.Append("'/></td>");
                            }
                            else if (column.ColumnName == "InitiatingReason")
                            {
                                html.Append("<td><select>");
                                if (row[column.ColumnName].ToString() == "QA Finding")
                                {
                                    html.Append("<option value='QA Finding' selected>QA Finding</option>");
                                }
                                else
                                {
                                    html.Append("<option value='QA Finding'>QA Finding</option>");
                                }

                                if (row[column.ColumnName].ToString() == "Supplier Disclosure")
                                {
                                    html.Append("<option value='Supplier Disclosure' selected>Supplier Disclosure</option>");
                                }
                                else
                                {
                                    html.Append("<option value='Supplier Disclosure'>Supplier Disclosure</option>");
                                }
                                html.Append("</select></td>");
                            }
                            else if (column.ColumnName == "IssueOrigin")
                            {
                                html.Append("<td><select>");
                                if (row[column.ColumnName].ToString() == "Supplier")
                                {
                                    html.Append("<option value='Supplier' selected>Supplier</option>");
                                }
                                else
                                {
                                    html.Append("<option value='Supplier'>Supplier</option>");
                                }

                                if (row[column.ColumnName].ToString() == "UY")
                                {
                                    html.Append("<option value='UY' selected>UY</option>");
                                }
                                else
                                {
                                    html.Append("<option value='UY'>UY</option>");
                                }

                                html.Append("</select></td>");
                            }
                            else if (column.ColumnName == "EntryDate")
                            {
                                html.Append("<td>");
                                html.Append(DateTime.Parse(row[column.ColumnName].ToString()).ToShortDateString());
                                html.Append("</td>");
                            }
                            else
                            {
                                html.Append("<td>");
                                html.Append(row[column.ColumnName]);
                                html.Append("</td>");
                            }
                        }
                        else
                        {
                            if (column.ColumnName == "EntryDate")
                            {
                                html.Append("<td>");
                                html.Append(DateTime.Parse(row[column.ColumnName].ToString()).ToShortDateString());
                                html.Append("</td>");
                            }
                            else
                            {
                                html.Append("<td>");
                                html.Append(row[column.ColumnName]);
                                html.Append("</td>");
                            }
                        }

                    }
                    if (userRole == "Admin")
                    {
                        html.Append("<td><input type='button' class='update' value='Update'/></td></tr>");
                    }
                    else
                    {
                        html.Append("</tr>");
                    }
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

                site.Items.Add(new ListItem("Site1", "Site1"));
                site.Items.Add(new ListItem("Site2", "Site2"));
                site.Items.Add(new ListItem("Site3", "Site3"));
                site.Items.Add(new ListItem("Site4", "Site4"));
                site.Items.Add(new ListItem("Site5", "Site5"));

                filter_site.Items.Add(new ListItem("Site1", "Site1"));
                filter_site.Items.Add(new ListItem("Site2", "Site2"));
                filter_site.Items.Add(new ListItem("Site3", "Site3"));
                filter_site.Items.Add(new ListItem("Site4", "Site4"));
                filter_site.Items.Add(new ListItem("Site5", "Site5"));

                filter_subcode.Items.Add(new ListItem("THD", "THD"));
                filter_subcode.Items.Add(new ListItem("403", "403"));
                filter_subcode.Items.Add(new ListItem("MSE", "MSE"));
                filter_subcode.Items.Add(new ListItem("SUB", "SUB"));


                program.Items.Add(new ListItem("Program1", "Program1"));
                program.Items.Add(new ListItem("Program2", "Program2"));
                program.Items.Add(new ListItem("Program3", "Program3"));
                program.Items.Add(new ListItem("Program4", "Program4"));
                program.Items.Add(new ListItem("Program5", "Program5"));


                reason.Items.Add(new ListItem("QA Finding", "QA Finding"));
                reason.Items.Add(new ListItem("Supplier Disclosure", "Supplier Disclosure"));

                issue.Items.Add(new ListItem("Supplier", "Supplier"));
                issue.Items.Add(new ListItem("UY", "UY"));

                subcode.Text = "";
                defect.Text = "";
                description.Value = "";
            }
        }
        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["abigail"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tbl]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["abigail"].ConnectionString;
            int UniqueID = 1;
            string EntryDate = DateTime.Now.ToShortDateString();
            string Program = program.Value;
            string ProgramSubcode = subcode.Text;
            string InitiatingReason = reason.Value;
            string IssueOrigin = issue.Value;
            string IssueDesc = description.Value;
            string OriginalDefect = defect.Text;
            string EnteredByUserID = "";
            string Site = site.Value;
            var sql1 = "SELECT max([UniqueID])  FROM[abigail].[dbo].[tbl]  WHERE year([EntryDate]) = '" + DateTime.Now.Year + "'";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sql1, con))
                {
                    con.Open();
                    var temp = cmd.ExecuteScalar();
                    if (temp != null)
                    {
                        UniqueID = int.Parse(temp.ToString()) + 1;
                    }
                    con.Close();
                }
            }
            string UIDFull = Site + "-" + DateTime.Now.Year + "-" + ProgramSubcode + "-" + UniqueID.ToString("00000") +"-A"; 

            string sql = "INSERT INTO[dbo].[tbl] ([UniqueID] ,[EntryDate] ,[Program] ,[ProgramSubcode] ,[InitiatingReason] ,[IssueOrigin] ,[IssueDesc] ,[OriginalDefect] ,[EnteredByUserID] ,[Site], [UIDFull]) VALUES (" +
                "'" + UniqueID +
                "' ,'" + EntryDate +
                "' ,'" + Program +
                "' ,'" + ProgramSubcode +
                "' ,'" + InitiatingReason +
                "' ,'" + IssueOrigin +
                "' ,'" + IssueDesc +
                "' ,'" + OriginalDefect +
                "' ,'" + EnteredByUserID +
                "' ,'" + Site +
                "' ,'" + UIDFull +
                "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand command = new SqlCommand(sql, con))
                {
                    con.Open();
                    int result = command.ExecuteNonQuery();
                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                }
            }
            Response.Redirect("~/WebForm1.aspx");
        }
        [System.Web.Services.WebMethod]
        public static string UpdateRow(
            string RecordID = "",
            string InitiatingReason = "",
            string IssueOrigin = "",
            string IssueDesc = ""
           )
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["abigail"].ConnectionString;
                var sql = "UPDATE [dbo].[tbl] SET " +
                    "[InitiatingReason] = '" + InitiatingReason +
                    "' ,[IssueOrigin] = '" + IssueOrigin +
                    "' ,[IssueDesc] = '" + IssueDesc +
                    "' WHERE [RecordID] = '" + RecordID +
                    "'";
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand command = new SqlCommand(sql, con))
                    {
                        con.Open();
                        int result = command.ExecuteNonQuery();
                        // Check Error
                        if (result < 0)
                            return "Error inserting data into Database!";
                    }
                }
                return "Success inserting data into Database!";
            }
            catch
            {
                return "Error inserting data into Database!";
            }
        }
    }
}