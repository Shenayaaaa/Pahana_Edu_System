package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.time.LocalDateTime;

public class UserTest {

    private User user;

    @Before
    public void setUp() {
        user = new User();
    }

    @Test
    public void testDefaultConstructor() {
        User newUser = new User();

        assertNotNull(newUser);
        assertNull(newUser.getId());
        assertNull(newUser.getUsername());
        assertNull(newUser.getPasswordHash());
        assertNull(newUser.getFullName());
        assertNull(newUser.getEmail());
        assertNull(newUser.getRole());
        assertFalse(newUser.isActive());
        assertNull(newUser.getCreatedDate());
        assertNull(newUser.getLastLogin());
    }

    @Test
    public void testParameterizedConstructor() {
        String username = "johndoe";
        String passwordHash = "hashedPassword123";
        String fullName = "John Doe";
        String email = "john@example.com";
        String role = "ADMIN";

        User testUser = new User(username, passwordHash, fullName, email, role);

        assertEquals(username, testUser.getUsername());
        assertEquals(passwordHash, testUser.getPasswordHash());
        assertEquals(fullName, testUser.getFullName());
        assertEquals(email, testUser.getEmail());
        assertEquals(role, testUser.getRole());
        assertTrue(testUser.isActive());
        assertNotNull(testUser.getCreatedDate());
        assertNull(testUser.getLastLogin());
    }

    @Test
    public void testSettersAndGetters() {
        Integer id = 1;
        String username = "testuser";
        String passwordHash = "hash123";
        String fullName = "Test User";
        String email = "test@example.com";
        String role = "USER";
        LocalDateTime createdDate = LocalDateTime.now();
        LocalDateTime lastLogin = LocalDateTime.now();

        user.setId(id);
        user.setUsername(username);
        user.setPasswordHash(passwordHash);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setRole(role);
        user.setActive(true);
        user.setCreatedDate(createdDate);
        user.setLastLogin(lastLogin);

        assertEquals(id, user.getId());
        assertEquals(username, user.getUsername());
        assertEquals(passwordHash, user.getPasswordHash());
        assertEquals(fullName, user.getFullName());
        assertEquals(email, user.getEmail());
        assertEquals(role, user.getRole());
        assertTrue(user.isActive());
        assertEquals(createdDate, user.getCreatedDate());
        assertEquals(lastLogin, user.getLastLogin());
    }

    @Test
    public void testActiveStatus() {
        user.setActive(true);
        assertTrue(user.isActive());

        user.setActive(false);
        assertFalse(user.isActive());
    }

    @Test
    public void testToString() {
        user.setId(1);
        user.setUsername("testuser");
        user.setFullName("Test User");
        user.setRole("ADMIN");

        String result = user.toString();

        assertTrue(result.contains("1"));
        assertTrue(result.contains("testuser"));
        assertTrue(result.contains("Test User"));
        assertTrue(result.contains("ADMIN"));
    }
}