using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ComplianceSite.Controllers
{
    public class TableController : Controller
    {
        // GET: Table
        public ActionResult Index()
        {
            return View();
        }

        // GET: Table/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Table/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Table/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Table/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Table/Edit/5
        [HttpPost]
        public ActionResult Edit(
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
                            return Json("Error inserting data into Database!");
                    }
                }
                return Json("Success inserting data into Database!");
            }
            catch
            {
                return Json("Error inserting data into Database!");
            }
        }

        // GET: Table/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Table/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
