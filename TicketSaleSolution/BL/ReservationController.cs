﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BO;
using COM;

namespace BL
{
    public class ReservationController
    {


        //Nueva Reserva
        public bool newReservation(Reservation r)
        {
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    if (context.Reservation.Add(r) != null)
                    {
                        context.SaveChanges();
                    }
                    else { return false; }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }
        //Cancelacion automatica
        public bool autoCancelation()
        {
            using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
            {
                return false;
            }
        }
        // -- AL PEDO
        //Listar reservas de Usuario
        public List<Reservation> getReservationsByUser(int idUser, int page, int pageSize, bool onlyPayments = false)
        {
            List<Reservation> res = null;
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    if (!onlyPayments)
                    {
                        res = context.Reservation
                            .Include("SubOrder.Ticket.TicketType.Event")
                            .Include("Payment.PaypalPayment")
                            .Include("Payment.CashPayment")
                            .Select(r => r)
                            .OrderByDescending(r => r.date)
                            .Where(r => r.idUser == idUser)
                            .Skip((page - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();
                    }
                    else
                    {
                        res = context.Reservation
                            .Include("SubOrder.Ticket.TicketType.Event")
                            .Include("Payment.PaypalPayment")
                            .Include("Payment.CashPayment")
                            .Select(r => r)
                            .OrderByDescending(r => r.date)
                            .Where(r => r.idUser == idUser && r.Payment != null)
                            .Skip((page - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return res;
        }
        //Listar  reservas
        public List<Reservation> getReservations(int page = 1, int pageSize = 1)
        {
            List<Reservation> res = null;
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    res = context.Reservation.Select(r => r)
                        .OrderByDescending(r => r.date)
                        .Skip(page - 1)
                        .Take(pageSize)
                        .ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return res;
        }
        //Cancelar suborden
        public bool cancelSubOrder(int idSO)
        {

            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    SubOrder so = context.SubOrder.FirstOrDefault(s => s.id == idSO);
                    if (so != null)
                    {
                        so.active = Convert.ToByte(RESERVATION.SUBORDER.INACTIVE);
                        context.SaveChanges();
                    }
                    else { return false; }
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        //Cancelar todas las subordenes de una reserva
        public bool cancelAllSubOrders(int idRes)
        {

            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    List<SubOrder> subOrders = context.Reservation.Include("Payment").Where(r => r.id == idRes).FirstOrDefault().SubOrder.ToList();
                    if (subOrders != null)
                    {
                        foreach (var so in subOrders)
                        {
                            if (so.Reservation.Payment == null)
                            {
                                so.active = Convert.ToByte(RESERVATION.SUBORDER.INACTIVE);
                            }
                        }
                        context.SaveChanges();
                    }
                    else { return false; }
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        //obtener reserva (aplicación del vendedor)
        public Reservation getReservation(int idReserva)
        {
            Reservation res = null;
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    res = context.Reservation
                        .Include("SubOrder.Ticket.TicketType.Event.EventLocation")
                        .Include("User")
                        .Include("Payment")
                        .FirstOrDefault(r => r.id == idReserva);
                }

            }
            catch (Exception)
            {

                throw;
            }
            return res;

        }
        public int getReservationCountByUser(int idUser, bool onlyPayments = false)
        {
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    if (!onlyPayments)
                    {
                        return context.Reservation.Where(r => r.idUser == idUser).Count();
                    }
                    else
                    {
                        return context.Reservation.Where(r => r.idUser == idUser && r.Payment != null).Count();
                    }
                }

            }
            catch (Exception)
            {

                throw;
            }

        }
        public Ticket generateNewTicket(int idTicketType)
        {
            Ticket ticket = null;
            int _randomCode;
            try
            {
                using (DAL.TicketSaleEntities context = new DAL.TicketSaleEntities())
                {
                    do
                    {
                        _randomCode = getRandomForTicket();
                    } while (context.TicketType.Where(tt => tt.id == idTicketType).First().Ticket.Any(t => t.number == _randomCode));

                    ticket = context.Ticket.Add(new Ticket()
                    {
                        idTicketType = idTicketType,
                        number = _randomCode,
                    });
                    context.SaveChanges();

                }

            }
            catch (Exception)
            {

                throw;
            }
            return ticket;
        }
        private int getRandomForTicket()
        {
            Random random = new Random();
            return int.Parse(new string(Enumerable.Repeat(RESERVATION.TICKET.CODE.CHARS, RESERVATION.TICKET.CODE.LENGTH).Select(s => s[random.Next(s.Length)]).ToArray()));
        }
    }
}
