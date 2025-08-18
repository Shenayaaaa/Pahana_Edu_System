package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillTest {

    private Bill bill;

    @Before
    public void setUp() {
        bill = new Bill();
    }

    @Test
    public void testDefaultConstructor() {
        Bill newBill = new Bill();

        assertNotNull(newBill);
        assertNotNull(newBill.getBillItems());
        assertEquals(0, newBill.getBillItems().size());
        assertEquals(BigDecimal.ZERO, newBill.getDiscountAmount());
        assertEquals("CASH", newBill.getPaymentMethod());
        assertEquals("PAID", newBill.getPaymentStatus());
        assertNotNull(newBill.getBillDate());
        assertNotNull(newBill.getCreatedDate());
    }

    @Test
    public void testSettersAndGetters() {
        String billId = "BILL001";
        String customerAccountNumber = "CUST001";
        Integer userId = 1;
        LocalDateTime billDate = LocalDateTime.now();
        BigDecimal subtotal = new BigDecimal("100.00");
        BigDecimal taxAmount = new BigDecimal("10.00");
        BigDecimal discountAmount = new BigDecimal("5.00");
        BigDecimal totalAmount = new BigDecimal("105.00");
        String paymentMethod = "CREDIT_CARD";
        String paymentStatus = "PENDING";
        String notes = "Test bill";
        LocalDateTime createdDate = LocalDateTime.now();
        String customerName = "John Doe";
        String userName = "Staff User";

        bill.setBillId(billId);
        bill.setCustomerAccountNumber(customerAccountNumber);
        bill.setUserId(userId);
        bill.setBillDate(billDate);
        bill.setSubtotal(subtotal);
        bill.setTaxAmount(taxAmount);
        bill.setDiscountAmount(discountAmount);
        bill.setTotalAmount(totalAmount);
        bill.setPaymentMethod(paymentMethod);
        bill.setPaymentStatus(paymentStatus);
        bill.setNotes(notes);
        bill.setCreatedDate(createdDate);
        bill.setCustomerName(customerName);
        bill.setUserName(userName);

        assertEquals(billId, bill.getBillId());
        assertEquals(customerAccountNumber, bill.getCustomerAccountNumber());
        assertEquals(userId, bill.getUserId());
        assertEquals(billDate, bill.getBillDate());
        assertEquals(subtotal, bill.getSubtotal());
        assertEquals(taxAmount, bill.getTaxAmount());
        assertEquals(discountAmount, bill.getDiscountAmount());
        assertEquals(totalAmount, bill.getTotalAmount());
        assertEquals(paymentMethod, bill.getPaymentMethod());
        assertEquals(paymentStatus, bill.getPaymentStatus());
        assertEquals(notes, bill.getNotes());
        assertEquals(createdDate, bill.getCreatedDate());
        assertEquals(customerName, bill.getCustomerName());
        assertEquals(userName, bill.getUserName());
    }

    @Test
    public void testBillItems() {
        List<BillItem> billItems = new ArrayList<>();
        BillItem item1 = new BillItem();
        item1.setBookTitle("Book 1");
        BillItem item2 = new BillItem();
        item2.setBookTitle("Book 2");

        billItems.add(item1);
        billItems.add(item2);

        bill.setBillItems(billItems);

        assertEquals(2, bill.getBillItems().size());
        assertEquals("Book 1", bill.getBillItems().get(0).getBookTitle());
        assertEquals("Book 2", bill.getBillItems().get(1).getBookTitle());
    }

    @Test
    public void testGetBillDateAsDate() {
        LocalDateTime testDate = LocalDateTime.now();
        bill.setBillDate(testDate);

        Date dateResult = bill.getBillDateAsDate();
        assertNotNull(dateResult);
    }

    @Test
    public void testGetBillDateAsDateWithNull() {
        bill.setBillDate(null);

        Date dateResult = bill.getBillDateAsDate();
        assertNull(dateResult);
    }

    @Test
    public void testToString() {
        bill.setBillId("BILL123");
        bill.setCustomerAccountNumber("CUST456");
        bill.setTotalAmount(new BigDecimal("150.00"));
        bill.setPaymentStatus("COMPLETED");

        String result = bill.toString();

        assertTrue(result.contains("BILL123"));
        assertTrue(result.contains("CUST456"));
        assertTrue(result.contains("150.00"));
        assertTrue(result.contains("COMPLETED"));
    }
}