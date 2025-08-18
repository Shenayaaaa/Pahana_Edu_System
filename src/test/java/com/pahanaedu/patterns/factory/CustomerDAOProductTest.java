package com.pahanaedu.patterns.factory;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.dao.impl.CustomerDAOImpl;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class CustomerDAOProductTest {

    private CustomerDAO customerDAO;
    private CustomerDAOProduct customerDAOProduct;

    @Before
    public void setUp() {
        customerDAO = new CustomerDAOImpl();
        customerDAOProduct = new CustomerDAOProduct(customerDAO);
    }

    @Test
    public void testGetDAO() {
        assertEquals(customerDAO, customerDAOProduct.getDAO());
        assertNotNull(customerDAOProduct.getDAO());
    }

    @Test
    public void testConstructorWithNullDAO() {
        CustomerDAOProduct nullProduct = new CustomerDAOProduct(null);
        assertNull(nullProduct.getDAO());
    }

    @Test
    public void testDAOProductInterfaceImplementation() {
        assertTrue(customerDAOProduct instanceof DAOProduct);
    }
}