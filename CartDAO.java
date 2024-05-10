package dao;

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
    private String jdbcPassword = "hiruni";

    private static final String INSERT_CART_ITEM = "INSERT INTO cart (NumofProducts, Total_Price, Customer_Id, Product_Id) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_CART_ITEM = "SELECT * FROM cart";
    private static final String DELETE_CART_ITEM = "DELETE FROM cart WHERE CartId = ?";
    private static final String UPDATE_CART_ITEM_QUANTITY = "UPDATE cart SET NumofProducts = ? WHERE CartId = ?";
    private static final String SELECT_CART_ITEMS_BY_CUSTOMER = "SELECT * FROM cart WHERE Customer_Id = ?";

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

    public void addToCart(Cart cartItem) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART_ITEM)) {
            preparedStatement.setInt(1, cartItem.getNumOfProducts());
            preparedStatement.setFloat(2, cartItem.getTotalPrice());
            preparedStatement.setInt(3, cartItem.getCustomer_Id());
            preparedStatement.setInt(4, cartItem.getProductId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeFromCart(int cartId) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ITEM)) {
            preparedStatement.setInt(1, cartId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCartItemQuantity(int cartId, int quantity) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_ITEM_QUANTITY)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, cartId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cart> getCartItemsByCustomerId(int customerId) {
        List<Cart> cartItems = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_ITEMS_BY_CUSTOMER)) {
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int cartId = resultSet.getInt("CartId");
                int numOfProducts = resultSet.getInt("NumofProducts");
                float totalPrice = resultSet.getFloat("Total_Price");
                int productId = resultSet.getInt("Product_Id");
               Cart cartItem = new Cart(cartId, numOfProducts, totalPrice, customerId, productId);
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public boolean isProductInCart(int productId) {
        boolean productExists = false;
    String query = "SELECT * FROM cart WHERE Product_Id = ?";

    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        preparedStatement.setInt(1, productId);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            productExists = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return productExists;
       
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
}
