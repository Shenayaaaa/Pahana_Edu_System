package com.pahanaedu.mapper;

import com.pahanaedu.dto.BillItemDTO;
import com.pahanaedu.entities.BillItem;
import org.junit.Test;
import java.math.BigDecimal;
import static org.junit.Assert.*;

public class BillItemMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        BillItem entity = new BillItem();
        entity.setIsbn("978-0134685991");
        entity.setBookTitle("Effective Java");
        entity.setQuantity(2);
        entity.setUnitPrice(new BigDecimal("45.99"));
        entity.setTotalPrice(new BigDecimal("91.98"));
        entity.setDiscountAmount(new BigDecimal("5.00"));

        // Act
        BillItemDTO dto = BillItemMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals("978-0134685991", dto.getIsbn());
        assertEquals("Effective Java", dto.getBookTitle());
        assertEquals(2, dto.getQuantity());
        assertEquals(new BigDecimal("45.99"), dto.getUnitPrice());
        assertEquals(new BigDecimal("91.98"), dto.getTotalPrice());
        assertEquals(new BigDecimal("5.00"), dto.getDiscountAmount());
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        BillItemDTO dto = BillItemMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        BillItemDTO dto = new BillItemDTO();
        dto.setIsbn("978-0134685991");
        dto.setBookTitle("Effective Java");
        dto.setQuantity(2);
        dto.setUnitPrice(new BigDecimal("45.99"));
        dto.setTotalPrice(new BigDecimal("91.98"));
        dto.setDiscountAmount(new BigDecimal("5.00"));

        // Act
        BillItem entity = BillItemMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals("978-0134685991", entity.getIsbn());
        assertEquals("Effective Java", entity.getBookTitle());
        assertEquals(2, entity.getQuantity().intValue());
        assertEquals(new BigDecimal("45.99"), entity.getUnitPrice());
        assertEquals(new BigDecimal("91.98"), entity.getTotalPrice());
        assertEquals(new BigDecimal("5.00"), entity.getDiscountAmount());
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        BillItem entity = BillItemMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }
}