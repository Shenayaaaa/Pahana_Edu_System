package com.pahanaedu.mapper;

import com.pahanaedu.dto.CategoryDTO;
import com.pahanaedu.entities.Category;
import org.junit.Test;
import java.time.LocalDateTime;
import static org.junit.Assert.*;

public class CategoryMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        Category entity = new Category();
        entity.setId(1);
        entity.setName("Programming");
        entity.setDescription("Programming books");
        entity.setActive(true);
        entity.setCreatedDate(LocalDateTime.of(2024, 1, 15, 10, 30));

        // Act
        CategoryDTO dto = CategoryMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals(Integer.valueOf(1), dto.getId());
        assertEquals("Programming", dto.getName());
        assertEquals("Programming books", dto.getDescription());
        assertTrue(dto.isActive());
        assertEquals(LocalDateTime.of(2024, 1, 15, 10, 30), dto.getCreatedDate());
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        CategoryDTO dto = CategoryMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        CategoryDTO dto = new CategoryDTO();
        dto.setId(1);
        dto.setName("Programming");
        dto.setDescription("Programming books");
        dto.setActive(true);
        dto.setCreatedDate(LocalDateTime.of(2024, 1, 15, 10, 30));

        // Act
        Category entity = CategoryMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals(Integer.valueOf(1), entity.getId());
        assertEquals("Programming", entity.getName());
        assertEquals("Programming books", entity.getDescription());
        assertTrue(entity.isActive());
        assertEquals(LocalDateTime.of(2024, 1, 15, 10, 30), entity.getCreatedDate());
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        Category entity = CategoryMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }
}