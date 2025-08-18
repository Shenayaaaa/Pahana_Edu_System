package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.time.LocalDateTime;

public class CategoryTest {

    private Category category;

    @Before
    public void setUp() {
        category = new Category();
    }

    @Test
    public void testDefaultConstructor() {
        Category newCategory = new Category();
        assertNotNull(newCategory);
        assertNull(newCategory.getId());
        assertNull(newCategory.getName());
        assertNull(newCategory.getDescription());
        assertFalse(newCategory.isActive());
        assertNull(newCategory.getCreatedDate());
    }

    @Test
    public void testParameterizedConstructor() {
        String name = "Fiction";
        String description = "Fiction books category";

        Category testCategory = new Category(name, description);

        assertEquals(name, testCategory.getName());
        assertEquals(description, testCategory.getDescription());
        assertTrue(testCategory.isActive());
        assertNotNull(testCategory.getCreatedDate());
    }

    @Test
    public void testSettersAndGetters() {
        Integer id = 1;
        String name = "Science";
        String description = "Science books";
        LocalDateTime createdDate = LocalDateTime.now();

        category.setId(id);
        category.setName(name);
        category.setDescription(description);
        category.setActive(true);
        category.setCreatedDate(createdDate);

        assertEquals(id, category.getId());
        assertEquals(name, category.getName());
        assertEquals(description, category.getDescription());
        assertTrue(category.isActive());
        assertEquals(createdDate, category.getCreatedDate());
    }

    @Test
    public void testActiveStatus() {
        category.setActive(true);
        assertTrue(category.isActive());

        category.setActive(false);
        assertFalse(category.isActive());
    }

    @Test
    public void testToString() {
        category.setId(1);
        category.setName("Technology");
        category.setDescription("Tech books");

        String result = category.toString();

        assertTrue(result.contains("1"));
        assertTrue(result.contains("Technology"));
        assertTrue(result.contains("Tech books"));
    }
}