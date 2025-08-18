package com.pahanaedu.patterns.factory;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.dao.impl.CustomerDAOImpl;
import org.junit.Test;
import static org.junit.Assert.*;

public class DAOProductTest {

    @Test
    public void testDAOProductInterface() {
        CustomerDAO customerDAO = new CustomerDAOImpl();

        DAOProduct<CustomerDAO> daoProduct = new DAOProduct<CustomerDAO>() {
            @Override
            public CustomerDAO getDAO() {
                return customerDAO;
            }
        };

        assertEquals(customerDAO, daoProduct.getDAO());
        assertNotNull(daoProduct.getDAO());
    }
}