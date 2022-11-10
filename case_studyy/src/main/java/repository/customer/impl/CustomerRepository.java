package repository.customer.impl;

import model.Customer;
import repository.BaseRepository;
import repository.customer.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (name, day_of_birth, gender, id_card, phone_number, email, address, customer_type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CUSTOMER_SQL = "SELECT * FROM customer";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM customer WHERE id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE CUSTOMER SET name = ? ,day_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ?, customer_type_id = ? WHERE id = ?;";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customer WHERE id = ?";
    private static final String SEARCH_CUSTOMER_BY_NAME = "SELECT * FROM customer WHERE name LIKE ?;";

    @Override
    public List<Customer> findAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("day_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, customerTypeId);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }

    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getBirthday());
            ps.setBoolean(3, customer.isGender());
            ps.setString(4, customer.getIdCard());
            ps.setString(5, customer.getPhoneNumber());
            ps.setString(6, customer.getEmail());
            ps.setString(7, customer.getAddress());
            ps.setInt(8, customer.getCustomerTypeId());

            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removeCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER_SQL);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editCustomer(int id, Customer customer) {
        return false;
    }

    @Override
    public Customer findByID(int id) {
        return null;
    }

    @Override
    public List<Customer> searchByName(String name) {
        return null;
    }
}
