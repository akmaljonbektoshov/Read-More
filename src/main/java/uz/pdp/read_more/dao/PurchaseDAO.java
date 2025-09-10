package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.entity.Purchase;

public class PurchaseDAO {
    private final ManagementFactory mf = ManagementFactory.getInstance();

    public void save(Purchase purchase) {
        EntityManager entityManager = mf.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(purchase);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    public Purchase findById(long id) {
        EntityManager entityManager = mf.getEntityManager();
        entityManager.getTransaction().begin();
        Purchase purchase = entityManager.find(Purchase.class, id);
        entityManager.getTransaction().commit();
        entityManager.close();
        return purchase;
    }



    private PurchaseDAO() {}
    private static PurchaseDAO purchaseDAO;
    private static PurchaseDAO getPurchaseDAO() {
        if (purchaseDAO == null) {
            purchaseDAO = new PurchaseDAO();
        }
        return purchaseDAO;
    }
}
