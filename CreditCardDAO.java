package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CreditCard;

public class CreditCardDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_CREDITCARD_SQL = "INSERT INTO CreditCard (CreditCardNo , creditCardType , CardHolderName ,CreditCardCvv, ExpDate) VALUES (?, ?, ?, ?,?)";
    private static final String SELECT_CREDITCARD_BY_ID = "SELECT * FROM CreditCard WHERE CreditCardId =?";
    private static final String SELECT_ALL_CREDITCARD = "SELECT * FROM CreditCard";
    private static final String DELETE_CREDITCARD_SQL = "DELETE FROM CreditCard WHERE CreditCardId =?";
    private static final String UPDATE_CREDITCARD_SQL = "UPDATE CreditCard SET CreditCardNo=?, CardHolderName=?, CreditCardCvv=?, ExpDate=? WHERE CreditCardId =?";

    public CreditCardDAO() {
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

    public void insertCreditCard(CreditCard creditcard) throws SQLException {
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CREDITCARD_SQL)) {
            preparedStatement.setInt(1, creditcard.getCreditCardNo());
            preparedStatement.setString(2, creditcard.getCreditCardType());
            preparedStatement.setString(3, creditcard.getCardHolderName());
            preparedStatement.setInt(4, creditcard.getCreditCardCvv());
            preparedStatement.setString(5, creditcard.getExpDate());
            preparedStatement.executeUpdate();
        }
    }

    public CreditCard selectCreditCard(int CreditCardId) {
        CreditCard creditcard = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CREDITCARD_BY_ID)) {
            preparedStatement.setInt(1, CreditCardId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int CreditCardNo = rs.getInt("CreditCardNo");
                String creditCardType=rs.getString("creditCardType");
                String CardHolderName = rs.getString("CardHolderName");
                int CreditCardCvv = rs.getInt("CreditCardCvv");
                String ExpDate = rs.getString("ExpDate");
                creditcard = new CreditCard(CreditCardNo,creditCardType ,CardHolderName, CreditCardCvv, ExpDate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return creditcard;
    }

    public List<CreditCard> selectAllCreditCard() {
        List<CreditCard> creditcard = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CREDITCARD)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               int CreditCardId = rs.getInt("CreditCardId ");
               int CreditCardNo = rs.getInt("CreditCardNo");
               String creditCardType=rs.getString("creditCardType");
               String CardHolderName = rs.getString("CardHolderName");
               int CreditCardCvv = rs.getInt("CreditCardCvv");
               String ExpDate = rs.getString("ExpDate");
                creditcard.add(new CreditCard(CreditCardId, CreditCardNo,creditCardType ,CardHolderName, CreditCardCvv, ExpDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
       
        return creditcard;
    }

    public boolean deleteCreditCard(int CreditCardId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CREDITCARD_SQL)) {
            statement.setInt(1, CreditCardId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCreditCard(CreditCard creditcard) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CREDITCARD_SQL)) {
            statement.setInt(1, creditcard.getCreditCardNo());
            statement.setString(2, creditcard.getCreditCardType());
            statement.setString(3, creditcard.getCardHolderName());
            statement.setInt(4, creditcard.getCreditCardCvv());
            statement.setString(5, creditcard.getExpDate());
            statement.setInt(6, creditcard.getCreditCardId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

   
}