package com.Group11.TugasBesar.services.payment;

import java.util.NoSuchElementException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.payloads.requests.PaymentRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.PaymentRepository;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public Response addPayment(PaymentRequest paymentRequest) {

        Payment payment = new Payment();
        payment.setDateIssued(paymentRequest.getDateIssued());
        payment.setMethod(paymentRequest.getMethod());
        payment.setAmount(paymentRequest.getAmount());
        payment.setStatus(paymentRequest.getStatus());
        payment.setPencariKost(paymentRequest.getPencariKost());
        payment.setPemilikKost(paymentRequest.getPemilikKost());
        payment.setAdmin(paymentRequest.getAdmin());

        payment = paymentRepository.save(payment);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Payment created successfully!");
        response.setData(payment);

        return response;
        
    }

    @Override
    public Response updatePaymentById(int payment_id, PaymentRequest paymentRequest) {

        Payment payment = paymentRepository.findById(payment_id).orElseThrow(() -> {
            throw new NoSuchElementException("Payment is not found!");
        });

        payment.setDateIssued(paymentRequest.getDateIssued());
        payment.setMethod(paymentRequest.getMethod());
        payment.setAmount(paymentRequest.getAmount());
        payment.setStatus(paymentRequest.getStatus());
        payment.setPencariKost(paymentRequest.getPencariKost());
        payment.setPemilikKost(paymentRequest.getPemilikKost());
        payment.setAdmin(paymentRequest.getAdmin());

        payment = paymentRepository.save(payment);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Payment successfully updated!");
        response.setData(payment);
        
        return response;
    }

    @Override
    public Response setPaymentStatus(int payment_id, String status) {
        
        Payment payment = paymentRepository.findById(payment_id).orElseThrow(() -> {
            throw new NoSuchElementException("Payment is not found!");
        });

        payment.setStatus(status);
        payment = paymentRepository.save(payment);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Payment successfully updated!");
        response.setData(payment);
        
        return response;
    }

    @Override
    public Response setPaymentMethod(int payment_id, String method) {

        Payment payment = paymentRepository.findById(payment_id).orElseThrow(() -> {
            throw new NoSuchElementException("Payment is not found!");
        });

        payment.setMethod(method);
        payment = paymentRepository.save(payment);

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Payment successfully updated!");
        response.setData(payment);
        
        return response;
    }

    @Override
    public Response getPayments() {
        
        List<Payment> payments = paymentRepository.findAll();

        Response response = new Response();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Payment successfully updated!");
        response.setData(payments);

        return response;
    }
}
