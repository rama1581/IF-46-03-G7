package com.Group11.TugasBesar.services.payment;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.payloads.requests.PaymentRequest;
import com.Group11.TugasBesar.payloads.responses.Response;

public interface PaymentService {

    Response addPayment(PaymentRequest paymentRequest);

    Response updatePaymentById(int payment_id, PaymentRequest paymentRequest);

    Response setPaymentStatus(int payment_id, String status);

    Response setPaymentMethod(int payment_id, String method);

    Response getPayments();

    long getBalanceByPemilikKostId(int pemilikKostId);
    
    Response transferToPemilikKost(Payment payment);
}
