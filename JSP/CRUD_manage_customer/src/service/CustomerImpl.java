package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerImpl implements CustomerService {
    private static Map<Integer, Customer> customers;
    private static void addFirstDatas() {
        customers = new HashMap<>();
        customers.put(1,new Customer(1,"Trung", "trungTran275@gmail.com", "12/6"));
        customers.put(2,new Customer(2,"Trung1", "trungTran2751@gmail.com", "12/61"));
        customers.put(3,new Customer(3,"Trung3", "trungTran2753@gmail.com", "12/63"));
    }
    public CustomerImpl(){
        addFirstDatas();
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }

}
