package com.pahanaedu.patterns.factory;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.entities.Customer;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class CustomerFactoryTest {

    private CustomerFactory customerFactory;
    private DAOCreator<CustomerDAO> daoCreator;

    @Before
    public void setUp() {
        daoCreator = new MySQLDAOCreator<>();
        customerFactory = new CustomerFactory(daoCreator);
    }

    @Test
    public void testCreateSampleCustomer() {
        Customer customer = customerFactory.createSampleCustomer("John Doe", "123-456-7890", "john@example.com");

        assertNotNull(customer);
        assertEquals("John Doe", customer.getName());
        assertEquals("123-456-7890", customer.getPhoneNumber());
        assertEquals("john@example.com", customer.getEmail());
        assertEquals("Sample Address", customer.getAddress());
        assertTrue(customer.isActive());
        assertNotNull(customer.getAccountNumber());
    }

    @Test
    public void testCreateCustomerFromRequestWithAccountNumber() {
        Customer customer = customerFactory.createCustomerFromRequest("ACC123", "Jane Doe",
                "123 Main St", "987-654-3210", "jane@example.com");

        assertNotNull(customer);
        assertEquals("Jane Doe", customer.getName());
        assertEquals("123 Main St", customer.getAddress());
        assertEquals("987-654-3210", customer.getPhoneNumber());
        assertEquals("jane@example.com", customer.getEmail());
        assertTrue(customer.isActive());
    }

    @Test
    public void testCreateCustomerFromRequestWithNullAccountNumber() {
        Customer customer = customerFactory.createCustomerFromRequest(null, "Bob Smith",
                "456 Oak Ave", "555-123-4567", "bob@example.com");

        assertNotNull(customer);
        assertEquals("Bob Smith", customer.getName());
        assertEquals("456 Oak Ave", customer.getAddress());
        assertEquals("555-123-4567", customer.getPhoneNumber());
        assertEquals("bob@example.com", customer.getEmail());
        assertTrue(customer.isActive());
    }

    @Test
    public void testCreateCustomerFromRequestWithEmptyAccountNumber() {
        Customer customer = customerFactory.createCustomerFromRequest("", "Alice Johnson",
                "789 Pine St", "444-555-6666", "alice@example.com");

        assertNotNull(customer);
        assertEquals("Alice Johnson", customer.getName());
        assertEquals("789 Pine St", customer.getAddress());
        assertEquals("444-555-6666", customer.getPhoneNumber());
        assertEquals("alice@example.com", customer.getEmail());
        assertTrue(customer.isActive());
    }

    @Test
    public void testCreatePremiumCustomer() {
        Customer customer = customerFactory.createPremiumCustomer("Premium User",
                "111-222-3333", "premium@example.com", "Premium Address");

        assertNotNull(customer);
        assertEquals("Premium User", customer.getName());
        assertEquals("111-222-3333", customer.getPhoneNumber());
        assertEquals("premium@example.com", customer.getEmail());
        assertEquals("Premium Address", customer.getAddress());
        assertTrue(customer.isActive());
        assertTrue(customer.getAccountNumber().startsWith("PREM"));
    }

    @Test
    public void testFactoryWithDifferentDAOCreator() {
        DAOCreator<CustomerDAO> customCreator = new DAOCreator<CustomerDAO>() {
            @Override
            public DAOProduct<CustomerDAO> createDAO(String type) {
                return new MySQLDAOCreator<CustomerDAO>().createDAO(type);
            }
        };

        CustomerFactory customFactory = new CustomerFactory(customCreator);
        Customer customer = customFactory.createSampleCustomer("Test User", "000-000-0000", "test@test.com");

        assertNotNull(customer);
        assertEquals("Test User", customer.getName());
    }
}