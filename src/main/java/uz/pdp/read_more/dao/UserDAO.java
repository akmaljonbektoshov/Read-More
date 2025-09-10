package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.entity.User;

public class UserDAO {
    private ManagementFactory mf = ManagementFactory.getInstance();

    public void saveUser(User user) {
        EntityManager entityManager = mf.getEntityManager();
        entityManager
                .getTransaction()
                .begin();

        entityManager
                .persist(user);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
    }


    public User findByEmail(String email) {
        User user = null;
        EntityManager entityManager = mf.getEntityManager();
        entityManager
                .getTransaction()
                .begin();
        user = entityManager
                .createQuery("select u from User u where u.email = :email", User.class)
                .setParameter("email", email)
                .getSingleResult();

        entityManager
                .getTransaction()
                .commit();
        entityManager.close();

        return user;

    }

    public User findById(Long id) {
        User user = null;
        EntityManager entityManager = mf.getEntityManager();
        entityManager
                .getTransaction().begin();
        user = entityManager
                .find(User.class, id);
        entityManager
                .getTransaction()
                .commit();
        entityManager
                .clear();
        entityManager.close();
        return user;
    }

    private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
}
