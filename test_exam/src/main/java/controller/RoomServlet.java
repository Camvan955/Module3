package controller;

import model.Room;
import service.IRoomService;
import service.impl.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RoomServlet", urlPatterns = "/room")
public class RoomServlet extends HttpServlet {

    private IRoomService roomService = new RoomService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                saveRoom(request, response);
                break;
            case "delete":
                removeRoom(request, response);
                break;
            case "search":
                searchRoom(request, response);
                break;
        }
    }

    private void searchRoom(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Room> roomList = roomService.search(name);

        request.setAttribute("roomList", roomList);
        request.setAttribute("search", name);

        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void removeRoom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = roomService.removerRoom(id);
        String mess = "Xóa không thành công";
        if(check){
            mess = "Xóa thành công";
        }
        request.setAttribute("mess", mess);
        showRoomList(request,response);
    }

    private void saveRoom(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String rentalDay = request.getParameter("rentalDay");
        int idPay = Integer.parseInt(request.getParameter("idPay"));
        String note = request.getParameter("note");

        Room room = new Room(name, phoneNumber, rentalDay, idPay, note);

        boolean check = roomService.addRoom(room);
        String mess="Thêm mới không thành công";
        if (check) {
            mess = "Thêm mới thành công";
        }
        request.setAttribute("mess", mess);

        try {
            request.getRequestDispatcher("add.jsp").forward(request,response);
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
                showAddRoom(request, response);
            default:
                showRoomList(request, response);
        }
    }

    private void showAddRoom(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showRoomList(HttpServletRequest request, HttpServletResponse response) {
        List<Room> roomList = roomService.findAllRoom();
        request.setAttribute("roomList", roomList);
        try {
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
