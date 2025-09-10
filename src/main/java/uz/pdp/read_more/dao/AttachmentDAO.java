package uz.pdp.read_more.dao;

import jakarta.persistence.EntityManager;
import uz.pdp.read_more.entity.Attachment;

public class AttachmentDAO {
    private ManagementFactory mf = ManagementFactory.getInstance();

    public void save(Attachment attachment) {
        EntityManager em = mf.getEntityManager();
        em.getTransaction().begin();
        em.persist(attachment);
        em.getTransaction().commit();
        em.close();
    }

    public Attachment findById(long id) {
        EntityManager em = mf.getEntityManager();
        em.getTransaction().begin();
        Attachment attachment = em.find(Attachment.class, id);
        em.getTransaction().commit();
        em.close();
        return attachment;
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
