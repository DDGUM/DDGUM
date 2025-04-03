package com.k21cnt.nvs.lesson10.service;
import com.k21cnt.nvs.lesson10.dto.EmployeeDTO;
import com.k21cnt.nvs.lesson10.entity.Employee;
import com.k21cnt.nvs.lesson10.repository.EmployeeRepository;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.naming.NamingEnumeration;
import java.util.List;
import java.util.Optional;
@Service
@NoArgsConstructor

public class EmployeeService {
    private EmployeeRepository employeeRepository;
    @Autowired
    public EmployeeService(EmployeeRepository employeeRepository){
        this.employeeRepository = employeeRepository;
    }
    public List<Employee> fillAll(){
        return employeeRepository.findAll();
    }
    public Optional<EmployeeDTO> findById(Long id){
        Employee employee = employeeRepository.findById(id).orElse(null);
        EmployeeDTO employeeDTO = new EmployeeDTO();
        employeeDTO.setId(id);
        employeeDTO.setFullName(employee.getFullName());
        employeeDTO.setEmail(employee.getEmail());
        employeeDTO.setPhone(employee.getPhone());
        employeeDTO.setAddress(employee.getAddress());
        employeeDTO.setBirthday(employee.getBirthday());
        employeeDTO.setStatus(employee.isStatus());
        return Optional.of(employeeDTO);
    }
    public Boolean save(EmployeeDTO employeeDTO){
        Employee employee = new Employee();
        employee.setFullName(employeeDTO.getFullName());
        employee.setEmail(employeeDTO.getEmail());
        employee.setPhone(employeeDTO.getPhone());
        employee.setAddress(employeeDTO.getAddress());
        employee.setBirthday(employeeDTO.getBirthday());
        employee.setStatus(employeeDTO.isStatus());
        try {
            employeeRepository.save(employee);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public Employee updatedEmployeeById(Long id, EmployeeDTO updatedEmployee){
        return employeeRepository.findById(id).map(employee -> {
            employee.setFullName(updatedEmployee.getFullName());
            employee.setEmail(updatedEmployee.getEmail());
            employee.setPhone(updatedEmployee.getPhone());
            employee.setAddress(updatedEmployee.getAddress());
            employee.setBirthday(updatedEmployee.getBirthday());
            employee.setStatus(updatedEmployee.isStatus());
            return employeeRepository.save(employee);
        }).orElseThrow(() -> new IllegalArgumentException("Invalid student ID: " + id));
    }
    public void deleteEmployee(Long id){
        employeeRepository.deleteById(id);
    }
}
