package service.impl;

import model.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAllCustomer() {
        return customerRepository.findAllCustomer();
    }

    @Override
    public boolean addCustomer(Customer customer) {
        return customerRepository.addCustomer(customer);
    }

    @Override
    public boolean removeCustomer(int id) {
        return customerRepository.removeCustomer(id);
    }

    @Override
    public boolean editCustomer(int id, Customer customer) {
        return customerRepository.editCustomer(id, customer);
    }

    @Override
    public List<Customer> search(String name) {
        return customerRepository.search(name);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }
}
