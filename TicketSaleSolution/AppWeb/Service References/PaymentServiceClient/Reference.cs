﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.34209
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppWeb.PaymentServiceClient {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="PaymentServiceClient.IPaymentService")]
    public interface IPaymentService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPayment", ReplyAction="http://tempuri.org/IPaymentService/getPaymentResponse")]
        DTO.PaymentDTO getPayment(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPayment", ReplyAction="http://tempuri.org/IPaymentService/getPaymentResponse")]
        System.Threading.Tasks.Task<DTO.PaymentDTO> getPaymentAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPayments", ReplyAction="http://tempuri.org/IPaymentService/getPaymentsResponse")]
        DTO.PaymentDTO[] getPayments(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPayments", ReplyAction="http://tempuri.org/IPaymentService/getPaymentsResponse")]
        System.Threading.Tasks.Task<DTO.PaymentDTO[]> getPaymentsAsync(int page, int pageSize);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/newPayment", ReplyAction="http://tempuri.org/IPaymentService/newPaymentResponse")]
        int newPayment(DTO.PaymentDTO p);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/newPayment", ReplyAction="http://tempuri.org/IPaymentService/newPaymentResponse")]
        System.Threading.Tasks.Task<int> newPaymentAsync(DTO.PaymentDTO p);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/updatePayment", ReplyAction="http://tempuri.org/IPaymentService/updatePaymentResponse")]
        bool updatePayment(DTO.PaymentDTO p);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/updatePayment", ReplyAction="http://tempuri.org/IPaymentService/updatePaymentResponse")]
        System.Threading.Tasks.Task<bool> updatePaymentAsync(DTO.PaymentDTO p);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPaymentLocations", ReplyAction="http://tempuri.org/IPaymentService/getPaymentLocationsResponse")]
        DTO.PaymentLocationDTO[] getPaymentLocations();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/getPaymentLocations", ReplyAction="http://tempuri.org/IPaymentService/getPaymentLocationsResponse")]
        System.Threading.Tasks.Task<DTO.PaymentLocationDTO[]> getPaymentLocationsAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/newCashPayment", ReplyAction="http://tempuri.org/IPaymentService/newCashPaymentResponse")]
        bool newCashPayment(DTO.CashPaymentDTO cp);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPaymentService/newCashPayment", ReplyAction="http://tempuri.org/IPaymentService/newCashPaymentResponse")]
        System.Threading.Tasks.Task<bool> newCashPaymentAsync(DTO.CashPaymentDTO cp);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IPaymentServiceChannel : AppWeb.PaymentServiceClient.IPaymentService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class PaymentServiceClient : System.ServiceModel.ClientBase<AppWeb.PaymentServiceClient.IPaymentService>, AppWeb.PaymentServiceClient.IPaymentService {
        
        public PaymentServiceClient() {
        }
        
        public PaymentServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public PaymentServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PaymentServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PaymentServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public DTO.PaymentDTO getPayment(int id) {
            return base.Channel.getPayment(id);
        }
        
        public System.Threading.Tasks.Task<DTO.PaymentDTO> getPaymentAsync(int id) {
            return base.Channel.getPaymentAsync(id);
        }
        
        public DTO.PaymentDTO[] getPayments(int page, int pageSize) {
            return base.Channel.getPayments(page, pageSize);
        }
        
        public System.Threading.Tasks.Task<DTO.PaymentDTO[]> getPaymentsAsync(int page, int pageSize) {
            return base.Channel.getPaymentsAsync(page, pageSize);
        }
        
        public int newPayment(DTO.PaymentDTO p) {
            return base.Channel.newPayment(p);
        }
        
        public System.Threading.Tasks.Task<int> newPaymentAsync(DTO.PaymentDTO p) {
            return base.Channel.newPaymentAsync(p);
        }
        
        public bool updatePayment(DTO.PaymentDTO p) {
            return base.Channel.updatePayment(p);
        }
        
        public System.Threading.Tasks.Task<bool> updatePaymentAsync(DTO.PaymentDTO p) {
            return base.Channel.updatePaymentAsync(p);
        }
        
        public DTO.PaymentLocationDTO[] getPaymentLocations() {
            return base.Channel.getPaymentLocations();
        }
        
        public System.Threading.Tasks.Task<DTO.PaymentLocationDTO[]> getPaymentLocationsAsync() {
            return base.Channel.getPaymentLocationsAsync();
        }
        
        public bool newCashPayment(DTO.CashPaymentDTO cp) {
            return base.Channel.newCashPayment(cp);
        }
        
        public System.Threading.Tasks.Task<bool> newCashPaymentAsync(DTO.CashPaymentDTO cp) {
            return base.Channel.newCashPaymentAsync(cp);
        }
    }
}
