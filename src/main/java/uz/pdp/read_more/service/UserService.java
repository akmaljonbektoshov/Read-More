package uz.pdp.read_more.service;

import uz.pdp.read_more.dao.UserDAO;
import uz.pdp.read_more.entity.User;


public class UserService {

    static UserDAO userDAO = UserDAO.getInstance();
    private static void saveUser(User user){
        userDAO.save(user);
    }

}
