package com.pahanaedu.utils;

import org.junit.Test;
import static org.junit.Assert.*;

public class PasswordUtilsTest {

    @Test
    public void testHashPassword() {
        String plainPassword = "testPassword123";
        String hashedPassword = PasswordUtils.hashPassword(plainPassword);

        assertNotNull(hashedPassword);
        assertNotEquals(plainPassword, hashedPassword);
        assertTrue(hashedPassword.startsWith("$2a$12$")); // BCrypt format
        assertEquals(60, hashedPassword.length()); // BCrypt hash length
    }

    @Test
    public void testHashPasswordGeneratesDifferentHashes() {
        String plainPassword = "testPassword123";
        String hash1 = PasswordUtils.hashPassword(plainPassword);
        String hash2 = PasswordUtils.hashPassword(plainPassword);

        assertNotNull(hash1);
        assertNotNull(hash2);
        assertNotEquals(hash1, hash2); // Should be different due to salt
    }

    @Test
    public void testVerifyCorrectPassword() {
        String plainPassword = "correctPassword456";
        String hashedPassword = PasswordUtils.hashPassword(plainPassword);

        assertTrue(PasswordUtils.verifyPassword(plainPassword, hashedPassword));
    }

    @Test
    public void testVerifyIncorrectPassword() {
        String plainPassword = "correctPassword456";
        String wrongPassword = "wrongPassword789";
        String hashedPassword = PasswordUtils.hashPassword(plainPassword);

        assertFalse(PasswordUtils.verifyPassword(wrongPassword, hashedPassword));
    }

    @Test
    public void testVerifyPasswordWithNullPlainPassword() {
        String hashedPassword = PasswordUtils.hashPassword("testPassword");

        assertFalse(PasswordUtils.verifyPassword(null, hashedPassword));
    }

    @Test
    public void testVerifyPasswordWithNullHashedPassword() {
        assertFalse(PasswordUtils.verifyPassword("testPassword", null));
    }

    @Test
    public void testVerifyPasswordWithEmptyPassword() {
        String hashedPassword = PasswordUtils.hashPassword("testPassword");

        assertFalse(PasswordUtils.verifyPassword("", hashedPassword));
    }

    @Test
    public void testVerifyPasswordWithMalformedHash() {
        assertFalse(PasswordUtils.verifyPassword("testPassword", "invalidhash"));
        assertFalse(PasswordUtils.verifyPassword("testPassword", ""));
    }

    @Test
    public void testHashPasswordWithEmptyString() {
        String hashedPassword = PasswordUtils.hashPassword("");

        assertNotNull(hashedPassword);
        assertTrue(hashedPassword.startsWith("$2a$12$"));
        assertTrue(PasswordUtils.verifyPassword("", hashedPassword));
    }

    @Test
    public void testHashPasswordWithSpecialCharacters() {
        String complexPassword = "Test@123#$%^&*()_+";
        String hashedPassword = PasswordUtils.hashPassword(complexPassword);

        assertNotNull(hashedPassword);
        assertTrue(PasswordUtils.verifyPassword(complexPassword, hashedPassword));
    }

    @Test
    public void testHashPasswordWithLongPassword() {
        String longPassword = "a".repeat(100); // 100 character password
        String hashedPassword = PasswordUtils.hashPassword(longPassword);

        assertNotNull(hashedPassword);
        assertTrue(PasswordUtils.verifyPassword(longPassword, hashedPassword));
    }
}