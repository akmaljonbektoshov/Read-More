package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.dao.entity_manager.ManagementFactory;
import uz.pdp.read_more.entity.User;

import java.util.List;
import java.util.Optional;

public class UserDAO {
    private final ManagementFactory mf = ManagementFactory.getInstance();

    public void save(User user) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        entityManager.persist(user);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
    }


    public Optional<User> findByEmail(String email) {
        EntityManager entityManager = mf.getEntityManager();

        try {
            entityManager.getTransaction().begin();

            List<User> users = entityManager
                    .createQuery("select u from User u where u.email = :email", User.class)
                    .setParameter("email", email)
                    .getResultList();

            entityManager.getTransaction().commit();

            if (users.isEmpty()) {
                return Optional.empty();
            }
            return Optional.of(users.get(0));

        } finally {
            entityManager.close();
        }
    }


    public Optional<User> findById(Long id) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        User user = entityManager.find(User.class, id);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
        return Optional.ofNullable(user);
    }

    private UserDAO() {}
    private static UserDAO userDAO;
    public static UserDAO getInstance() {
        if (userDAO == null) {
            userDAO = new UserDAO();
        }
        return userDAO;
    }
}
