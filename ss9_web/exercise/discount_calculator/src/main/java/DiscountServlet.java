import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display_discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("productDescription");
        float price = Float.parseFloat(request.getParameter("listPrice"));
        int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));

        float discountAmount = (price * discountPercent * 0.01f);
        float discountPrice = price - discountAmount;

// cach 1
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Discount Amount:" + discount_amount + "<h1>");
//        writer.println("<h1>Discount Price:" + discount_price + "<h1>");
//        writer.println("</html>");

        request.setAttribute("result01",productDescription);
        request.setAttribute("result02",price);
        request.setAttribute("result03",discountPercent);

        request.setAttribute("result1", discountAmount);
        request.setAttribute("result2", discountPrice);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
