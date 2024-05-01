package mypackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a list of items by fetching from the database
        List<Item> items = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();

            // Prepare SQL statement to fetch items from the database
            String sql = "SELECT * FROM items"; // Update with your table name
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // Iterate through the result set and populate the items list
            while (resultSet.next()) {
                String itemName = resultSet.getString("item_name"); // Update with your column names
                int quantity = resultSet.getInt("quantity"); // Update with your column names
                double price = resultSet.getDouble("price"); // Update with your column names
                items.add(new Item(itemName, quantity, price));
                
            }
        } catch (SQLException e) {
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
            }
        }

        // Set the list of items as a request attribute
        request.setAttribute("cartItems", items);

        // Forward the request to cart.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }

    // Inner class representing an item
    private static class Item {
        private String itemName;
        private int quantity;
        private double price;

        public Item(String itemName, int quantity, double price) {
            this.itemName = itemName;
            this.quantity = quantity;
            this.price = price;
        }

        // Getters and setters (if needed) can be added here
        public String getItemName() {
            return itemName;
        }

        public void setItemName(String itemName) {
            this.itemName = itemName;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }
    }
}
