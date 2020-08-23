/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nguyen.demo.controller;

import com.nguyen.demo.entities.Customer;
import com.nguyen.demo.service.CustomerServiceIF;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author XV
 */

/*localhost:8080/demo-spring-web-mvc/customer/list ==> tra ra man hinh list
                                            /showForm
                                            /save
                                            /update
                                            /delete         
*/
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerServiceIF customerService;

    @GetMapping(value = "/list")
    public String listCustomers(Model theModel) {
	List< Customer> customers = customerService.getCustomers();
//        PagedListHolder pagedListHolder = new PagedListHolder(customers);
//		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//		pagedListHolder.setPage(page);
//		pagedListHolder.setPageSize(5);
                
	theModel.addAttribute("pagedListHolder", customers);
                
	return "list-customer";
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model theModel) {
	Customer theCustomer = new Customer();
	theModel.addAttribute("customer", theCustomer);
	return "customer-form";
    }

    @PostMapping("/saveCustomer")
    @Transactional
    public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
	customerService.saveCustomer(theCustomer);
	return "redirect:/customer/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("customerId") int theId,
	    Model theModel) {
	Customer theCustomer = customerService.getCustomer(theId);
	theModel.addAttribute("customer", theCustomer);
	return "customer-form";
    }

    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("customerId") int theId) {
	customerService.deleteCustomer(theId);
	return "redirect:/customer/list";
    }
}
