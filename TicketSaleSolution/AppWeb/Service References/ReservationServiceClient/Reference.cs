﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.34209
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppWeb.ReservationServiceClient {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ReservationServiceClient.IReservationService")]
    public interface IReservationService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/newReservation", ReplyAction="http://tempuri.org/IReservationService/newReservationResponse")]
        bool newReservation(DTO.ReservationDTO resDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/newReservation", ReplyAction="http://tempuri.org/IReservationService/newReservationResponse")]
        System.Threading.Tasks.Task<bool> newReservationAsync(DTO.ReservationDTO resDTO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/autoCancelation", ReplyAction="http://tempuri.org/IReservationService/autoCancelationResponse")]
        bool autoCancelation();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/autoCancelation", ReplyAction="http://tempuri.org/IReservationService/autoCancelationResponse")]
        System.Threading.Tasks.Task<bool> autoCancelationAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservationsByUser", ReplyAction="http://tempuri.org/IReservationService/getReservationsByUserResponse")]
        DTO.ReservationDTO[] getReservationsByUser(int idUser, int page, int pageSize, bool onlyPayments);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservationsByUser", ReplyAction="http://tempuri.org/IReservationService/getReservationsByUserResponse")]
        System.Threading.Tasks.Task<DTO.ReservationDTO[]> getReservationsByUserAsync(int idUser, int page, int pageSize, bool onlyPayments);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservations", ReplyAction="http://tempuri.org/IReservationService/getReservationsResponse")]
        DTO.ReservationDTO[] getReservations(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservations", ReplyAction="http://tempuri.org/IReservationService/getReservationsResponse")]
        System.Threading.Tasks.Task<DTO.ReservationDTO[]> getReservationsAsync(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservation", ReplyAction="http://tempuri.org/IReservationService/getReservationResponse")]
        DTO.ReservationDTO getReservation(int idReservation);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservation", ReplyAction="http://tempuri.org/IReservationService/getReservationResponse")]
        System.Threading.Tasks.Task<DTO.ReservationDTO> getReservationAsync(int idReservation);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservationCountByUser", ReplyAction="http://tempuri.org/IReservationService/getReservationCountByUserResponse")]
        int getReservationCountByUser(int idUser, bool onlyPayments);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/getReservationCountByUser", ReplyAction="http://tempuri.org/IReservationService/getReservationCountByUserResponse")]
        System.Threading.Tasks.Task<int> getReservationCountByUserAsync(int idUser, bool onlyPayments);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/cancelSubOrder", ReplyAction="http://tempuri.org/IReservationService/cancelSubOrderResponse")]
        bool cancelSubOrder(int idSO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/cancelSubOrder", ReplyAction="http://tempuri.org/IReservationService/cancelSubOrderResponse")]
        System.Threading.Tasks.Task<bool> cancelSubOrderAsync(int idSO);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/cancelAllSubOrders", ReplyAction="http://tempuri.org/IReservationService/cancelAllSubOrdersResponse")]
        bool cancelAllSubOrders(int idRes);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/cancelAllSubOrders", ReplyAction="http://tempuri.org/IReservationService/cancelAllSubOrdersResponse")]
        System.Threading.Tasks.Task<bool> cancelAllSubOrdersAsync(int idRes);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/generateNewTicket", ReplyAction="http://tempuri.org/IReservationService/generateNewTicketResponse")]
        DTO.TicketDTO generateNewTicket(int idTicketType);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IReservationService/generateNewTicket", ReplyAction="http://tempuri.org/IReservationService/generateNewTicketResponse")]
        System.Threading.Tasks.Task<DTO.TicketDTO> generateNewTicketAsync(int idTicketType);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IReservationServiceChannel : AppWeb.ReservationServiceClient.IReservationService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ReservationServiceClient : System.ServiceModel.ClientBase<AppWeb.ReservationServiceClient.IReservationService>, AppWeb.ReservationServiceClient.IReservationService {
        
        public ReservationServiceClient() {
        }
        
        public ReservationServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ReservationServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ReservationServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ReservationServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool newReservation(DTO.ReservationDTO resDTO) {
            return base.Channel.newReservation(resDTO);
        }
        
        public System.Threading.Tasks.Task<bool> newReservationAsync(DTO.ReservationDTO resDTO) {
            return base.Channel.newReservationAsync(resDTO);
        }
        
        public bool autoCancelation() {
            return base.Channel.autoCancelation();
        }
        
        public System.Threading.Tasks.Task<bool> autoCancelationAsync() {
            return base.Channel.autoCancelationAsync();
        }
        
        public DTO.ReservationDTO[] getReservationsByUser(int idUser, int page, int pageSize, bool onlyPayments) {
            return base.Channel.getReservationsByUser(idUser, page, pageSize, onlyPayments);
        }
        
        public System.Threading.Tasks.Task<DTO.ReservationDTO[]> getReservationsByUserAsync(int idUser, int page, int pageSize, bool onlyPayments) {
            return base.Channel.getReservationsByUserAsync(idUser, page, pageSize, onlyPayments);
        }
        
        public DTO.ReservationDTO[] getReservations(int page, int pageSize) {
            return base.Channel.getReservations(page, pageSize);
        }
        
        public System.Threading.Tasks.Task<DTO.ReservationDTO[]> getReservationsAsync(int page, int pageSize) {
            return base.Channel.getReservationsAsync(page, pageSize);
        }
        
        public DTO.ReservationDTO getReservation(int idReservation) {
            return base.Channel.getReservation(idReservation);
        }
        
        public System.Threading.Tasks.Task<DTO.ReservationDTO> getReservationAsync(int idReservation) {
            return base.Channel.getReservationAsync(idReservation);
        }
        
        public int getReservationCountByUser(int idUser, bool onlyPayments) {
            return base.Channel.getReservationCountByUser(idUser, onlyPayments);
        }
        
        public System.Threading.Tasks.Task<int> getReservationCountByUserAsync(int idUser, bool onlyPayments) {
            return base.Channel.getReservationCountByUserAsync(idUser, onlyPayments);
        }
        
        public bool cancelSubOrder(int idSO) {
            return base.Channel.cancelSubOrder(idSO);
        }
        
        public System.Threading.Tasks.Task<bool> cancelSubOrderAsync(int idSO) {
            return base.Channel.cancelSubOrderAsync(idSO);
        }
        
        public bool cancelAllSubOrders(int idRes) {
            return base.Channel.cancelAllSubOrders(idRes);
        }
        
        public System.Threading.Tasks.Task<bool> cancelAllSubOrdersAsync(int idRes) {
            return base.Channel.cancelAllSubOrdersAsync(idRes);
        }
        
        public DTO.TicketDTO generateNewTicket(int idTicketType) {
            return base.Channel.generateNewTicket(idTicketType);
        }
        
        public System.Threading.Tasks.Task<DTO.TicketDTO> generateNewTicketAsync(int idTicketType) {
            return base.Channel.generateNewTicketAsync(idTicketType);
        }
    }
}
