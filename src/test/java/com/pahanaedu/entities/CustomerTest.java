package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.time.LocalDateTime;
import java.util.Date;

public class CustomerTest {

    private Customer customer;

    @Before
    public void setUp() {
        customer = new Customer();
    }

    @Test
    public void testDefaultConstructor() {
        Customer newCustomer = new Customer();

        assertNotNull(newCustomer);
        assertTrue(newCustomer.isActive());
        assertNotNull(newCustomer.getCreatedDate());
        assertNotNull(newCustomer.getUpdatedDate());
        assertNull(newCustomer.getAccountNumber());
        assertNull(newCustomer.getName());
        assertNull(newCustomer.getAddress());
        assertNull(newCustomer.getPhoneNumber());
        assertNull(newCustomer.getEmail());
    }

    @Test
    public void testSettersAndGetters() {
        String accountNumber = "CUST001";
        String name = "John Doe";
        String address = "123 Main St, City, State";
        String phoneNumber = "1234567890";
        String email = "john.doe@example.com";
        LocalDateTime createdDate = LocalDateTime.now();
        LocalDateTime updatedDate = LocalDateTime.now();

        customer.setAccountNumber(accountNumber);
        customer.setName(name);
        customer.setAddress(address);
        customer.setPhoneNumber(phoneNumber);
        customer.setEmail(email);
        customer.setActive(false);
        customer.setCreatedDate(createdDate);
        customer.setUpdatedDate(updatedDate);

        assertEquals(accountNumber, customer.getAccountNumber());
        assertEquals(name, customer.getName());
        assertEquals(address, customer.getAddress());
        assertEquals(phoneNumber, customer.getPhoneNumber());
        assertEquals(email, customer.getEmail());
        assertFalse(customer.isActive());
        assertEquals(createdDate, customer.getCreatedDate());
        assertEquals(updatedDate, customer.getUpdatedDate());
    }

    @Test
    public void testActiveStatus() {
        assertTrue(customer.isActive());

        customer.setActive(false);
        assertFalse(customer.isActive());

        customer.setActive(true);
        assertTrue(customer.isActive());
    }

    @Test
    public void testDateConversions() {
        LocalDateTime testDate = LocalDateTime.now();
        customer.setCreatedDate(testDate);
        customer.setUpdatedDate(testDate);

        Date createdDateAsDate = customer.getCreatedDateAsDate();
        Date updatedDateAsDate = customer.getUpdatedDateAsDate();

        assertNotNull(createdDateAsDate);
        assertNotNull(updatedDateAsDate);
    }

    @Test
    public void testDateConversionsWithNullDates() {
        customer.setCreatedDate(null);
        customer.setUpdatedDate(null);

        Date createdDateAsDate = customer.getCreatedDateAsDate();
        Date updatedDateAsDate = customer.getUpdatedDateAsDate();

        assertNull(createdDateAsDate);
        assertNull(updatedDateAsDate);
    }
}