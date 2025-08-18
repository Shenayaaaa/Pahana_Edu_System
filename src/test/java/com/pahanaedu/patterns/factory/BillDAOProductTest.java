package com.pahanaedu.patterns.factory;

import com.pahanaedu.dao.BillDAO;
import com.pahanaedu.dao.impl.BillDAOImpl;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class BillDAOProductTest {

    private BillDAO billDAO;
    private BillDAOProduct billDAOProduct;

    @Before
    public void setUp() {
        billDAO = new BillDAOImpl();
        billDAOProduct = new BillDAOProduct(billDAO);
    }

    @Test
    public void testGetDAO() {
        assertEquals(billDAO, billDAOProduct.getDAO());
        assertNotNull(billDAOProduct.getDAO());
    }

    @Test
    public void testConstructorWithNullDAO() {
        BillDAOProduct nullProduct = new BillDAOProduct(null);
        assertNull(nullProduct.getDAO());
    }

    @Test
    public void testDAOProductInterfaceImplementation() {
        assertTrue(billDAOProduct instanceof DAOProduct);
    }
}