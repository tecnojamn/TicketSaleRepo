﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="AppWeb.Views.Reservations" %>

<%@ Import Namespace="DTO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        li {
            display: inline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <script>
        $(document).ready(function () {

            var table = $("table");
            table.find("th").each(function (index, object) {
                if (index == 0) {
                    $(object).html("ID");
                }
                if (index == 1) {
                    $(object).html("Sector");
                }
                if (index == 2) {
                    $(object).html("Monto");
                }
                if (index == 3) {
                    $(object).html("Estado");
                }
            });
        })
        function cancelSubOrder(idSO) {
            $.ajax({
                type: "POST",
                url: "Reservations.aspx/cancelSubOrder",
                data: '{idSO: "' + idSO + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }

    </script>

    <asp:ListView ID="lvReservations" runat="server" GroupItemCount="1" ItemType="DTO.ReservationDTO" SelectMethod="lvReservations_GetData" OnDataBinding="lvReservations_DataBinding">
        <EmptyDataTemplate>Aun no has hecho ninguna reserva o pago!</EmptyDataTemplate>
        <ItemTemplate>
            <ul>
                <li><%#Eval("id")%></li>
                <li><%#((DateTime)Eval("date")).ToString("dd/MM/yyyy")%></li>
                <li><%# getTotalAmount((ICollection<SubOrderDTO>)Eval("SubOrder")) %></li>
                <li><%#((ICollection<SubOrderDTO>)Eval("SubOrder")).First().Ticket.TicketType.Event.name%></li>
                <li>
                    <asp:LinkButton CssClass="jsBtnShowSubOrders" ID="showSubOrders" Text="Ver Sub Ordenes" CommandArgument='<%# Container.DataItemIndex + ";" + Eval("id") %> ' OnCommand="showSubOrders_Command" runat="server"></asp:LinkButton>
                </li>
            </ul>
        </ItemTemplate>
    </asp:ListView>

    <asp:DataPager ID="lvDataPager" runat="server" PagedControlID="lvReservations" PageSize="2">
        <Fields>
            <asp:NumericPagerField ButtonType="Link" />
        </Fields>
    </asp:DataPager>

    <asp:ScriptManager ID="scm" runat="server" EnablePageMethods="true" />

</asp:Content>
