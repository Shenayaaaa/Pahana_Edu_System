package com.pahanaedu.mapper;

import com.pahanaedu.dto.BillDTO;
import com.pahanaedu.dto.BillItemDTO;
import com.pahanaedu.entities.Bill;
import com.pahanaedu.entities.BillItem;
import org.junit.Test;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
import static org.junit.Assert.*;

public class BillMapperTest {

    @Test
    public void testToDTOWithValidEntity() {
        // Arrange
        Bill entity = new Bill();
        entity.setBillId("BILL001");
        entity.setCustomerAccountNumber("ACC001");
        entity.setUserId(100);
        entity.setSubtotal(new BigDecimal("100.00"));
        entity.setTaxAmount(new BigDecimal("10.00"));
        entity.setDiscountAmount(new BigDecimal("5.00"));
        entity.setTotalAmount(new BigDecimal("105.00"));
        entity.setPaymentMethod("CREDIT_CARD");
        entity.setPaymentStatus("PAID");
        entity.setNotes("Test bill");
        entity.setBillDate(LocalDateTime.of(2024, 1, 15, 10, 30));

        BillItem item = new BillItem();
        item.setIsbn("978-0134685991");
        item.setBookTitle("Test Book");
        item.setQuantity(2);  // Added missing quantity
        item.setUnitPrice(new BigDecimal("45.99"));  // Added missing unit price
        item.setTotalPrice(new BigDecimal("91.98"));  // Added missing total price
        entity.setBillItems(Arrays.asList(item));

        // Act
        BillDTO dto = BillMapper.toDTO(entity);

        // Assert
        assertNotNull(dto);
        assertEquals("BILL001", dto.getBillId());
        assertEquals("BILL001", dto.getBillNumber());
        assertEquals("ACC001", dto.getCustomerAccountNumber());
        assertEquals(Integer.valueOf(100), dto.getUserId());
        assertEquals(new BigDecimal("100.00"), dto.getSubtotal());
        assertEquals(new BigDecimal("10.00"), dto.getTaxAmount());
        assertEquals(new BigDecimal("5.00"), dto.getDiscountAmount());
        assertEquals(new BigDecimal("105.00"), dto.getTotalAmount());
        assertEquals("CREDIT_CARD", dto.getPaymentMethod());
        assertEquals("PAID", dto.getPaymentStatus());
        assertEquals("Test bill", dto.getNotes());
        assertNotNull(dto.getBillDate());
        assertNotNull(dto.getBillItems());
        assertEquals(1, dto.getBillItems().size());
    }

    @Test
    public void testToDTOWithNullEntity() {
        // Act
        BillDTO dto = BillMapper.toDTO(null);

        // Assert
        assertNull(dto);
    }

    @Test
    public void testToEntityWithValidDTO() {
        // Arrange
        BillDTO dto = new BillDTO();
        dto.setBillId("BILL001");
        dto.setCustomerAccountNumber("ACC001");
        dto.setUserId(100);
        dto.setSubtotal(new BigDecimal("100.00"));
        dto.setTaxAmount(new BigDecimal("10.00"));
        dto.setDiscountAmount(new BigDecimal("5.00"));
        dto.setTotalAmount(new BigDecimal("105.00"));
        dto.setPaymentMethod("CREDIT_CARD");
        dto.setPaymentStatus("PAID");
        dto.setNotes("Test bill");
        dto.setBillDate(new Date());

        BillItemDTO itemDTO = new BillItemDTO();
        itemDTO.setIsbn("978-0134685991");
        itemDTO.setBookTitle("Test Book");
        itemDTO.setQuantity(2);  // Added missing quantity
        itemDTO.setUnitPrice(new BigDecimal("45.99"));  // Added missing unit price
        itemDTO.setTotalPrice(new BigDecimal("91.98"));  // Added missing total price
        dto.setBillItems(Arrays.asList(itemDTO));

        // Act
        Bill entity = BillMapper.toEntity(dto);

        // Assert
        assertNotNull(entity);
        assertEquals("BILL001", entity.getBillId());
        assertEquals("ACC001", entity.getCustomerAccountNumber());
        assertEquals(Integer.valueOf(100), entity.getUserId());
        assertEquals(new BigDecimal("100.00"), entity.getSubtotal());
        assertEquals(new BigDecimal("10.00"), entity.getTaxAmount());
        assertEquals(new BigDecimal("5.00"), entity.getDiscountAmount());
        assertEquals(new BigDecimal("105.00"), entity.getTotalAmount());
        assertEquals("CREDIT_CARD", entity.getPaymentMethod());
        assertEquals("PAID", entity.getPaymentStatus());
        assertEquals("Test bill", entity.getNotes());
        assertNotNull(entity.getBillDate());
        assertNotNull(entity.getBillItems());
        assertEquals(1, entity.getBillItems().size());
    }

    @Test
    public void testToEntityWithNullDTO() {
        // Act
        Bill entity = BillMapper.toEntity(null);

        // Assert
        assertNull(entity);
    }
}