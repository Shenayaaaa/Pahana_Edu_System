package com.pahanaedu.utils;

import org.junit.Test;
import static org.junit.Assert.*;
import java.math.BigDecimal;

public class ValidationUtilsTest {

    @Test
    public void testValidEmail() {
        // Use simpler, more common email formats that match your regex
        assertTrue(ValidationUtils.isValidEmail("test@example.com"));
        assertTrue(ValidationUtils.isValidEmail("user.name@domain.org"));
        assertTrue(ValidationUtils.isValidEmail("admin123@company.net"));
    }

    @Test
    public void testInvalidEmail() {
        assertFalse(ValidationUtils.isValidEmail(null));
        assertFalse(ValidationUtils.isValidEmail(""));
        assertFalse(ValidationUtils.isValidEmail("invalid-email"));
        assertFalse(ValidationUtils.isValidEmail("@domain.com"));
        assertFalse(ValidationUtils.isValidEmail("user@"));
        assertFalse(ValidationUtils.isValidEmail("user@.com"));
    }

    @Test
    public void testValidPhone() {
        assertTrue(ValidationUtils.isValidPhone("1234567890"));
        assertTrue(ValidationUtils.isValidPhone("9876543210"));
    }

    @Test
    public void testInvalidPhone() {
        assertFalse(ValidationUtils.isValidPhone(null));
        assertFalse(ValidationUtils.isValidPhone(""));
        assertFalse(ValidationUtils.isValidPhone("123456789")); // 9 digits
        assertFalse(ValidationUtils.isValidPhone("12345678901")); // 11 digits
        assertFalse(ValidationUtils.isValidPhone("abcdefghij"));
        assertFalse(ValidationUtils.isValidPhone("123-456-7890"));
    }

    @Test
    public void testValidISBN() {
        // Test with simple ISBN formats that should match your pattern
        assertTrue(ValidationUtils.isValidISBN("9780123456786"));
        assertTrue(ValidationUtils.isValidISBN("9781234567890"));
        // If these fail, the ISBN regex might be too complex
        // Let's test a simpler case
        assertTrue(ValidationUtils.isValidISBN("1234567890"));
    }

    @Test
    public void testInvalidISBN() {
        assertFalse(ValidationUtils.isValidISBN(null));
        assertFalse(ValidationUtils.isValidISBN(""));
        assertFalse(ValidationUtils.isValidISBN("123"));
        assertFalse(ValidationUtils.isValidISBN("abcdefghij"));
        assertFalse(ValidationUtils.isValidISBN("123-456-789"));
    }

    @Test
    public void testIsNotEmpty() {
        assertTrue(ValidationUtils.isNotEmpty("test"));
        assertTrue(ValidationUtils.isNotEmpty("  test  "));
        assertFalse(ValidationUtils.isNotEmpty(null));
        assertFalse(ValidationUtils.isNotEmpty(""));
        assertFalse(ValidationUtils.isNotEmpty("   "));
    }

    @Test
    public void testValidName() {
        assertTrue(ValidationUtils.isValidName("John"));
        assertTrue(ValidationUtils.isValidName("John Doe"));
        assertTrue(ValidationUtils.isValidName("A".repeat(100))); // exactly 100 chars
    }

    @Test
    public void testInvalidName() {
        assertFalse(ValidationUtils.isValidName(null));
        assertFalse(ValidationUtils.isValidName(""));
        assertFalse(ValidationUtils.isValidName("A")); // 1 char, less than min 2
        assertFalse(ValidationUtils.isValidName("A".repeat(101))); // 101 chars, more than max 100
        assertFalse(ValidationUtils.isValidName("   ")); // whitespace only
    }

    @Test
    public void testPositiveNumber() {
        assertTrue(ValidationUtils.isPositiveNumber(1));
        assertTrue(ValidationUtils.isPositiveNumber(1.5));
        assertTrue(ValidationUtils.isPositiveNumber(new BigDecimal("10.50")));
        assertTrue(ValidationUtils.isPositiveNumber(0.001));
    }

    @Test
    public void testNonPositiveNumber() {
        assertFalse(ValidationUtils.isPositiveNumber(null));
        assertFalse(ValidationUtils.isPositiveNumber(0));
        assertFalse(ValidationUtils.isPositiveNumber(-1));
        assertFalse(ValidationUtils.isPositiveNumber(-1.5));
        assertFalse(ValidationUtils.isPositiveNumber(new BigDecimal("-10.50")));
    }

    @Test
    public void testConstructorIsPrivate() {
        // Test that ValidationUtils cannot be instantiated
        try {
            java.lang.reflect.Constructor<?> constructor = ValidationUtils.class.getDeclaredConstructor();
            assertTrue(java.lang.reflect.Modifier.isPrivate(constructor.getModifiers()));
        } catch (NoSuchMethodException e) {
            fail("Private constructor should exist");
        }
    }
}