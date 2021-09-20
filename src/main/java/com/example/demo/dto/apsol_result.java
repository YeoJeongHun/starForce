package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class apsol_result {
	private String result;
	private double change;
	private int result_star;
	private double fail_stack;
	private double success_persent;
	private double meso_need;
	private double meso_used;
	private int stat;
	private int power;
}
