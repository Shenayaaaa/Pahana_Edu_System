package com.pahanaedu.mapper;

import com.pahanaedu.dto.CartItemDTO;
import com.pahanaedu.entities.CartItem;
import org.junit.Test;
import java.math.BigDecimal;
import static org.junit.Assert.*;

public class CartItemMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        CartItem entity = new CartItem();
        entity.setIsbn("978-0134685991");
        entity.setTitle("Effective Java");
        entity.setAuthor("Joshua Bloch");
        entity.setPrice(new BigDecimal("45.99"));
        entity.setQuantity(2);
        // Note: total is calculated automatically in CartItem, not set manually

        // Act
        CartItemDTO dto = CartItemMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals("978-0134685991", dto.getIsbn());
        assertEquals("Effective Java", dto.getTitle());
        assertEquals("Joshua Bloch", dto.getAuthor());
        assertEquals(new BigDecimal("45.99"), dto.getPrice());
        assertEquals(2, dto.getQuantity());
        assertNotNull(dto.getTotal()); // Total should be calculated
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        CartItemDTO dto = CartItemMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        CartItemDTO dto = new CartItemDTO();
        dto.setIsbn("978-0134685991");
        dto.setTitle("Effective Java");
        dto.setAuthor("Joshua Bloch");
        dto.setPrice(new BigDecimal("45.99"));
        dto.setQuantity(2);

        // Act
        CartItem entity = CartItemMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals("978-0134685991", entity.getIsbn());
        assertEquals("Effective Java", entity.getTitle());
        assertEquals("Joshua Bloch", entity.getAuthor());
        assertEquals(new BigDecimal("45.99"), entity.getPrice());
        assertEquals(2, entity.getQuantity());
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        CartItem entity = CartItemMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }
}