package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

public class CustomerOrderDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_ORDER_SQL = "INSERT INTO CustomerOrder (OrderDate, RequiredDate, total_amount,ShippedDate,ShippingCost, ShipAddress, ShipPostalCode, quantity, OrderStatus,cartId, AdminId, CustomerId, BillingId ,ShipperId, product_Id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ORDER_BY_ID = "SELECT * FROM CustomerOrder WHERE OrderId=?";
    private static final String SELECT_ALL_ORDER = "SELECT * FROM CustomerOrder";
    private static final String DELETE_ORDER_SQL = "DELETE FROM CustomerOrder WHERE OrderId=?";
    private static final String UPDATE_ORDER_SQL = "UPDATE CustomerOrder SET OrderDate=?, RequiredDate=?, total_amount=?, ShippedDate=?, ShippingCost=?, ShipAddress=?, ShipPostalCode=?, quantity=?, OrderStatus=?, cartId=?, AdminId=?, CustomerId=?, BillingId=?, ShipperId=?, product_Id=? WHERE OrderId=?";

    public CustomerOrderDAO() {
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

    public void insertOrder(Order order) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL)) {
            preparedStatement.setString(1, order.getOrderDate());
            preparedStatement.setString(2, order.getRequiredDate());
            preparedStatement.setFloat(3, order.getTotal_amount());
            preparedStatement.setString(4, order.getShippedDate());
            preparedStatement.setFloat(5, order.getShippingCost());
            preparedStatement.setString(6, order.getShipAddress());
            preparedStatement.setInt(7, order.getShipPostalCode());
            preparedStatement.setInt(8, order.getQuantity());
            preparedStatement.setBoolean(9, order.getOrderStatus());
            preparedStatement.setInt(10, order.getCartId());
            preparedStatement.setInt(11, order.getAdminId());
            preparedStatement.setInt(12, order.getCustomerId ());
            preparedStatement.setInt(13, order.getBillingId());
            preparedStatement.setInt(14, order.getShipperId());
            preparedStatement.setInt(14, order.getProductId());
            preparedStatement.executeUpdate();
        }
    }

    public Order selectOrder(int OrderID) {
        Order order = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_ID)) {
            preparedStatement.setInt(1, OrderID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               String OrderDate = rs.getString("OrderDate");
               String RequiredDate = rs.getString("RequiredDate ");
               float total_amount = rs.getFloat("total_amount ");
               String shippedDate = rs.getString("ShippedDate ");
               float ShippingCost = rs.getFloat("ShippingCost ");
               String ShipAddress = rs.getString("ShipAddress ");
               int ShipPostalCode = rs.getInt("ShipPostalCode ");
               int quantity = rs.getInt("quantity");
               boolean OrderStatus = rs.getBoolean("OrderStatus");
               int cartId = rs.getInt("cartId");
               int AdminId  = rs.getInt("AdminId ");
               int CustomerId = rs.getInt("CustomerId");
               int BillingId = rs.getInt("BillingId");
               int ShipperId = rs.getInt("ShipperId");
               int productId = rs.getInt("product_Id");
               order = new Order(OrderDate, RequiredDate,total_amount, shippedDate,ShippingCost,ShipAddress,ShipPostalCode, quantity, OrderStatus, cartId, AdminId, CustomerId, BillingId, ShipperId, productId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public List<Order> selectAllOrder() {
        List<Order> order = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDER)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               int OrderID = rs.getInt("OrderID");
               String OrderDate = rs.getString("OrderDate");
               String RequiredDate = rs.getString("RequiredDate ");
               float total_amount = rs.getFloat("total_amount ");
               String shippedDate = rs.getString("ShippedDate ");
               float ShippingCost = rs.getFloat("ShippingCost ");
               String ShipAddress = rs.getString("ShipAddress ");
               int ShipPostalCode = rs.getInt("ShipPostalCode ");
               int quantity = rs.getInt("quantity");
               boolean OrderStatus = rs.getBoolean("OrderStatus");
               int cartId = rs.getInt("cartId");
               int AdminId  = rs.getInt("AdminId ");
               int CustomerId = rs.getInt("CustomerId");
               int BillingId = rs.getInt("BillingId");
               int ShipperId = rs.getInt("ShipperId");
               int productId = rs.getInt("product_Id");
               order.add(new Order(OrderID, OrderDate, RequiredDate, total_amount, shippedDate, ShippingCost, ShipAddress, ShipPostalCode, quantity, OrderStatus, cartId, AdminId, CustomerId, BillingId, ShipperId, productId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public boolean deleteOrder(int OrderID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ORDER_SQL)) {
            statement.setInt(1, OrderID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateOrder(Order order) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ORDER_SQL)) {
            statement.setString(1, order.getOrderDate());
            statement.setString(2, order.getRequiredDate());
            statement.setFloat(3, order.getTotal_amount());
            statement.setString(4, order.getShippedDate());
            statement.setFloat(5, order.getShippingCost());
            statement.setString(6, order.getShipAddress());
            statement.setInt(7, order.getShipPostalCode());
            statement.setInt(8, order.getQuantity());
            statement.setBoolean(9, order.getOrderStatus());
            statement.setInt(10, order.getCartId());
            statement.setInt(11, order.getAdminId());
            statement.setInt(12, order.getCustomerId ());
            statement.setInt(13, order.getBillingId());
            statement.setInt(14, order.getShipperId());
            statement.setInt(14, order.getProductId());
            statement.setInt(16, order.getOrderID());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    

   
}