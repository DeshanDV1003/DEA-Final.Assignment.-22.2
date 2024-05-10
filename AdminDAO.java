package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Admin;

public class AdminDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_ADMIN_SQL = "INSERT INTO Admin (AdminFname, AdminLname, AdminEmail, Password) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ADMIN_BY_ID = "SELECT * FROM Admin WHERE Admin_id=?";
    private static final String SELECT_ALL_ADMIN = "SELECT * FROM Admin";
    private static final String DELETE_ADMIN_SQL = "DELETE FROM Admin WHERE Admin_id=?";
    private static final String UPDATE_ADMIN_SQL = "UPDATE Admin SET AdminFname=?, AdminLname=?, AdminEmail=?, Password=? WHERE Admin_id=?";
    private static final String SELECT_CUSTOMER_BY_EMAIL_and_PASS="SELECT * FROM Admin WHERE AdminEmail=? AND Password=?";
    
    public AdminDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertAdmin(Admin admin) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL)) {
            preparedStatement.setString(1, admin.getAdminFname());
            preparedStatement.setString(2, admin.getAdminLname());
           preparedStatement.setString(3, admin.getAdminEmail());
           preparedStatement.setString(4, admin.getPassword());
            preparedStatement.executeUpdate();
        }
    }

    public Admin selectAdmin(int AdminId) {
        Admin admin = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_ID)) {
            preparedStatement.setInt(1, AdminId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String AdminFname = rs.getString("AdminFname");
                String AdminLname = rs.getString("AdminLname");
               String AdminEmail = rs.getString("AdminEmail");
               String Password = rs.getString("Password");
                admin = new Admin(AdminId, AdminFname, AdminLname, AdminEmail, Password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public List<Admin> selectAllAdmin() {
        List<Admin> admin = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADMIN)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int AdminId = rs.getInt("Admin_id");
               String AdminFname = rs.getString("AdminFname");
                String AdminLname = rs.getString("AdminLname");
               String AdminEmail = rs.getString("AdminEmail");
               String Password = rs.getString("Password");
                admin.add(new Admin(AdminId, AdminFname, AdminLname, AdminEmail, Password));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
       
        return admin;
    }

    public boolean deleteAdmin(int AdminId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ADMIN_SQL)) {
            statement.setInt(1, AdminId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateAdmin(Admin admin) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ADMIN_SQL)) {
            statement.setString(1, admin.getAdminFname());
            statement.setString(2, admin.getAdminLname());
           statement.setString(3, admin.getAdminEmail());
           statement.setString(4, admin.getPassword());
           statement.setInt(5, admin.getAdminId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public Admin getUserByEmailAndPassword(String AdminEmail, String Password) {
          Admin admin = null;
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_EMAIL_and_PASS)) {
        preparedStatement.setString(1, AdminEmail);
        preparedStatement.setString(2, Password);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
             int AdminId = rs.getInt("Admin_id");
               String AdminFname = rs.getString("AdminFname");
                String AdminLname = rs.getString("AdminLname");
                AdminEmail = rs.getString("AdminEmail");
                Password = rs.getString("Admin_id");
           
            admin = new Admin(AdminId, AdminFname, AdminLname, AdminEmail, Password);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return admin;
    }

   
}