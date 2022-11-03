import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "20-08-1983", "Hà Nội", "https://media-cdn-v2.laodong.vn/storage/newsportal/2022/10/17/1105949/Jisoo.jpg?w=800&crop=auto&scale=both"));
        customerList.add(new Customer("Nguyễn Văn Nam", "20-08-1983", "Bắc Giang", "https://image.thanhnien.vn/w1024/Uploaded/2022/lxwpcqjwp/2022_08_08/mono-35-33.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "20-08-1983", "Huế", "https://static.wixstatic.com/media/63c1da_7e0ea530cc76418088010b69f0c0b04c~mv2.jpg/v1/crop/x_9,y_0,w_2983,h_3000/fill/w_323,h_325,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/sunhuyn.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "20-08-1983", "Đà Nẵng", "https://baoquocte.vn/stores/news_dataimages/yennguyet/072022/05/14/song-luan-ban-gai-se-duoc-giu-het-luong-chi-can-phat-toi-tien-an-sang.jpg?rt=20220705144418"));
        customerList.add(new Customer("Nguyễn Đình Thi", "20-08-1983", "Hà Nội", "https://baoquocte.vn/stores/news_dataimages/yennguyet/072022/05/14/song-luan-ban-gai-se-duoc-giu-het-luong-chi-can-phat-toi-tien-an-sang.jpg?rt=20220705144418"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
