//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolManagement.Presentation.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Fee
    {
        public int InvoiceId { get; set; }
        public System.DateTime PaymentDate { get; set; }
        public int AmountPaid { get; set; }
        public int StudentId { get; set; }
        public int CashierId { get; set; }
    
        public virtual Cashier Cashier { get; set; }
        public virtual Student Student { get; set; }
    }
}