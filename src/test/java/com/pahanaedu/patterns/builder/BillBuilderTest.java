package com.pahanaedu.patterns.builder;

import com.pahanaedu.entities.Bill;
import com.pahanaedu.entities.BillItem;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

public class BillBuilderTest {

    private BillBuilder billBuilder;

    @Before
    public void setUp() {
        billBuilder = new BillBuilder();
    }

    @Test
    public void testBasicBillBuilding() {
        LocalDateTime billDate = LocalDateTime.now();

        Bill bill = billBuilder
                .billId("BILL001")
                .customerAccountNumber("ACC001")
                .userId(1)
                .billDate(billDate)
                .subtotal(new BigDecimal("100.00"))
                .taxAmount(new BigDecimal("10.00"))
                .totalAmount(new BigDecimal("110.00"))
                .paymentMethod("CASH")
                .paymentStatus("PAID")
                .build();

        assertEquals("BILL001", bill.getBillId());
        assertEquals("ACC001", bill.getCustomerAccountNumber());
        assertEquals(Integer.valueOf(1), bill.getUserId());
        assertEquals(billDate, bill.getBillDate());
        assertEquals(new BigDecimal("100.00"), bill.getSubtotal());
        assertEquals(new BigDecimal("10.00"), bill.getTaxAmount());
        assertEquals(new BigDecimal("110.00"), bill.getTotalAmount());
        assertEquals("CASH", bill.getPaymentMethod());
        assertEquals("PAID", bill.getPaymentStatus());
    }

    @Test
    public void testBillBuildingWithAllFields() {
        LocalDateTime billDate = LocalDateTime.now();
        LocalDateTime createdDate = LocalDateTime.now().minusHours(1);

        Bill bill = billBuilder
                .billId("BILL002")
                .customerAccountNumber("ACC002")
                .userId(2)
                .billDate(billDate)
                .subtotal(new BigDecimal("200.00"))
                .taxAmount(new BigDecimal("20.00"))
                .discountAmount(new BigDecimal("5.00"))
                .totalAmount(new BigDecimal("215.00"))
                .paymentMethod("CREDIT_CARD")
                .paymentStatus("PENDING")
                .notes("Special order")
                .createdDate(createdDate)
                .customerName("John Doe")
                .userName("Admin User")
                .build();

        assertEquals("BILL002", bill.getBillId());
        assertEquals("ACC002", bill.getCustomerAccountNumber());
        assertEquals(Integer.valueOf(2), bill.getUserId());
        assertEquals(billDate, bill.getBillDate());
        assertEquals(new BigDecimal("200.00"), bill.getSubtotal());
        assertEquals(new BigDecimal("20.00"), bill.getTaxAmount());
        assertEquals(new BigDecimal("5.00"), bill.getDiscountAmount());
        assertEquals(new BigDecimal("215.00"), bill.getTotalAmount());
        assertEquals("CREDIT_CARD", bill.getPaymentMethod());
        assertEquals("PENDING", bill.getPaymentStatus());
        assertEquals("Special order", bill.getNotes());
        assertEquals(createdDate, bill.getCreatedDate());
        assertEquals("John Doe", bill.getCustomerName());
        assertEquals("Admin User", bill.getUserName());
    }

    @Test
    public void testBillBuildingWithItems() {
        BillItem item1 = new BillItem();
        item1.setQuantity(2);
        item1.setUnitPrice(new BigDecimal("50.00"));

        BillItem item2 = new BillItem();
        item2.setQuantity(1);
        item2.setUnitPrice(new BigDecimal("30.00"));

        List<BillItem> items = Arrays.asList(item1, item2);

        Bill bill = billBuilder
                .billId("BILL003")
                .billItems(items)
                .build();

        assertEquals("BILL003", bill.getBillId());
        assertEquals(2, bill.getBillItems().size());
        assertEquals(Integer.valueOf(2), bill.getBillItems().get(0).getQuantity());
        assertEquals(new BigDecimal("50.00"), bill.getBillItems().get(0).getUnitPrice());
        assertEquals(Integer.valueOf(1), bill.getBillItems().get(1).getQuantity());
        assertEquals(new BigDecimal("30.00"), bill.getBillItems().get(1).getUnitPrice());
    }

    @Test
    public void testBigDecimalFields() {
        BigDecimal subtotal = new BigDecimal("999.99");
        BigDecimal tax = new BigDecimal("99.99");
        BigDecimal discount = new BigDecimal("50.00");
        BigDecimal total = new BigDecimal("1049.98");

        Bill bill = billBuilder
                .subtotal(subtotal)
                .taxAmount(tax)
                .discountAmount(discount)
                .totalAmount(total)
                .build();

        assertEquals(subtotal, bill.getSubtotal());
        assertEquals(tax, bill.getTaxAmount());
        assertEquals(discount, bill.getDiscountAmount());
        assertEquals(total, bill.getTotalAmount());
    }

    @Test
    public void testBuilderReturnsThis() {
        BillBuilder result = billBuilder.billId("TEST");
        assertSame(billBuilder, result);
    }

    @Test
    public void testEmptyBillCreation() {
        Bill bill = billBuilder.build();

        assertNull(bill.getBillId());
        assertNull(bill.getCustomerAccountNumber());
        assertNull(bill.getUserId());
        assertNotNull(bill.getBillDate());
        assertNull(bill.getSubtotal());
        assertNull(bill.getTaxAmount());
        assertEquals(BigDecimal.ZERO, bill.getDiscountAmount());
        assertNull(bill.getTotalAmount());
        assertEquals("CASH", bill.getPaymentMethod());
        assertEquals("PAID", bill.getPaymentStatus());
        assertNull(bill.getNotes());
        assertNotNull(bill.getCreatedDate());
        assertNull(bill.getCustomerName());
        assertNull(bill.getUserName());
        assertNotNull(bill.getBillItems());
    }

    @Test
    public void testMultipleBillsFromSameBuilder() {
        Bill bill1 = billBuilder.billId("BILL001").build();
        Bill bill2 = new BillBuilder().billId("BILL002").build();

        assertEquals("BILL001", bill1.getBillId());
        assertEquals("BILL002", bill2.getBillId());
    }

    @Test
    public void testNullValues() {
        Bill bill = billBuilder
                .billId(null)
                .customerName(null)
                .paymentMethod(null)
                .build();

        assertNull(bill.getBillId());
        assertNull(bill.getCustomerName());
        assertNull(bill.getPaymentMethod());
    }
}