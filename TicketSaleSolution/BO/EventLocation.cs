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
    using System.Runtime.Serialization;
    using System.Collections.Generic;
    
    [DataContract(IsReference = true)]
    [KnownType(typeof(Event))]
    
    public partial class EventLocation
    {
        public EventLocation()
        {
            this.Event = new HashSet<Event>();
        }
    
    	[DataMember]
        public int id { get; set; }
    	[DataMember]
        public string name { get; set; }
    	[DataMember]
        public int phoneNumber { get; set; }
    	[DataMember]
        public string address { get; set; }
    
    	[DataMember]
        public virtual ICollection<Event> Event { get; set; }
    }
}
