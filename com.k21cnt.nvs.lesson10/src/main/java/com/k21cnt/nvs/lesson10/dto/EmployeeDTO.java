package com.k21cnt.nvs.lesson10.dto;
import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EmployeeDTO {
    private Long id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private LocalDate birthday;
    private boolean status;
}