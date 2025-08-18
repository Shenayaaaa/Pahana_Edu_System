package com.pahanaedu.patterns.factory;

import org.junit.Test;
import static org.junit.Assert.*;

public class DAOCreatorTest {

    @Test
    public void testDAOCreatorIsAbstract() {
        DAOCreator<String> testCreator = new DAOCreator<String>() {
            @Override
            public DAOProduct<String> createDAO(String type) {
                return new DAOProduct<String>() {
                    @Override
                    public String getDAO() {
                        return "Test DAO for type: " + type;
                    }
                };
            }
        };

        DAOProduct<String> product = testCreator.createDAO("test");
        assertNotNull(product);
        assertEquals("Test DAO for type: test", product.getDAO());
    }

    @Test
    public void testConcreteImplementation() {
        DAOCreator<Integer> numberCreator = new DAOCreator<Integer>() {
            @Override
            public DAOProduct<Integer> createDAO(String type) {
                return () -> type.length();
            }
        };

        DAOProduct<Integer> product = numberCreator.createDAO("customer");
        assertEquals(Integer.valueOf(8), product.getDAO());
    }
}