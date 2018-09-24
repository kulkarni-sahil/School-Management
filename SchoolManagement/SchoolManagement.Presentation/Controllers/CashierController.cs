using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using SchoolManagement.Presentation.Models;
namespace SchoolManagement.Presentation.Controllers
{
    public class CashierController : Controller
    {
        // GET: Cashier
        public ActionResult Payment()
        {
            return View();
        }
     
        public ActionResult StudentInvoices (int studentId)
        {
            List<Fee> studentFeeInvoiceList = null;
            var objContext = new SchoolManagementEntities( );

            var query = from invoices in objContext.Fees
                        where invoices.StudentId == studentId
                        select invoices;

            if( query.Count( ) > 0 )
            {
                studentFeeInvoiceList = query.ToList( );
            }

            return View(studentFeeInvoiceList);
        }
    }
}