
package com.nguyen.demo.repository;

import com.nguyen.demo.entities.Customer;
import org.springframework.data.repository.CrudRepository;


public interface CustomerRepositoryIF extends CrudRepository<Customer, Integer> {
    
}
