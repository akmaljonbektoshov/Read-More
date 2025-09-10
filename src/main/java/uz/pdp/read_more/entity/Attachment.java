package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.Data;

import lombok.EqualsAndHashCode;
import uz.pdp.read_more.entity.abs.AbsEntity;
import uz.pdp.read_more.entity.enums.AttachmentType;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "attachment")
public class Attachment extends AbsEntity {
    private String filePath;
    private String fileName;
    private Long fileSize;

    @Enumerated(EnumType.STRING)
    private AttachmentType type;

    @ManyToOne
    @JoinColumn(name = "book_id", nullable = false)
    private Book book;
}