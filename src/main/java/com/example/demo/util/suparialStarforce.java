package com.example.demo.util;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.dto.starforce_result;

public class suparialStarforce {
	static double[] success_persentage = { 50, 50, 45, 40, 40, 40, 40, 40, 40, 37, 35, 35, 3, 2, 1 };
	static double[] broke_persentage = { 100, 100, 100, 100, 100, 97, 95, 93, 90, 85, 80, 75, 50, 50, 50 };
	static long mesoForForce = 55832200;
	static int[] stat = { 0, 19, 39, 61, 86, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115, 115 };
	static int[] power = { 0, 0, 0, 0, 0, 0, 9, 19, 30, 42, 55, 70, 87, 106, 127, 150 };
	
	public static starforce_result start(double meso, int star, int fail_stack, double starcatch, int original_stat, int original_power) {
		double chance = (int) (Math.random() * 100);
		starforce_result result = new starforce_result();
		result.setSuccess_persent(success_persentage[star] * starcatch);

		if (meso < mesoForForce) {
			result.setResult("메소부족");
			result.setChange(meso);
			result.setFail_stack(fail_stack);
			result.setResult_star(star);
			result.setMeso_need(mesoForForce);
			result.setMeso_used(0);
			result.setStat(original_stat + stat[star]);
			result.setPower(original_power + power[star]);
			return result;
		}

		if (fail_stack > 1) {
			result.setResult("2번 실패로 확정 강화성공 적용");
			result.setChange(meso - mesoForForce);
			result.setFail_stack(0);
			result.setResult_star(star + 1);
			result.setMeso_need(mesoForForce);
			result.setMeso_used(mesoForForce);
			result.setStat(original_stat + stat[star+1]);
			result.setPower(original_power + power[star+1]);
			return result;
		}

		if (chance < success_persentage[star] * starcatch) {
			result.setResult("강화성공");
			result.setChange(meso - mesoForForce);
			result.setFail_stack(0);
			result.setResult_star(star + 1);
			result.setStat(original_stat + stat[star+1]);
			result.setPower(original_power + power[star+1]);
		} else if (chance >= success_persentage[star] * starcatch && chance < broke_persentage[star]) {
			result.setResult("강화실패");
			result.setChange(meso - mesoForForce);
			result.setFail_stack(fail_stack + 1);
			if (star < 1) {
				result.setResult_star(0);
				result.setStat(original_stat + stat[0]);
				result.setPower(original_power + power[0]);
			} else {
				result.setResult_star(star - 1);
				result.setStat(original_stat + stat[star-1]);
				result.setPower(original_power + power[star-1]);
			}
		} else {
			result.setResult("장비파괴");
			result.setChange(meso - mesoForForce);
			result.setFail_stack(0);
			result.setResult_star(0);
			result.setStat(original_stat + stat[0]);
			result.setPower(original_power + power[0]);
		}
		result.setMeso_need(mesoForForce);
		result.setMeso_used(mesoForForce);

		return result;
	}

}
