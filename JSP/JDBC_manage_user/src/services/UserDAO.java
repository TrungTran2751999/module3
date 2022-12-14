package services;

import models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/manage_user?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    private static final String INSERT_USER_SQL = "{CALL insert_user(?,?,?,?)}";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM USER WHERE ID=?";
    private static final String SELECT_ALL_USER = "SELECT * FROM USER";
    private static final String DELETE_USER_BY_ID = "DELETE FROM USER WHERE ID = ?";
    private static final String UPDATE_USER_BY_ID = "UPDATE USER SET NAME = ?, EMAIL = ?, COUNTRY = ? WHERE ID = ?";
    private static final String SELECT_LAST_ID = "SELECT MAX(ID) FROM USER";
    private static final String SELECT_USER_BY_NAME = "{CALL get_product_by_country(?)}";

    public UserDAO(){};
    private Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
    private int getMaxID(){
        int max = 0;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LAST_ID)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                max = Integer.parseInt(rs.getString("max(id)"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return max;
    }
    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USER_SQL);

        try(Connection connection = getConnection();
            CallableStatement preparedStatement = connection.prepareCall(INSERT_USER_SQL)){
            preparedStatement.setInt(1, getMaxID()+1);
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);
        }
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        Connection connection = null;
        PreparedStatement psmt = null;
        PreparedStatement psmtAssigment = null;
        ResultSet rs = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            psmt = connection.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
            psmt.setInt(1, user.getId());
            psmt.setString(2, user.getName());
            psmt.setString(3, user.getEmail());
            psmt.setString(4, user.getCountry());
            int rowAffected = psmt.executeUpdate();
            rs = psmt.getGeneratedKeys();
            int userId = 0;
            if(rs.next()){
                userId = rs.getInt("id");
            }
            if(rowAffected == 1) {
                String sqlPilot = "INSERT INTO user_permision(user_id,permision_id) VALUES (?,?)";
                psmtAssigment = connection.prepareStatement(sqlPilot);
                for (int permisionId : permision) {
                    psmtAssigment.setInt(1, userId);
                    psmtAssigment.setInt(2, permisionId);
                    psmtAssigment.executeUpdate();
                }
                connection.commit();
            }else{
                connection.rollback();
            }

        }catch (Exception e){
            try {
                if(connection != null){
                    connection.rollback();
                }
            }catch (Exception e1){
                e.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(psmt != null) psmt.close();
                if(psmtAssigment != null) psmtAssigment.close();
                if(connection != null) connection.close();
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
    }

    @Override
    public List<User> selectUserByName(String input) throws SQLException {
        List<User> userSearch = new ArrayList<>();
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER_BY_NAME)) {
            callableStatement.setString(1, input);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                userSearch.add(new User(id, name, email, country));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return userSearch;
    }

    @Override
    public User selectUser(int id) throws SQLException{
        User user = null;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        System.out.println(SELECT_ALL_USER);
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email =rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeletes = false;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_ID)){
            preparedStatement.setInt(1, id);
            rowDeletes = preparedStatement.executeUpdate() > 0;
        }catch (Exception e){
            e.printStackTrace();
        }
        return rowDeletes;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdates = false;
        try(Connection connection = getConnection();
            CallableStatement preparedStatement = connection.prepareCall(UPDATE_USER_BY_ID);){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdates = preparedStatement.executeUpdate() > 0;
        }catch (Exception e){
            e.printStackTrace();
        }
        return rowUpdates;
    }
    private void printSQLException(SQLException ex){
        for (Throwable e : ex) {
            if(e instanceof SQLException){
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
