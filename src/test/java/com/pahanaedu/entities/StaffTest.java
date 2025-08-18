package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;

public class StaffTest {

    private Staff staff;

    @Before
    public void setUp() {
        staff = new Staff();
    }

    @Test
    public void testDefaultConstructor() {
        Staff newStaff = new Staff();

        assertNotNull(newStaff);
        assertEquals("STAFF", newStaff.getRole());
        assertFalse(newStaff.isActive());
        assertNull(newStaff.getCreatedDate());
    }

    @Test
    public void testParameterizedConstructor() {
        String username = "staffuser";
        String passwordHash = "hashedPassword123";
        String fullName = "Staff User";
        String email = "staff@example.com";

        Staff testStaff = new Staff(username, passwordHash, fullName, email);

        assertEquals(username, testStaff.getUsername());
        assertEquals(passwordHash, testStaff.getPasswordHash());
        assertEquals(fullName, testStaff.getFullName());
        assertEquals(email, testStaff.getEmail());
        assertEquals("STAFF", testStaff.getRole());
        assertTrue(testStaff.isActive());
        assertNotNull(testStaff.getCreatedDate());
    }

    @Test
    public void testInheritsFromUser() {
        assertTrue(staff instanceof User);
    }

    @Test
    public void testRoleIsAlwaysStaff() {
        assertEquals("STAFF", staff.getRole());

        // Even if we try to change it, it should remain STAFF based on constructor
        Staff newStaff = new Staff("user", "pass", "name", "email");
        assertEquals("STAFF", newStaff.getRole());
    }

    @Test
    public void testStaffUserProperties() {
        staff.setUsername("staffmember");
        staff.setFullName("Staff Member");
        staff.setEmail("member@example.com");
        staff.setActive(true);

        assertEquals("staffmember", staff.getUsername());
        assertEquals("Staff Member", staff.getFullName());
        assertEquals("member@example.com", staff.getEmail());
        assertTrue(staff.isActive());
        assertEquals("STAFF", staff.getRole());
    }
}