package services;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;
    User selectUser(int id) throws SQLException;
    List<User> selectUserByName(String name) throws SQLException;
    List<User> selectAllUser();
    void addUserTransaction(User user, int[] permision);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
}
