package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;



public class CartDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_CART_ITEM_SQL = "INSERT INTO cart (numOfProducts, totalPrice,Customer_Id,Product_Id) VALUES (?, ?, ?,?)";
    private static final String SELECT_CART_ITEM_BY_ID = "SELECT * FROM cart WHERE CartId=? AND Customer_Id=? AND product_Id=?";
    private static final String SELECT_ALL_CART_ITEM = "SELECT * FROM cart";
    private static final String DELETE_CART_ITEM_SQL = "DELETE FROM cart WHERE CartId=? AND Customer_Id=? AND product_Id=?";
    private static final String UPDATE_CART_ITEM_SQL = "UPDATE cart SET numOfProducts=?, totalPrice=?, WHERE CartId=? AND Customer_Id=? AND product_Id=?";

    public CartDAO() {
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

    public void insertCartItem(Cart cart) throws SQLException {
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM_SQL)) {
            preparedStatement.setInt(1, cart.getNumOfProducts());
            preparedStatement.setFloat(2, cart.getTotalPrice());
            preparedStatement.setInt(3, cart.getCutomerId());
            preparedStatement.setInt(4, cart.getProductId());
            preparedStatement.executeUpdate();
        }
    }

    public Cart selectCartItem(int cartId, int productId, int customerId) {
        Cart cart = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEM_BY_ID)) {
            preparedStatement.setInt(1, cartId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int numOfProducts = rs.getInt("NumofProducts");
                float totalPrice = rs.getFloat("Total_Price");
                customerId=rs.getInt("Customer_Id");
                productId=rs.getInt("product_Id");
                cart = new Cart(numOfProducts,totalPrice,customerId,productId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public List<Cart> selectAllCartItems() {
        List<Cart> cart = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CART_ITEM)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int cartId = rs.getInt("CartId");
                int numOfProducts=rs.getInt("NumofProducts");
                float totalPrice=rs.getFloat("Total_Price");
                int customerId=rs.getInt("Customer_Id");
                int productId=rs.getInt("product_Id");
                cart.add(new Cart(cartId,numOfProducts,totalPrice,customerId,productId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public boolean deleteProduct(int cartId,int productId, int customerId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CART_ITEM_SQL)) {
            statement.setInt(1, cartId);
            statement.setInt(2, productId);
            statement.setInt(3,customerId);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCartItem(Cart cart) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CART_ITEM_SQL)) {
            statement.setInt(1, cart.getNumOfProducts());
            statement.setFloat(2,cart.getTotalPrice());
            statement.setInt(3, cart.getCutomerId());
            statement.setInt(4,cart.getProductId());
            statement.setInt(5,cart.getCartId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}