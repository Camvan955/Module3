package controller;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")

public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                saveCustomer(request, response);
                break;
            case "delete":
                removerCustomer(request, response);

        }

    }

    private void removerCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = customerService.removeCustomer(id);
        String mess = "Xoá không thành công";
        if(check){
            mess = "Xóa thành công";
        }
        request.setAttribute("mess",mess);
        showCustomerList(request,response);
    }

    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = new Customer(name, birthday, gender, idCard, phoneNumber, email, address, customerTypeId);

        boolean check = customerService.addCustomer(customer);
        String mess;
        if (check) {
            mess = "Thêm mới thành công";
        } else {
            mess = "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/customer/add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
            default:
                showCustomerList(request, response);
        }
    }


    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAllCustomer();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/customer/add.isp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
