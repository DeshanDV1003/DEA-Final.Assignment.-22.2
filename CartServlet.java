package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CartDAO;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import model.Cart;

@WebServlet(name="CartServlet", urlPatterns={"/"})
public class CartServlet extends HttpServlet {

    private CartDAO cartDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "/add":
                    addToCart(request, response);
                    break; 
                case "/remove":
                    removeFromCart(request, response);
                    break;
                case "/update":
                    updateCartItemQuantity(request, response);
                    break;
                case "/viewCart":
                    viewCartItems(request,response);
                    break;
                default:
                   response.sendRedirect("error.jsp");
                    break;
            }
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        if (cartDAO.isProductInCart(productId)) {
           
            response.getWriter().println("<script>alert('Product is already in the cart');</script>");
            response.sendRedirect("cart.jsp");
            return;
        }

        
        Cart cartItem = new Cart(quantity, productId);
       cartDAO.addToCart(cartItem);
       viewCartItems(request, response);
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        cartDAO.removeFromCart(cartId);
        response.sendRedirect("cart.jsp");
    }

    private void updateCartItemQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int cartId = Integer.parseInt(request.getParameter("cartId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartDAO.updateCartItemQuantity(cartId, quantity);
        response.sendRedirect("cart.jsp");
    }

   
    private void viewCartItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int customerId = 1;
    List<Cart> cartItems = cartDAO.getCartItemsByCustomerId(customerId);
    request.setAttribute("cartItems", cartItems);
    request.getRequestDispatcher("cart.jsp").forward(request, response);
}
        
    
}
