package services;

import model.User;

import java.sql.*;

public class UserDAO implements IUserDAO {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/manage_user?";
    private static final String jdbcUserName = "root";
    private static final String jdbcPassWord = "123456";
    private static final String INSERT_USER = "INSERT INTO USER(ID,NAME,EMAIL,COUNTRY) VALUES (?,?,?,?) ";
    private static final String UPDATE_USER_BY_ID = "UPDATE USER SET NAME = ?, EMAIL = ?, COUNTRY = ? WHERE ID = ?";
    private static final String SELECT_MAX_ID = "SELECT MAX(ID) FROM USER";
    private Connection getConnnect(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassWord);
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public void insertUpdateUser() {
        try(Connection connection = getConnnect();
            PreparedStatement preparedStatementInsert = connection.prepareStatement(INSERT_USER);
            PreparedStatement preparedStatementUpdate = connection.prepareStatement(UPDATE_USER_BY_ID)) {

            connection.setAutoCommit(false);

            preparedStatementInsert.setInt(1, selectMaxId()+1);
            preparedStatementInsert.setString(2, "Trung");
            preparedStatementInsert.setString(3, "trung@gmail.com");
            preparedStatementInsert.setString(4, "vn");

            preparedStatementInsert.execute();
            System.out.println("Complete 1");

            preparedStatementInsert.setInt(1, selectMaxId()+2);
            preparedStatementInsert.setString(2, "Trung");
            preparedStatementInsert.setString(3, "trung@gmail.com");
            preparedStatementInsert.setString(4, "vn");

            preparedStatementInsert.execute();
            System.out.println("Complete 2");

            preparedStatementUpdate.setString(1, "Nam");
            preparedStatementUpdate.setString(2, "nam@gmail.com");
            preparedStatementUpdate.setString(3, "UK");
            preparedStatementUpdate.setInt(4, 2);

            preparedStatementUpdate.execute();
            System.out.println("complete 3");

            connection.commit();
            connection.setAutoCommit(true);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int selectMaxId(){
        int max = 0;
        try(Connection connection = getConnnect();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_ID)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                max = rs.getInt("max(id)");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return max;
    }
}
