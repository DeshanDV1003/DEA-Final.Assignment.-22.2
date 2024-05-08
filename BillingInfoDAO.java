package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.BillingInfo;



public class BillingInfoDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_BILLING_INFO_SQL = "INSERT INTO BillingInfo (BillingDate, BillingAddress, BillPostalCode,BillCity,CreditCardId,CustomerId) VALUES (?, ?, ?,?,?,?)";
    private static final String SELECT_BILLING_INFO_BY_ID = "SELECT * FROM BillingInfo WHERE BillingId=?";
    private static final String SELECT_ALL_BILLINGINFOS = "SELECT * FROM BillingInfo";
    private static final String DELETE_BILLINGINFO_SQL = "DELETE FROM BillingInfo WHERE BillingId=?";
    private static final String UPDATE_BILLINGINFO_SQL = "UPDATE BillingInfo SET BillingDate=?, BillingAddress=?, BillPostalCode=? ,BillCity=? ,CreditCardId=? , CustomerId=? WHERE BillingId=?";

    public BillingInfoDAO() {
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

    public void insertBillingInfo(BillingInfo billingInfo) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BILLING_INFO_SQL)) {
            preparedStatement.setDate(1, (Date) billingInfo.getDate());
            preparedStatement.setString(2, billingInfo.getBillinAddress());
            preparedStatement.setInt(3, billingInfo.getBillingId());
            preparedStatement.setString(4, billingInfo.getBillingCity());
            preparedStatement.setInt(5, billingInfo.getCreditCardId());
            preparedStatement.setInt(6, billingInfo.getCustomerId());
            preparedStatement.executeUpdate();
        }
    }

    public BillingInfo selectBillingInfo(int billingId) {
        BillingInfo billingInfo = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BILLING_INFO_BY_ID)) {
            preparedStatement.setInt(1, billingId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Date billingDate = rs.getDate("BillingDate");
                String billingAddress = rs.getString("BillingAddress");
                int billPostalCode = rs.getInt("BillPostalCode");
                String billCity = rs.getString("BillCity");
                int creditCardId=rs.getInt("CreditCardId");
                int customerId=rs.getInt("CustomerId");
                billingInfo = new BillingInfo(billingDate,billingAddress,billPostalCode,billCity,creditCardId, customerId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return billingInfo;
    }

    public List<BillingInfo> selectAllBillingInfos() {
        List<BillingInfo> billingInfo = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BILLINGINFOS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int billingId=rs.getInt("BillingId");
                Date billingDate = rs.getDate("BillingDate");
                String billingAddress = rs.getString("BillingAddress");
                int billPostalCode = rs.getInt("BillPostalCode");
                String billCity = rs.getString("BillCity");
                int creditCardId=rs.getInt("CreditCardId");
                int customerId=rs.getInt("CustomerId");
                billingInfo.add(new BillingInfo(billingId,billingDate,billingAddress,billPostalCode,billCity, creditCardId,customerId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return billingInfo;
    }

    public boolean deleteBillingInfo(int billingId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_BILLINGINFO_SQL)) {
            statement.setInt(1, billingId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateBillingInfo(BillingInfo billingInfo) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_BILLINGINFO_SQL)) {
            statement.setDate(1, (Date) billingInfo.getDate());
            statement.setString(2, billingInfo.getBillinAddress());
            statement.setInt(3, billingInfo.getBillingId());
            statement.setString(4, billingInfo.getBillingCity());
            statement.setInt(5, billingInfo.getCreditCardId());
            statement.setInt(6, billingInfo.getCustomerId());
            statement.setInt(7, billingInfo.getBillingId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}