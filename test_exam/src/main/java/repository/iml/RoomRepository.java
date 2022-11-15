package repository.iml;

import model.Room;
import repository.BaseRepository;
import repository.IRoomRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRepository implements IRoomRepository {
    private static final String SELECT_ROOM = "select room.* , payment_form.name as name_payment from room \n" +
            "join payment_form on room.id_pay = payment_form.id_pay;";
    private static final String INSERT_ROOM = "insert into room(name,phone_number, rental_day, id_pay,note) values(?,?,?,?,?);";
    private static final String DELETE_ROOM = "delete from room where id_pay=?;";


    @Override
    public List<Room> findAllRoom() {
        List<Room> roomList = new ArrayList<>();

        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOM);
        ) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id_room");
                String name = resultSet.getString("name");
                String phoneNumber = resultSet.getString("phone_number");
                String rentalDay = resultSet.getString("rental_day");
                String namePay = resultSet.getString("name_payment");
                String note = resultSet.getString("note");

                Room room = new Room(id, name, phoneNumber, rentalDay, namePay, note);
                roomList.add(room);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return roomList;
    }

    @Override
    public boolean addRoom(Room room) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_ROOM);
            ps.setString(1, room.getName());
            ps.setString(2, room.getPhoneNumber());
            ps.setString(3, room.getRentalDay());
            ps.setInt(4, room.getIdPay());
            ps.setString(5, room.getNote());

            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removerRoom(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_ROOM);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editRoom(int id, Room room) {
        return false;
    }

    @Override
    public List<Room> search(String name) {
        return null;
    }

    @Override
    public Room findById(int id) {
        return null;
    }
}
