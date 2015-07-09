﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.34209
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppWeb.EventServiceClient {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="EventServiceClient.IEventService")]
    public interface IEventService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/newEvent", ReplyAction="http://tempuri.org/IEventService/newEventResponse")]
        bool newEvent(DTO.EventDTO evDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/newEvent", ReplyAction="http://tempuri.org/IEventService/newEventResponse")]
        System.Threading.Tasks.Task<bool> newEventAsync(DTO.EventDTO evDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/cancelEvent", ReplyAction="http://tempuri.org/IEventService/cancelEventResponse")]
        bool cancelEvent(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/cancelEvent", ReplyAction="http://tempuri.org/IEventService/cancelEventResponse")]
        System.Threading.Tasks.Task<bool> cancelEventAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/updateEvent", ReplyAction="http://tempuri.org/IEventService/updateEventResponse")]
        bool updateEvent(DTO.EventDTO evDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/updateEvent", ReplyAction="http://tempuri.org/IEventService/updateEventResponse")]
        System.Threading.Tasks.Task<bool> updateEventAsync(DTO.EventDTO evDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEvents", ReplyAction="http://tempuri.org/IEventService/getEventsResponse")]
        DTO.EventDTO[] getEvents(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEvents", ReplyAction="http://tempuri.org/IEventService/getEventsResponse")]
        System.Threading.Tasks.Task<DTO.EventDTO[]> getEventsAsync(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getFeaturedEvents", ReplyAction="http://tempuri.org/IEventService/getFeaturedEventsResponse")]
        DTO.EventDTO[] getFeaturedEvents(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getFeaturedEvents", ReplyAction="http://tempuri.org/IEventService/getFeaturedEventsResponse")]
        System.Threading.Tasks.Task<DTO.EventDTO[]> getFeaturedEventsAsync(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEvent", ReplyAction="http://tempuri.org/IEventService/getEventResponse")]
        DTO.EventDTO getEvent(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEvent", ReplyAction="http://tempuri.org/IEventService/getEventResponse")]
        System.Threading.Tasks.Task<DTO.EventDTO> getEventAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/searchEvents", ReplyAction="http://tempuri.org/IEventService/searchEventsResponse")]
        DTO.EventDTO[] searchEvents(string text, int page, int pageSize, System.DateTime maxDate, System.DateTime minDate, string local, double price, string type);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/searchEvents", ReplyAction="http://tempuri.org/IEventService/searchEventsResponse")]
        System.Threading.Tasks.Task<DTO.EventDTO[]> searchEventsAsync(string text, int page, int pageSize, System.DateTime maxDate, System.DateTime minDate, string local, double price, string type);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getLocals", ReplyAction="http://tempuri.org/IEventService/getLocalsResponse")]
        DTO.EventLocationDTO[] getLocals();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getLocals", ReplyAction="http://tempuri.org/IEventService/getLocalsResponse")]
        System.Threading.Tasks.Task<DTO.EventLocationDTO[]> getLocalsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEventType", ReplyAction="http://tempuri.org/IEventService/getEventTypeResponse")]
        string[] getEventType();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IEventService/getEventType", ReplyAction="http://tempuri.org/IEventService/getEventTypeResponse")]
        System.Threading.Tasks.Task<string[]> getEventTypeAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IEventServiceChannel : AppWeb.EventServiceClient.IEventService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class EventServiceClient : System.ServiceModel.ClientBase<AppWeb.EventServiceClient.IEventService>, AppWeb.EventServiceClient.IEventService {
        
        public EventServiceClient() {
        }
        
        public EventServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public EventServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EventServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public EventServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool newEvent(DTO.EventDTO evDTO) {
            return base.Channel.newEvent(evDTO);
        }
        
        public System.Threading.Tasks.Task<bool> newEventAsync(DTO.EventDTO evDTO) {
            return base.Channel.newEventAsync(evDTO);
        }
        
        public bool cancelEvent(int id) {
            return base.Channel.cancelEvent(id);
        }
        
        public System.Threading.Tasks.Task<bool> cancelEventAsync(int id) {
            return base.Channel.cancelEventAsync(id);
        }
        
        public bool updateEvent(DTO.EventDTO evDTO) {
            return base.Channel.updateEvent(evDTO);
        }
        
        public System.Threading.Tasks.Task<bool> updateEventAsync(DTO.EventDTO evDTO) {
            return base.Channel.updateEventAsync(evDTO);
        }
        
        public DTO.EventDTO[] getEvents(int page, int pageSize) {
            return base.Channel.getEvents(page, pageSize);
        }
        
        public System.Threading.Tasks.Task<DTO.EventDTO[]> getEventsAsync(int page, int pageSize) {
            return base.Channel.getEventsAsync(page, pageSize);
        }
        
        public DTO.EventDTO[] getFeaturedEvents(int page, int pageSize) {
            return base.Channel.getFeaturedEvents(page, pageSize);
        }
        
        public System.Threading.Tasks.Task<DTO.EventDTO[]> getFeaturedEventsAsync(int page, int pageSize) {
            return base.Channel.getFeaturedEventsAsync(page, pageSize);
        }
        
        public DTO.EventDTO getEvent(int id) {
            return base.Channel.getEvent(id);
        }
        
        public System.Threading.Tasks.Task<DTO.EventDTO> getEventAsync(int id) {
            return base.Channel.getEventAsync(id);
        }
        
        public DTO.EventDTO[] searchEvents(string text, int page, int pageSize, System.DateTime maxDate, System.DateTime minDate, string local, double price, string type) {
            return base.Channel.searchEvents(text, page, pageSize, maxDate, minDate, local, price, type);
        }
        
        public System.Threading.Tasks.Task<DTO.EventDTO[]> searchEventsAsync(string text, int page, int pageSize, System.DateTime maxDate, System.DateTime minDate, string local, double price, string type) {
            return base.Channel.searchEventsAsync(text, page, pageSize, maxDate, minDate, local, price, type);
        }
        
        public DTO.EventLocationDTO[] getLocals() {
            return base.Channel.getLocals();
        }
        
        public System.Threading.Tasks.Task<DTO.EventLocationDTO[]> getLocalsAsync() {
            return base.Channel.getLocalsAsync();
        }
        
        public string[] getEventType() {
            return base.Channel.getEventType();
        }
        
        public System.Threading.Tasks.Task<string[]> getEventTypeAsync() {
            return base.Channel.getEventTypeAsync();
        }
    }
}
