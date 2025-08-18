package com.pahanaedu.mapper;

import com.pahanaedu.dto.StaffDTO;
import com.pahanaedu.entities.Staff;
import org.junit.Test;
import java.time.LocalDateTime;
import static org.junit.Assert.*;

public class StaffMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        Staff entity = new Staff();
        entity.setId(1);
        entity.setUsername("admin");
        entity.setPasswordHash("hashedpassword");
        entity.setFullName("Administrator");
        entity.setEmail("admin@pahanaedu.com");
        entity.setActive(true);
        entity.setCreatedDate(LocalDateTime.of(2024, 1, 15, 10, 30));
        entity.setLastLogin(LocalDateTime.of(2024, 1, 16, 9, 0));

        // Act
        StaffDTO dto = StaffMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals(Integer.valueOf(1), dto.getId());
        assertEquals("admin", dto.getUsername());
        assertNull(dto.getPassword()); // Password should not be mapped to DTO
        assertEquals("Administrator", dto.getFullName());
        assertEquals("admin@pahanaedu.com", dto.getEmail());
        assertTrue(dto.isActive());
        assertEquals(LocalDateTime.of(2024, 1, 15, 10, 30), dto.getCreatedDate());
        assertEquals(LocalDateTime.of(2024, 1, 16, 9, 0), dto.getLastLogin());
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        StaffDTO dto = StaffMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        StaffDTO dto = new StaffDTO();
        dto.setId(1);
        dto.setUsername("admin");
        dto.setPassword("newpassword");
        dto.setFullName("Administrator");
        dto.setEmail("admin@pahanaedu.com");
        dto.setActive(true);
        dto.setCreatedDate(LocalDateTime.of(2024, 1, 15, 10, 30));
        dto.setLastLogin(LocalDateTime.of(2024, 1, 16, 9, 0));

        // Act
        Staff entity = StaffMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals(Integer.valueOf(1), entity.getId());
        assertEquals("admin", entity.getUsername());
        assertEquals("newpassword", entity.getPasswordHash());
        assertEquals("Administrator", entity.getFullName());
        assertEquals("admin@pahanaedu.com", entity.getEmail());
        assertTrue(entity.isActive());
        assertEquals(LocalDateTime.of(2024, 1, 15, 10, 30), entity.getCreatedDate());
        assertEquals(LocalDateTime.of(2024, 1, 16, 9, 0), entity.getLastLogin());
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        Staff entity = StaffMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }

    @Test
    public void testToEntityWithNullPassword() {
        // Arrange
        StaffDTO dto = new StaffDTO();
        dto.setId(1);
        dto.setUsername("admin");
        dto.setPassword(null); // Null password
        dto.setFullName("Administrator");

        // Act
        Staff entity = StaffMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertNull(entity.getPasswordHash()); // Should not set password hash
    }
}