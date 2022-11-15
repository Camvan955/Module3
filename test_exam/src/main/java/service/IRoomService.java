package service;

import model.Room;

import java.util.List;

public interface IRoomService {
    List<Room> findAllRoom();

    boolean addRoom(Room room);

    boolean removerRoom(int id);

    boolean editRoom(int id, Room room);

    List<Room> search(String name);

    Room findById(int id);
}
