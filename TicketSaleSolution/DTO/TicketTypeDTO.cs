﻿namespace DTO
{
    using System;
    using System.Collections.Generic;
    using System.Runtime.Serialization;
    using System.Linq;
    using COM;
   [DataContract]
    public class TicketTypeDTO
    {
        public TicketTypeDTO()
        {
            this.Ticket = new HashSet<TicketDTO>();
        }

        public int getTotalTicketCount()
        {
            return Ticket.Count;
        }
        public int getAvailableTicketCount()
        {
            int unavailable = 0;
            int totalTickets = finalNum - startNum;
            foreach (var t in Ticket)
            {
                if (t.SubOrder.Where(so => so.active == RESERVATION.SUBORDER.ACTIVE).Count() >= 1)
                {
                    unavailable++;
                }
            }
            return totalTickets - unavailable;
        }

       [DataMember]
        public int id { get; set; }
       [DataMember]
       public double cost { get; set; }
       [DataMember] 
       public string description { get; set; }
       [DataMember] 
       public int startNum { get; set; }
       [DataMember] 
       public int finalNum { get; set; }
       [DataMember] 
       public int idEvent { get; set; }
       [DataMember]
        public virtual EventDTO Event { get; set; }
       [DataMember] 
       public virtual ICollection<TicketDTO> Ticket { get; set; }
    }
}