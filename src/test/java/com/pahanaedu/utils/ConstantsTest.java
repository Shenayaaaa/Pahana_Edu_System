package com.pahanaedu.utils;

import org.junit.Test;
import static org.junit.Assert.*;

public class ConstantsTest {

    @Test
    public void testDatabaseConstants() {
        assertNotNull(constants.DB_URL);
        assertNotNull(constants.DB_USERNAME);
        assertNotNull(constants.DB_PASSWORD);
        assertNotNull(constants.DB_DRIVER);

        assertTrue(constants.DB_URL.contains("jdbc:sqlserver"));
        assertEquals("com.microsoft.sqlserver.jdbc.SQLServerDriver", constants.DB_DRIVER);
    }

    @Test
    public void testConnectionPoolConstants() {
        assertEquals(20, constants.MAX_POOL_SIZE);
        assertEquals(5, constants.MIN_POOL_SIZE);
        assertEquals(30000, constants.CONNECTION_TIMEOUT);
    }

    @Test
    public void testGoogleBooksAPIConstants() {
        assertNotNull(constants.GOOGLE_BOOKS_API_URL);
        assertNotNull(constants.GOOGLE_BOOKS_API_KEY);

        assertTrue(constants.GOOGLE_BOOKS_API_URL.contains("googleapis.com"));
    }

    @Test
    public void testApplicationConstants() {
        assertNotNull(constants.APP_NAME);
        assertNotNull(constants.APP_VERSION);

        assertEquals("Pahana Edu Billing System", constants.APP_NAME);
        assertEquals("1.0.0", constants.APP_VERSION);
    }

    @Test
    public void testSessionConstants() {
        assertEquals("user", constants.SESSION_USER);
        assertEquals("userRole", constants.SESSION_USER_ROLE);
        assertEquals(30, constants.SESSION_TIMEOUT);
    }

    @Test
    public void testUserRoleConstants() {
        assertEquals("ADMIN", constants.ROLE_ADMIN);
        assertEquals("USER", constants.ROLE_USER);
    }

    @Test
    public void testPrefixConstants() {
        assertEquals("PAH", constants.ACCOUNT_PREFIX);
        assertEquals("BILL", constants.BILL_PREFIX);
    }

    @Test
    public void testTaxRateConstant() {
        assertEquals(0.10, constants.DEFAULT_TAX_RATE, 0.001);
    }

    @Test
    public void testPaginationConstants() {
        assertEquals(10, constants.DEFAULT_PAGE_SIZE);
    }

    @Test
    public void testConstantsClassCannotBeInstantiated() {
        try {
            constants.class.getDeclaredConstructor().newInstance();
            fail("Expected IllegalAccessException or similar");
        } catch (Exception e) {
            // Expected - utility class constructor should be private
            assertTrue(e instanceof IllegalAccessException ||
                    e.getCause() instanceof IllegalAccessException);
        }
    }
}