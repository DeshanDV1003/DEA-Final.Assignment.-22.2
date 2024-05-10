package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

public class CustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO Customer (ContactName, phoneNumber, email, city, Address, PostalCode, Password, AdminId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM Customer WHERE CustomerId=?";
    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM Customer";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM Customer WHERE CustomerId=?";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE Customer SET ContactName=? phoneNumber=?, email=?, city=?, Address=?, PostalCode=?, Password=?, AdminId=? WHERE CustomerId=?";
    private static final String SELECT_CUSTOMER_BY_EMAIL_and_PASS = "SELECT * FROM Customer WHERE email=? AND Password=?";
    
    public CustomerDAO() {
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

    public void insertCustomer(Customer customer) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setString(1, customer.getContactName());
            preparedStatement.setString(2, customer.getPhoneNumber());
           preparedStatement.setString(3, customer.getEmail());
           preparedStatement.setString(4, customer.getCity());
            preparedStatement.setString(5, customer.getAddress());
             preparedStatement.setInt(6, customer.getPostalCode());
              preparedStatement.setString(7, customer.getPassword());
               preparedStatement.setInt(8, customer.getAdminId());
            preparedStatement.executeUpdate();
        }
    }

    public Customer selectCustomer(int CustomerId) {
        Customer customer = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID)) {
            preparedStatement.setInt(1, CustomerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ContactName = rs.getString("ContactName");
                String PhoneNumber = rs.getString("phoneNumber");
               String email = rs.getString("email");
               String city = rs.getString("city");
                String Address = rs.getString("Address");
                 int PostalCode = rs.getInt("PostalCode");
                 String Password = rs.getString("Password");
                 int AdminId = rs.getInt("AdminId");
                customer = new Customer(ContactName, PhoneNumber, email, city, Address, PostalCode, Password, AdminId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public List<Customer> selectAllCustomers() {
        List<Customer> customer = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               int CustomerId=rs.getInt("CustomerId");
               String ContactName = rs.getString("ContactName");
               String PhoneNumber = rs.getString("phoneNumber");
               String email = rs.getString("email");
               String city = rs.getString("city");
               String Address = rs.getString("Address");
               int PostalCode = rs.getInt("PostalCode");
               String Password = rs.getString("Password");
               int AdminId = rs.getInt("AdminId");
               customer.add(new Customer(CustomerId, ContactName, PhoneNumber, email, city, Address, PostalCode, Password, AdminId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public boolean deleteCustomer(int CustomerId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL)) {
            statement.setInt(1, CustomerId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
            statement.setString(1,customer.getContactName());
            statement.setString(2,customer.getPhoneNumber());
            statement.setString(3,customer.getEmail());
            statement.setString(4,customer.getCity());
            statement.setString(4, customer.getAddress());
            statement.setInt(6, customer.getPostalCode());
            statement.setString(7,customer.getPassword() );
            statement.setInt(8,customer.getAdminId());
            statement.setInt(9, customer.getCustomerId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public Customer getUserByEmailAndPassword(String email, String password) {
        Customer customer = null;
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_EMAIL_and_PASS)) {
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, password);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            int CustomerId = rs.getInt("CustomerId");
            String ContactName = rs.getString("ContactName");
            String PhoneNumber=rs.getString("phoneNumber");
            email = rs.getString("email");
            String city = rs.getString("city");
            String Address = rs.getString("Address");
            int PostalCode =rs.getInt("PostalCode");
            String Password = rs.getString("Password");
            int AdminId = rs.getInt("Password");
            customer = new Customer(CustomerId, ContactName, PhoneNumber, email, city, Address, PostalCode, Password, AdminId);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return customer;
    }

   

    
   
}
