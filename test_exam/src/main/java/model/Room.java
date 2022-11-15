package model;

public class Room {
    private int id;
    private String name;
    private String phoneNumber;
    private String rentalDay;
    private int idPay;
    private String namePay;
    private String note;

    public Room() {
    }

    public Room(int id, String name, String phoneNumber, String rentalDay, int idPay, String namePay, String note) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.rentalDay = rentalDay;
        this.idPay = idPay;
        this.namePay = namePay;
        this.note = note;
    }

    public Room(int id, String name, String phoneNumber, String rentalDay, String namePay, String note) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.rentalDay = rentalDay;
        this.namePay = namePay;
        this.note = note;
    }

    public Room(String name, String phoneNumber, String rentalDay, int idPay, String note) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.rentalDay = rentalDay;
        this.idPay = idPay;
        this.note = note;
    }

    public String getNamePay() {
        return namePay;
    }

    public void setNamePay(String namePay) {
        this.namePay = namePay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRentalDay() {
        return rentalDay;
    }

    public void setRentalDay(String rentalDay) {
        this.rentalDay = rentalDay;
    }

    public int getIdPay() {
        return idPay;
    }

    public void setIdPay(int idPay) {
        this.idPay = idPay;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
