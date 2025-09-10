package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.entity.Book;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BookDAO {
    private ManagementFactory mf = ManagementFactory.getInstance();

    public void save(Book book) {
        EntityManager entityManager = mf.getEntityManager();
        entityManager
                .getTransaction()
                .begin();

        entityManager
                .persist(book);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
    }

    public List<Book> findAllByNameContaining(String title) {
        EntityManager entityManager = mf.getEntityManager();
        List<Book> books = new ArrayList<>();
        try {
            books = entityManager
                    .createQuery("SELECT b FROM Book b WHERE LOWER(b.title) LIKE LOWER(:title)", Book.class)
                    .setParameter("title", "%" + title + "%")
                    .getResultList();
        } finally {
            entityManager.close();
        }
        return books;
    }


    public Optional<Book> findById(Long id) {
        Book  book= null;
        EntityManager entityManager = mf.getEntityManager();
        entityManager
                .getTransaction().begin();
        book = entityManager
                .find(Book.class, id);
        entityManager
                .getTransaction()
                .commit();
        entityManager
                .clear();
        entityManager.close();
        return Optional.of(book);
    }

    private static BookDAO instance;

    public static BookDAO getInstance() {
        if (instance == null) {
            instance = new BookDAO();
        }
        return instance;
    }
}
