package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;


public class ProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "hiruni";

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (Product_Name, Product_description, Unit_Price, Unit_weight, UnitsInStock, RecorderLevel, picture, Category_id, Supplier_id, Admin_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM product WHERE ProductID=?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM product";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM product WHERE ProductID=?";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE product SET Product_Name=?, Product_description=?, Unit_Price=?, Unit_weight=?, UnitsInStock=?, RecorderLevel=?, picture=?, Category_id=?, Supplier_id=?, Admin_id=? WHERE ProductID=?";

    public ProductDAO() {
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

    public void insertProduct(Product product) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getProduct_name());
            preparedStatement.setString(2, product.getProduct_description());
            preparedStatement.setFloat(3, product.getUnit_price());
            preparedStatement.setFloat(4, product.getUnit_weight());
            preparedStatement.setInt(5, product.getUnits_inStock());
            preparedStatement.setInt(6, product.getRecorderLevel());
            preparedStatement.setBlob(7, product.getPicture());
            preparedStatement.setInt(8, product.getCategory_id());
            preparedStatement.setInt(9, product.getSupplier_id());
            preparedStatement.setInt(10, product.getAdmin_id());
            preparedStatement.executeUpdate();
        }
    }

    public Product selectProduct(int product_id) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, product_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String product_name = rs.getString("Product_Name");
                String product_description = rs.getString("Product_description");
                Float unit_price = rs.getFloat("Unit_Price");
                Float unit_weight = rs.getFloat("Unit_weight");
                int units_inStock = rs.getInt("UnitsInStock");
                int recorderLevel = rs.getInt("RecorderLevel");
                Blob picture = rs.getBlob("picture");
                int category_id = rs.getInt("Category_id");
                int supplier_id = rs.getInt("Supplier_id");
                int admin_id = rs.getInt("Admin_id");
                product = new Product(product_id, product_name, product_description, unit_price, unit_weight, units_inStock, recorderLevel, picture, category_id, supplier_id, admin_id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Product> selectAllProducts() {
        List<Product> product = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("ProductID");
                String product_name = rs.getString("Product_Name");
                String product_description = rs.getString("Product_description");
                Float unit_price = rs.getFloat("Unit_Price");
                Float unit_weight=rs.getFloat("Unit_weight");
                int units_inStock=rs.getInt("UnitsInStock");
                int recorderLevel=rs.getInt("RecorderLevel");
                Blob picture=rs.getBlob("picture");
                int category_id=rs.getInt("Category_id");
                int supplier_id=rs.getInt("Supplier_id");
                int admin_id=rs.getInt("Admin_id");
                product.add(new Product(product_id,product_name,product_description,unit_price,unit_weight, units_inStock,recorderLevel,picture,category_id,supplier_id,admin_id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public boolean deleteProduct(int product_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, product_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1, product.getProduct_name());
            statement.setString(2, product.getProduct_description());
            statement.setFloat(3, product.getUnit_price());
            statement.setFloat(4, product.getUnit_weight());
            statement.setInt(5, product.getUnits_inStock());
            statement.setInt(6, product.getRecorderLevel());
            statement.setBlob(7, product.getPicture());
            statement.setInt(8, product.getCategory_id());
            statement.setInt(9, product.getSupplier_id());
            statement.setInt(10, product.getAdmin_id());
            statement.setInt(11, product.getProduct_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
