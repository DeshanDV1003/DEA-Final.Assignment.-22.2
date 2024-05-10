package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shipper;

public class ShipperDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_SHIPPER_SQL = "INSERT INTO Shipper (Phone, CompanyName, AdminId) VALUES (?, ?, ?)";
    private static final String SELECT_SHIPPER_BY_ID = "SELECT * FROM Shipper WHERE ShipperId=?";
    private static final String SELECT_ALL_SHIPPER = "SELECT * FROM Shipper";
    private static final String DELETE_SHIPPER_SQL = "DELETE FROM Shipper WHERE ShipperId=?";
    private static final String UPDATE_SHIPPER_SQL = "UPDATE Shipper SET Phone=?, CompanyName=?, AdminId=? WHERE ShipperId=?";

    public ShipperDAO() {
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

    public void insertShipper(Shipper shipper) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SHIPPER_SQL)) {
            preparedStatement.setString(1, shipper.getPhone());
            preparedStatement.setString(2, shipper.getCompanyName());
           preparedStatement.setInt(3, shipper.getAdminId());
           
            preparedStatement.executeUpdate();
        }
    }

    public Shipper selectShipper(int ShipperId) {
        Shipper shipper = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SHIPPER_BY_ID)) {
            preparedStatement.setInt(1, ShipperId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String Phone = rs.getString("Phone");
                String CompanyName = rs.getString("CompanyName");
               int AdminId = rs.getInt("AdminId");
                shipper = new Shipper(ShipperId, Phone, CompanyName, AdminId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shipper;
    }

    public List<Shipper> selectAllShipper() {
        List<Shipper> shipper = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SHIPPER)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int ShipperId = rs.getInt("ShipperId");
               String Phone = rs.getString("Phone");
                String CompanyName = rs.getString("CompanyName");
                int AdminId = rs.getInt("AdminId");
                Shipper.add(new Shipper(ShipperId, Phone, CompanyName, AdminId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shipper;
    }

    public boolean deleteShipper(int ShipperId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SHIPPER_SQL)) {
            statement.setInt(1, ShipperId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateShipper(Shipper shipper) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_SHIPPER_SQL)) {
            statement.setString(1, shipper.getPhone());
            statement.setString(2, shipper.getCompanyName());
           statement.setInt(3, shipper.getAdminId());
           statement.setInt(4, shipper.getShipperId());
           
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

   
}
