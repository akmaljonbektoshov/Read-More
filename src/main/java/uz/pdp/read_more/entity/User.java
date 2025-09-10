package uz.pdp.read_more.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import uz.pdp.read_more.entity.abs.AbsEntity;
import uz.pdp.read_more.entity.enums.Role;

import java.math.BigDecimal;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "users")
@Data
public class User extends AbsEntity {
    private String fullName;
    private String email;
    private String password;
    private Role role;
    private BigDecimal balance = BigDecimal.ZERO;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Purchase> purchases;
}
