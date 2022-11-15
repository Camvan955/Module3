package service.impl;

import model.Room;
import repository.IRoomRepository;
import repository.iml.RoomRepository;
import service.IRoomService;

import java.util.List;

public class RoomService implements IRoomService {

    private IRoomRepository roomRepository = new RoomRepository();
    @Override
    public List<Room> findAllRoom() {
        return roomRepository.findAllRoom();
    }

    @Override
    public boolean addRoom(Room room) {
        return roomRepository.addRoom(room);
    }

    @Override
    public boolean removerRoom(int id) {
        return roomRepository.removerRoom(id) ;
    }

    @Override
    public boolean editRoom(int id, Room room) {
        return false;
    }

    @Override
    public List<Room> search(String name) {
        return roomRepository.search(name);
    }

    @Override
    public Room findById(int id) {
        return null;
    }
}
