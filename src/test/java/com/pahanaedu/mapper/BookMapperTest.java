package com.pahanaedu.mapper;

import com.pahanaedu.dto.BookDTO;
import com.pahanaedu.entities.Book;
import org.junit.Test;
import java.math.BigDecimal;
import static org.junit.Assert.*;

public class BookMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        Book entity = new Book();
        entity.setIsbn("978-0134685991");
        entity.setTitle("Effective Java");
        entity.setAuthor("Joshua Bloch");
        entity.setDescription("Programming guide");
        entity.setQuantity(10);
        entity.setPrice(new BigDecimal("45.99"));
        entity.setActive(true);
        entity.setCategoryName("Programming");
        entity.setImageUrl("http://example.com/image.jpg");
        entity.setPublisher("Addison-Wesley");
        entity.setMinStockLevel(5);

        // Act
        BookDTO dto = BookMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals("978-0134685991", dto.getIsbn());
        assertEquals("Effective Java", dto.getTitle());
        assertEquals("Joshua Bloch", dto.getAuthor());
        assertEquals("Programming guide", dto.getDescription());
        assertEquals(10, dto.getQuantity());
        assertEquals(new BigDecimal("45.99"), dto.getPrice());
        assertTrue(dto.isActive());
        assertEquals("Programming", dto.getCategoryName());
        assertEquals("http://example.com/image.jpg", dto.getImageUrl());
        assertEquals("Addison-Wesley", dto.getPublisher());
        assertEquals(5, dto.getMinStockLevel());
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        BookDTO dto = BookMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        BookDTO dto = new BookDTO();
        dto.setIsbn("978-0134685991");
        dto.setTitle("Effective Java");
        dto.setAuthor("Joshua Bloch");
        dto.setQuantity(10);
        dto.setPrice(new BigDecimal("45.99"));
        dto.setActive(true);

        // Act
        Book entity = BookMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals("978-0134685991", entity.getIsbn());
        assertEquals("Effective Java", entity.getTitle());
        assertEquals("Joshua Bloch", entity.getAuthor());
        assertEquals(10, entity.getQuantity().intValue());
        assertEquals(new BigDecimal("45.99"), entity.getPrice());
        assertTrue(entity.isActive());
        assertEquals(5, entity.getMinStockLevel().intValue()); // Default value
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        Book entity = BookMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }
}