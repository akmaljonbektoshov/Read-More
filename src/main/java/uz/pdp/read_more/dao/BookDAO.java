package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.dao.entity_manager.ManagementFactory;
import uz.pdp.read_more.entity.Book;

import java.util.List;
import java.util.Optional;

public class BookDAO {
    private final ManagementFactory mf = ManagementFactory.getInstance();

    public void save(Book book) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        entityManager.persist(book);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
    }

    public List<Book> findAllByNameContaining(String title) {
        EntityManager entityManager = mf.getEntityManager();

        List<Book> books = entityManager
                    .createQuery("SELECT b FROM Book b WHERE LOWER(b.title) LIKE LOWER(:title)", Book.class)
                    .setParameter("title", "%" + title + "%")
                    .getResultList();

        entityManager.close();
        return books;
    }

    public Optional<Book> findById(Long id) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        Book  book = entityManager.find(Book.class, id);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
        return Optional.ofNullable(book);
    }

    private BookDAO() {}
    private static BookDAO bookDAO;
    public static BookDAO getInstance() {
        if (bookDAO == null) {
            bookDAO = new BookDAO();
        }
        return bookDAO;
    }
}
