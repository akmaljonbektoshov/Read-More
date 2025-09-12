package uz.pdp.read_more.service;

import uz.pdp.read_more.dao.UserDAO;
import uz.pdp.read_more.entity.User;
import uz.pdp.read_more.entity.enums.Role;

import java.util.ArrayList;
import java.util.List;


public class UserService {

    private static final List<User> users = new ArrayList<>(List.of(
            new User("admin", "sultanovoybek01@gmail.com", "admin", Role.ADMIN,700.0)
    ));


}
