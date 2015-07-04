﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BO;
using DTO;
using BL;
using AutoMapper;

namespace WS
{
    public class EventService : IEventService
    {

        public bool newEvent(EventDTO evDTO)
        {
            EventController ec = new EventController();
            Mapper.CreateMap<EventDTO, Event>()
                .ForMember(e => e.TicketType, opt => opt.Ignore());
            return ec.newEvent(Mapper.Map<Event>(evDTO));
        }

        public bool cancelEvent(int id)
        {
            EventController ec = new EventController();
            return ec.cancelEvent(id);
        }

        public bool updateEvent(EventDTO evDTO)
        {
            EventController ec = new EventController();
            Mapper.CreateMap<EventDTO, Event>()
                .ForMember(e => e.TicketType, opt => opt.Ignore());
            return ec.updateEvent(Mapper.Map<Event>(evDTO));
        }

        public List<EventDTO> getEvents(int page, int pageSize)
        {
            EventController ec = new EventController();
            Mapper.CreateMap<Event, EventDTO>()
                .ForMember(e => e.TicketType, opt => opt.Ignore())
                .ForMember(e => e.EventLocation, opt => opt.Ignore());
            return Mapper.Map<List<EventDTO>>(ec.getEvents(page, pageSize));
        }

        public EventDTO getEvent(int id)
        {
            EventController ec = new EventController();

            //Configuracion Automapper (Pasar a constructor asi queda mas prolijo?)
            Mapper.CreateMap<Event, EventDTO>()
                .ForMember(e => e.TicketType, opt => opt.MapFrom(x => x.TicketType))
                .ForMember(e => e.EventLocation, opt => opt.MapFrom(x => x.EventLocation));
            Mapper.CreateMap<EventLocation, EventLocationDTO>()
                .ForMember(eLoc => eLoc.Event, opt => opt.Ignore());
            Mapper.CreateMap<TicketType, TicketTypeDTO>()
                .ForMember(tt => tt.Ticket, opt => opt.MapFrom(x => x.Ticket))
                .ForMember(tt => tt.Event, opt => opt.Ignore());
            Mapper.CreateMap<Ticket, TicketDTO>()
                .ForMember(t => t.SubOrder, opt => opt.MapFrom(x => x.SubOrder))
                .ForMember(t => t.TicketType, opt => opt.Ignore());
            Mapper.CreateMap<SubOrder, SubOrderDTO>()
                .ForMember(so => so.Reservation, opt => opt.Ignore())
                .ForMember(so => so.Ticket, opt => opt.Ignore());

            return Mapper.Map<EventDTO>(ec.getEvent(id));
        }
        public List<EventDTO> searchEvents(string text, int page = 0, int pageSize = 0, DateTime maxDate = default(DateTime), DateTime minDate = default(DateTime), String local = "none", double price = 0, string type = "none")
        {
            EventController ec = new EventController();

            Mapper.CreateMap<Event, EventDTO>()
                .ForMember(e => e.TicketType, opt => opt.Ignore())
                .ForMember(e => e.EventLocation, opt => opt.MapFrom(x => x.EventLocation));
            Mapper.CreateMap<EventLocation, EventLocationDTO>()
                .ForMember(eLoc => eLoc.Event, opt => opt.Ignore());
            Mapper.CreateMap<TicketType, TicketTypeDTO>()
                .ForMember(tt => tt.Ticket, opt => opt.Ignore())
                .ForMember(tt => tt.Event, opt => opt.Ignore());
            
            return Mapper.Map<List<EventDTO>>(ec.searchEvents(text, page, pageSize, maxDate, minDate, local, price, type));
        }
        public List<EventLocationDTO> getLocals()
        {
            EventController ec = new EventController();
            
            Mapper.CreateMap<EventLocation, EventLocationDTO>()
                .ForMember(l => l.Event, opt => opt.Ignore());

            return Mapper.Map<List<EventLocationDTO>>(ec.getLocals());
        }
        public List<string> getEventType()
        {
            EventController ec = new EventController();

            return ec.getEventType();
        }
    }
}
