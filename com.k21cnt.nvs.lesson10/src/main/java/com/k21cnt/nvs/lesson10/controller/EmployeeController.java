package com.k21cnt.nvs.lesson10.controller;
import com.k21cnt.nvs.lesson10.dto.EmployeeDTO;
import com.k21cnt.nvs.lesson10.entity.Employee;
import com.k21cnt.nvs.lesson10.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
@Controller
@RequestMapping("/employees")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    public EmployeeController(EmployeeService employeeService){
        this.employeeService = employeeService;
    }
    @GetMapping
    public String getEmployees (Model model){
        model.addAttribute("employees", employeeService.fillAll());
        return "employees/employee-list";
    }
    @GetMapping("/add-new")
    public String addNewEmployee (Model model){
        model.addAttribute("employee", new Employee());
        return "employees/employee-add";
    }
    @GetMapping("/edit/{id}")
    public String showFormForUpdate(@PathVariable(value = "id") Long id, Model model){
        EmployeeDTO employee = employeeService.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid student Id:" + id));

        model.addAttribute("employee", employee);
        return "employees/employee-edit";
    }
    @PostMapping
    public String saveEmployee (@ModelAttribute("employee") EmployeeDTO employee){
        employeeService.save(employee);
        return "redirect:/employees";
    }
    @PostMapping ("/update/{id}")
    public String updateEmployee (@PathVariable(value = "id") Long id, @ModelAttribute("employee") EmployeeDTO employee){
        employeeService.updatedEmployeeById(id,employee);
        return "redirect:/employees";
    }
    @GetMapping("/delete/{id}")
    public String deleteEmployee (@PathVariable(value = "id") Long id){
        employeeService.deleteEmployee(id);
        return "redirect:/employees";
    }
}