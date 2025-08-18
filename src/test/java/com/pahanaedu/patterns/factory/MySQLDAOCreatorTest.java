package com.pahanaedu.patterns.factory;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.dao.BillDAO;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class MySQLDAOCreatorTest {

    private MySQLDAOCreator<CustomerDAO> customerDAOCreator;
    private MySQLDAOCreator<BillDAO> billDAOCreator;

    @Before
    public void setUp() {
        customerDAOCreator = new MySQLDAOCreator<>();
        billDAOCreator = new MySQLDAOCreator<>();
    }

    @Test
    public void testCreateCustomerDAO() {
        DAOProduct<CustomerDAO> customerProduct = customerDAOCreator.createDAO("customer");

        assertNotNull(customerProduct);
        assertNotNull(customerProduct.getDAO());
        assertTrue(customerProduct instanceof CustomerDAOProduct);
        assertTrue(customerProduct.getDAO() instanceof CustomerDAO);
    }

    @Test
    public void testCreateBillDAO() {
        DAOProduct<BillDAO> billProduct = billDAOCreator.createDAO("bill");

        assertNotNull(billProduct);
        assertNotNull(billProduct.getDAO());
        assertTrue(billProduct instanceof BillDAOProduct);
        assertTrue(billProduct.getDAO() instanceof BillDAO);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testCreateDAOWithInvalidType() {
        customerDAOCreator.createDAO("invalid");
    }

    @Test(expected = IllegalArgumentException.class)
    public void testCreateDAOWithNullType() {
        customerDAOCreator.createDAO(null);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testCreateDAOWithEmptyType() {
        customerDAOCreator.createDAO("");
    }

    @Test
    public void testInheritance() {
        assertTrue(customerDAOCreator instanceof DAOCreator);
        assertTrue(billDAOCreator instanceof DAOCreator);
    }
}