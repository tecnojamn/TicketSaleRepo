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
    
    public partial class Reservation
    {
        public Reservation()
        {
            this.SubOrder = new HashSet<SubOrder>();
        }
    
        public int id { get; set; }
        public int idUser { get; set; }
        public System.DateTime date { get; set; }
    
        public virtual Payment Payment { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<SubOrder> SubOrder { get; set; }
    }
}
