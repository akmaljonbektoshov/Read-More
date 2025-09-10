package uz.pdp.read_more.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import lombok.Data;

import uz.pdp.read_more.entity.abs.AbsEntity;
import uz.pdp.read_more.entity.enums.BookType;


@Entity
@Data
public class Attachment extends AbsEntity {

    private String filePath;

    private String fileName;

    @Enumerated(EnumType.STRING)
    private BookType suffix;

    private Long fileSize;

    @ManyToOne
    private Book book;
}




