
package com.nguyen.demo.service;

import com.nguyen.demo.entities.Customer;
import java.util.List;


public interface CustomerServiceIF {
    public List <Customer> getCustomers();
    public void saveCustomer(Customer theCustomer);
    public Customer getCustomer(int theId);
    public void deleteCustomer(int theId);
}
