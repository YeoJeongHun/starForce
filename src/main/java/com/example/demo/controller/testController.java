package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.apsol_result;
import com.example.demo.dto.starforce_result;
import com.example.demo.service.testService;
import com.example.demo.util.apsolStarforce;
import com.example.demo.util.suparialStarforce;

@Controller
public class testController {

	@Autowired
	private testService testservice;

	@RequestMapping("mpaUsr/home/test")
	@ResponseBody
	public int dbtest() {
		int test = testservice.dbtest();
		System.out.println((int) (Math.random() * 100));

		return test;
	}

	@RequestMapping("/mpaUsr/home/suparial")
	public String suparialTest(HttpServletRequest req) {

		return "mpaUsr/home/suparial";
	}

	@RequestMapping("/mpaUsr/home/starforceAJAX")
	@ResponseBody
	public Map<String, Object> starforce(HttpServletRequest req, double meso, int star, int fail_stack,
			boolean starcatch_bi, double meso_used, int original_stat, int original_power, int broken) {
		Map<String, Object> map = new HashMap<>();
		double starcatch;
		if (starcatch_bi)
			starcatch = 1.05;
		else
			starcatch = 1.0;

		starforce_result result = suparialStarforce.start(meso, star, fail_stack, starcatch, original_stat,
				original_power);

		meso_used += result.getMeso_used();
		if (result.getResult().equals("장비파괴")) {
			broken++;
		}

		map.put("result", result.getResult());
		map.put("meso", result.getChange());
		map.put("star", result.getResult_star());
		map.put("fail_stack", result.getFail_stack());
		map.put("meso_used", meso_used);
		map.put("meso_need", result.getMeso_need());
		map.put("stat", result.getStat());
		map.put("power", result.getPower());
		map.put("broken", broken);

		System.out.printf("성공률 : %.2f | 누적메소 : %.2f억 | STAR : %d | 결과 : %s\n", result.getSuccess_persent(),
				meso_used / 100000000, result.getResult_star(), result.getResult());

		return map;
	}

	@RequestMapping("/mpaUsr/home/apsolAJAX")
	@ResponseBody
	public Map<String, Object> apsolAJAX(HttpServletRequest req, double meso, int star, int fail_stack, double discount,
			boolean starcatch_bi, boolean defense_bi, double meso_used, int original_stat, int original_power,
			boolean gloves, int broken) {
		Map<String, Object> map = new HashMap<>();
		double starcatch, defense;
		if (starcatch_bi)
			starcatch = 1.05;
		else
			starcatch = 1.0;
		if (defense_bi)
			defense = 2.0;
		else
			defense = 1.0;

		apsol_result result = apsolStarforce.start(meso, star, fail_stack, discount, starcatch, defense, original_stat,
				original_power, gloves);
		meso_used += result.getMeso_used();
		if (result.getResult().equals("장비파괴")) {
			broken++;
		}

		map.put("result", result.getResult());
		map.put("meso", result.getChange());
		map.put("star", result.getResult_star());
		map.put("fail_stack", result.getFail_stack());
		map.put("success_persent", result.getSuccess_persent());
		map.put("meso_need", result.getMeso_need());
		map.put("meso_used", meso_used);
		map.put("stat", result.getStat());
		map.put("power", result.getPower());
		map.put("broken", broken);

		System.out.printf("성공률 : %.2f | 누적메소 : %.2f억 | STAR : %d | 결과 : %s\n", result.getSuccess_persent(),
				meso_used / 100000000, result.getResult_star(), result.getResult());

		return map;
	}

}
