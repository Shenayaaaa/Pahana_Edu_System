package com.pahanaedu.entities;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class BookTest {

    private Book book;

    @Before
    public void setUp() {
        book = new Book();
    }

    @Test
    public void testDefaultConstructor() {
        Book newBook = new Book();
        assertNotNull(newBook);
        assertNull(newBook.getIsbn());
        assertNull(newBook.getTitle());
        assertFalse(newBook.isActive());
    }

    @Test
    public void testParameterizedConstructor() {
        String isbn = "978-0134685991";
        String title = "Effective Java";
        String author = "Joshua Bloch";
        String publisher = "Addison-Wesley";
        BigDecimal price = new BigDecimal("45.99");
        Integer quantity = 10;

        Book testBook = new Book(isbn, title, author, publisher, price, quantity);

        assertEquals(isbn, testBook.getIsbn());
        assertEquals(title, testBook.getTitle());
        assertEquals(author, testBook.getAuthor());
        assertEquals(publisher, testBook.getPublisher());
        assertEquals(price, testBook.getPrice());
        assertEquals(quantity, testBook.getQuantity());
        assertEquals(Integer.valueOf(5), testBook.getMinStockLevel());
        assertTrue(testBook.isActive());
        assertNotNull(testBook.getCreatedDate());
        assertNotNull(testBook.getUpdatedDate());
    }

    @Test
    public void testSettersAndGetters() {
        String isbn = "978-0134685991";
        String title = "Clean Code";
        String imageUrl = "http://example.com/image.jpg";
        String author = "Robert Martin";
        String publisher = "Prentice Hall";
        String description = "A handbook of agile software craftsmanship";
        Integer categoryId = 1;
        String categoryName = "Programming";
        BigDecimal price = new BigDecimal("39.99");
        Integer quantity = 15;
        Integer minStockLevel = 3;
        String googleBookId = "abc123";
        LocalDateTime now = LocalDateTime.now();

        book.setIsbn(isbn);
        book.setTitle(title);
        book.setImageUrl(imageUrl);
        book.setAuthor(author);
        book.setPublisher(publisher);
        book.setDescription(description);
        book.setCategoryId(categoryId);
        book.setCategoryName(categoryName);
        book.setPrice(price);
        book.setQuantity(quantity);
        book.setMinStockLevel(minStockLevel);
        book.setActive(false);
        book.setGoogleBookId(googleBookId);
        book.setCreatedDate(now);
        book.setUpdatedDate(now);

        assertEquals(isbn, book.getIsbn());
        assertEquals(title, book.getTitle());
        assertEquals(imageUrl, book.getImageUrl());
        assertEquals(author, book.getAuthor());
        assertEquals(publisher, book.getPublisher());
        assertEquals(description, book.getDescription());
        assertEquals(categoryId, book.getCategoryId());
        assertEquals(categoryName, book.getCategoryName());
        assertEquals(price, book.getPrice());
        assertEquals(quantity, book.getQuantity());
        assertEquals(minStockLevel, book.getMinStockLevel());
        assertFalse(book.isActive());
        assertEquals(googleBookId, book.getGoogleBookId());
        assertEquals(now, book.getCreatedDate());
        assertEquals(now, book.getUpdatedDate());
    }

    @Test
    public void testIsLowStock() {
        book.setQuantity(5);
        book.setMinStockLevel(5);
        assertTrue(book.isLowStock());

        book.setQuantity(3);
        book.setMinStockLevel(5);
        assertTrue(book.isLowStock());

        book.setQuantity(10);
        book.setMinStockLevel(5);
        assertFalse(book.isLowStock());
    }

    @Test
    public void testToString() {
        book.setIsbn("123456789");
        book.setTitle("Test Book");
        book.setAuthor("Test Author");
        book.setPrice(new BigDecimal("25.99"));
        book.setQuantity(10);

        String result = book.toString();

        assertTrue(result.contains("123456789"));
        assertTrue(result.contains("Test Book"));
        assertTrue(result.contains("Test Author"));
        assertTrue(result.contains("25.99"));
        assertTrue(result.contains("10"));
    }
}