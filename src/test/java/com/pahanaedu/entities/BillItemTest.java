package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.math.BigDecimal;

public class BillItemTest {

    private BillItem billItem;

    @Before
    public void setUp() {
        billItem = new BillItem();
    }

    @Test
    public void testDefaultConstructor() {
        BillItem newBillItem = new BillItem();

        assertNotNull(newBillItem);
        assertEquals(BigDecimal.ZERO, newBillItem.getDiscountAmount());
        assertNull(newBillItem.getId());
        assertNull(newBillItem.getBillId());
        assertNull(newBillItem.getIsbn());
        assertNull(newBillItem.getBookTitle());
        assertNull(newBillItem.getQuantity());
        assertNull(newBillItem.getUnitPrice());
        assertNull(newBillItem.getTotalPrice());
    }

    @Test
    public void testParameterizedConstructor() {
        String billId = "BILL001";
        String isbn = "978-0134685991";
        String bookTitle = "Effective Java";
        Integer quantity = 2;
        BigDecimal unitPrice = new BigDecimal("45.99");

        BillItem testBillItem = new BillItem(billId, isbn, bookTitle, quantity, unitPrice);

        assertEquals(billId, testBillItem.getBillId());
        assertEquals(isbn, testBillItem.getIsbn());
        assertEquals(bookTitle, testBillItem.getBookTitle());
        assertEquals(quantity, testBillItem.getQuantity());
        assertEquals(unitPrice, testBillItem.getUnitPrice());
        assertEquals(BigDecimal.ZERO, testBillItem.getDiscountAmount());

        // Total price should be quantity * unit price
        BigDecimal expectedTotal = unitPrice.multiply(BigDecimal.valueOf(quantity));
        assertEquals(expectedTotal, testBillItem.getTotalPrice());
    }

    @Test
    public void testSettersAndGetters() {
        Integer id = 1;
        String billId = "BILL002";
        String isbn = "978-0321356680";
        String bookTitle = "Clean Code";
        Integer quantity = 3;
        BigDecimal unitPrice = new BigDecimal("39.99");
        BigDecimal totalPrice = new BigDecimal("119.97");
        BigDecimal discountAmount = new BigDecimal("5.00");

        billItem.setId(id);
        billItem.setBillId(billId);
        billItem.setIsbn(isbn);
        billItem.setBookTitle(bookTitle);
        billItem.setQuantity(quantity);
        billItem.setUnitPrice(unitPrice);
        billItem.setTotalPrice(totalPrice);
        billItem.setDiscountAmount(discountAmount);

        assertEquals(id, billItem.getId());
        assertEquals(billId, billItem.getBillId());
        assertEquals(isbn, billItem.getIsbn());
        assertEquals(bookTitle, billItem.getBookTitle());
        assertEquals(quantity, billItem.getQuantity());
        assertEquals(unitPrice, billItem.getUnitPrice());
        assertEquals(totalPrice, billItem.getTotalPrice());
        assertEquals(discountAmount, billItem.getDiscountAmount());
    }

    @Test
    public void testTotalPriceCalculation() {
        BigDecimal unitPrice = new BigDecimal("25.50");
        Integer quantity = 4;

        BillItem testItem = new BillItem("BILL001", "123456789", "Test Book", quantity, unitPrice);

        BigDecimal expectedTotal = new BigDecimal("102.00");
        assertEquals(expectedTotal, testItem.getTotalPrice());
    }

    @Test
    public void testToString() {
        billItem.setIsbn("978-1234567890");
        billItem.setBookTitle("Test Book Title");
        billItem.setQuantity(2);
        billItem.setUnitPrice(new BigDecimal("29.99"));
        billItem.setTotalPrice(new BigDecimal("59.98"));

        String result = billItem.toString();

        assertTrue(result.contains("978-1234567890"));
        assertTrue(result.contains("Test Book Title"));
        assertTrue(result.contains("2"));
        assertTrue(result.contains("29.99"));
        assertTrue(result.contains("59.98"));
    }

    @Test
    public void testDiscountAmount() {
        billItem.setDiscountAmount(new BigDecimal("10.00"));
        assertEquals(new BigDecimal("10.00"), billItem.getDiscountAmount());

        // Test default discount amount
        BillItem newItem = new BillItem();
        assertEquals(BigDecimal.ZERO, newItem.getDiscountAmount());
    }
}