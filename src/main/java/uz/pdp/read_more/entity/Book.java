package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import uz.pdp.read_more.entity.abs.AbsEntity;
import uz.pdp.read_more.entity.enums.BookType;

import java.math.BigDecimal;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "book")
@Data
public class Book extends AbsEntity {
    private String title;
    private String author;

    @Column(length = 2000)
    private String description;

    private BigDecimal price;

    private String coverImage;   // rasm yo‘li
    private String filePath;     // PDF yoki audio fayl yo‘li

    @Enumerated(EnumType.STRING)
    private BookType type;       // PDF yoki AUDIO

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
    private List<Purchase> purchases;
}
