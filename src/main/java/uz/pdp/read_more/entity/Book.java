package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import uz.pdp.read_more.entity.abs.AbsEntity;

import java.math.BigDecimal;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "book")
@Data
public class Book extends AbsEntity {
    private String title;
    private String author;
    private String genre;

    @Column(length = 2000)
    private String description;

    private BigDecimal price;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Purchase> purchases;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Attachment> attachments;
}