package com.Group11.TugasBesar.services.payment;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.Group11.TugasBesar.models.Payment;
import com.Group11.TugasBesar.models.PemilikKost;
import com.Group11.TugasBesar.payloads.requests.PaymentRequest;
import com.Group11.TugasBesar.payloads.responses.Response;
import com.Group11.TugasBesar.repositories.PaymentRepository;
import com.Group11.TugasBesar.repositories.PemilikKostRepository;

@Service
public class PaymentServiceImpl implements PaymentService{

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
	private PemilikKostRepository pemilikKostRepository;

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

    
    @Override
    public Response transferToPemilikKost(Payment payment) {
        PemilikKost pemilikKost = payment.getPemilikKost();
    
        if (pemilikKost == null) {
            System.out.println("Pemilik Kost tidak ditemukan pada Payment ID: " + payment.getPayment_id());
            return new Response(HttpStatus.NOT_FOUND.value(), "Pemilik Kost tidak ditemukan!", null);
        }
        
    
        // Ambil saldo saat ini
        Long currentBalance = pemilikKost.getBalance() != null ? pemilikKost.getBalance() : 0L;
    
        // Update saldo dengan jumlah pembayaran
        System.out.println("Saldo sebelum: Rp" + currentBalance);
	    pemilikKost.setBalance(currentBalance + payment.getAmount());
	    System.out.println("Saldo sesudah: Rp" + pemilikKost.getBalance());
        pemilikKostRepository.save(pemilikKost); // Simpan ke database
    
        System.out.println("Saldo berhasil diupdate untuk Pemilik Kost ID: " + pemilikKost.getPemilikKost_id());
        return new Response(HttpStatus.OK.value(), "Saldo berhasil ditransfer!", pemilikKost);
    }

    @Override
    public long getBalanceByPemilikKostId(int pemilikKostId) {
        return pemilikKostRepository.findBalanceByPemilikKostId(pemilikKostId);
    }
    
}
