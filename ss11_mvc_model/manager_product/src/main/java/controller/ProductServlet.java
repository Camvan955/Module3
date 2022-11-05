package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                break;

            default:
                break;
        }
    }


    private void edit(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        String name = request.getParameter("name");
        String origin = request.getParameter("origin");
        Double price = Double.valueOf(request.getParameter("price"));
        product.setName(name);
        product.setOrigin(origin);
        product.setPrice(price);
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String origin = request.getParameter("origin");
        Double price = Double.valueOf(request.getParameter("price"));

        Product product = new Product(id, name, origin, price);
        productService.add(product);
        request.setAttribute("mess", "Thêm mới thành công!");
//        try {
//            response.sendRedirect("product");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        try {
            request.getRequestDispatcher("view/product/create.jsp").forward(request, response);
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
                showFormCreate(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
            default:
                showListProduct(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Product product = productService.searchProduct(name);
        if (product != null) {
            request.setAttribute("product", product);
        } else {
            request.setAttribute("mess", "No product with name");
            try {
                request.getRequestDispatcher("view/product/search.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("view/product/viewList.jsp").forward(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

