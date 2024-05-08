package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;



public class CategoryDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/perfumelanka?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String INSERT_CATEGORY_SQL = "INSERT INTO category (Category_name, Category_Description, image, Admin_id) VALUES (?, ?, ?,?)";
    private static final String SELECT_CATEGORY_BY_ID = "SELECT * FROM category WHERE Category_id=?";
    private static final String SELECT_ALL_CATEGORIES = "SELECT * FROM category";
    private static final String DELETE_CATEGORY_SQL = "DELETE FROM category WHERE Category_id=?";
    private static final String UPDATE_CATEGORY_SQL = "UPDATE category SET Category_name=?, Category_Description=?,image=?, Admin_id=? WHERE Category_id=?";

    public CategoryDAO() {
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

    public void insertCategory(Category category) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {
            preparedStatement.setString(1, category.getCategory_name());
            preparedStatement.setString(2, category.getCategory_description());
            preparedStatement.setBlob(3, category.getImage());
            preparedStatement.setInt(4, category.getAdmin_id());
            preparedStatement.executeUpdate();
        }
    }

    public Category selectCategory(int category_id) {
        Category category = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID)) {
            preparedStatement.setInt(1, category_id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String category_name = rs.getString("Category_name");
                String category_description = rs.getString("Category_Description");
                Blob image= rs.getBlob("image");
                int admin_id =rs.getInt("Admin_id");
                category = new Category(category_id,category_name,category_description,image,admin_id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public List<Category> selectAllCategory() {
        List<Category> category = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int category_id = rs.getInt("Category_id");
                String category_name = rs.getString("Category_name");
                String category_description = rs.getString("Category_Description");
                Blob image=rs.getBlob("image");
                int admin_id=rs.getInt("Admin_id");
                category.add(new Category(category_id, category_name,category_description,image, admin_id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public boolean deleteCategory(int category_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CATEGORY_SQL)) {
            statement.setInt(1, category_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCategory(Category category) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY_SQL)) {
            statement.setString(1, category.getCategory_name());
            statement.setString(2, category.getCategory_description());
            statement.setBlob(3, category.getImage());
            statement.setInt(4,category.getAdmin_id());
            statement.setInt(5,category.getCategory_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}