package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class ManagementFactory {
    private EntityManagerFactory emf;
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    private ManagementFactory() {
    }
    private static ManagementFactory instance;
    public static ManagementFactory getInstance() {
        if (instance == null) {
            instance = new ManagementFactory();
            instance.emf = Persistence.createEntityManagerFactory("READ_MORE");
        }
        return instance;
    }
}
