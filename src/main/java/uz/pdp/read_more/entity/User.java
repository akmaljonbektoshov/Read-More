package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.*;
import uz.pdp.read_more.entity.abs.AbsEntity;
import uz.pdp.read_more.entity.enums.Role;

import java.math.BigDecimal;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@Builder
public class User extends AbsEntity {
    private String fullName;

    @Column(unique = true, nullable = false)
    private String email;
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    private Double balance = 0.0;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Purchase> purchases;

    public User() {

    }

    public User(String fullName, String email, String password, Role role, Double balance) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.balance = balance;
    }
}