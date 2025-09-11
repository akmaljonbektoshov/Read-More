package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.dao.entity_manager.ManagementFactory;
import uz.pdp.read_more.entity.Attachment;

import java.util.Optional;

public class AttachmentDAO {
    private final ManagementFactory mf = ManagementFactory.getInstance();

    public void save(Attachment attachment) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        entityManager.persist(attachment);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
    }

    public Optional<Attachment> findById(long id) {
        EntityManager entityManager = mf.getEntityManager();

        entityManager
                .getTransaction()
                .begin();

        Attachment attachment = entityManager.find(Attachment.class, id);

        entityManager
                .getTransaction()
                .commit();

        entityManager.close();
        return Optional.ofNullable(attachment);
    }

    private AttachmentDAO() {
    }
    private static AttachmentDAO attachmentDAO;
    public static AttachmentDAO getInstance() {
        if (attachmentDAO == null) {
            attachmentDAO = new AttachmentDAO();
        }
        return attachmentDAO;
    }
}
