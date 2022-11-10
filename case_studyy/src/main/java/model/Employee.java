package model;

import java.util.Date;

public class Employee {
    private int id;
    private String name;
    private String dayOfBirth;
    private String idCard;
    private double salary;
    private String phoneNumber;
    private String email;
    private String address;
    private int positonId;
    private int educationDegreeId;
    private int divisionId;
    private String userName;

    public Employee() {
    }

    public Employee(int id, String name, String dayOfBirth, String idCard, double salary, String phoneNumber, String email, String address, int positonId, int educationDegreeId, int divisionId, String userName) {
        this.id = id;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.idCard = idCard;
        this.salary = salary;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.positonId = positonId;
        this.educationDegreeId = educationDegreeId;
        this.divisionId = divisionId;
        this.userName = userName;
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

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPositonId() {
        return positonId;
    }

    public void setPositonId(int positonId) {
        this.positonId = positonId;
    }

    public int getEducationDegreeId() {
        return educationDegreeId;
    }

    public void setEducationDegreeId(int educationDegreeId) {
        this.educationDegreeId = educationDegreeId;
    }

    public int getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
