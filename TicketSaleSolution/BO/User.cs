//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BO
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.Reservation = new HashSet<Reservation>();
        }
    
        public int id { get; set; }
        public string mail { get; set; }
        public string password { get; set; }
        public string name { get; set; }
        public string lastName { get; set; }
        public System.DateTime dateBirth { get; set; }
        public byte userType { get; set; }
        public byte active { get; set; }
        public string token { get; set; }
    
        public virtual ICollection<Reservation> Reservation { get; set; }
    }
}
