package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.Data;
import uz.pdp.read_more.entity.abs.AbsEntity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "purchase")
public class Purchase extends AbsEntity {
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;

    private BigDecimal amount;
    private LocalDateTime purchaseDate;
}
