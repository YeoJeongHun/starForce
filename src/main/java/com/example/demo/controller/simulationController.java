package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class simulationController {


	@RequestMapping("/")
	public String toMain() {
		return "redirect:/mpaUsr/simulation/simulation";
	}
	
	@RequestMapping("mpaUsr/simulation/simulation")
	public String main() {
		return "/mpaUsr/simulation/simulation";
	}
	
}
