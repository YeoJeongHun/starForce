package com.example.demo.util;

import com.example.demo.dto.apsol_result;
import com.example.demo.dto.starforce_result;

public class apsolStarforce {
	static double[] success_persentage = { 95.0, 90.0, 85.0, 85.0, 80.0, 75.0, 70.0, 65.0, 60.0, 55.0, 45.0, 35.0, 30.0,
			30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 3.0, 2.0, 1.0 };
//	static double[] success_persentage = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	static double[] broke_persentage = { 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0,
			100.0, 99.3, 98.6, 98.6, 97.9, 97.9, 97.9, 97.2, 97.2, 93.0, 93.0, 80.6, 70.6, 60.4 };
//	static double[] broke_persentage = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	static double[] mesoForForce = { 164800, 328700, 492500, 656400, 820200, 984000, 1147900, 1311700, 1475600, 1639400,
			6639400, 8397300, 10422900, 12731500, 15338200, 36514500, 43008300, 50185100, 58072700, 66698700, 76090000,
			86273300, 97274600, 109120000, 121834900 };
	static int[] stat = {0, 2, 4, 6, 8, 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40, 53, 66, 79, 92, 105, 118, 131, 131,
			131, 131 };
	static int[] power = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 21, 33, 46, 60, 75, 92, 111, 132, 155 };
	static int[] power_gloves = {0, 0, 0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 6, 7, 17, 28, 40, 53, 67, 82, 99, 118, 139,
			162 };

	public static int getPlusPower(int original_power, int star, boolean gloves) {
		if (gloves) {
			return original_power + power_gloves[star] + (original_power + power_gloves[star]) / 50;
		} else {
			return original_power + power[star] + (original_power + power[star]) / 50;
		}
	}

	public static apsol_result start(double meso, int star, int fail_stack, double discount, double starcatch,
			double defense, int original_stat, int original_power, boolean gloves) {
		// discount는 mvp와 30프로 할인 이벤트 등으로 값 변동
		// starcatch는 성공률에 1.05곱한 값으로 적용
		// defense는 비용 2배 적용
		double chance = Math.random() * 100;
		apsol_result result = new apsol_result();
		result.setSuccess_persent(success_persentage[star] * starcatch);

		if (meso < mesoForForce[star] * discount) {
			result.setResult("메소부족");
			result.setChange(meso);
			result.setFail_stack(fail_stack);
			result.setResult_star(star);
			result.setMeso_need(mesoForForce[star] * discount);
			result.setStat(original_stat + stat[star]);
			result.setPower(getPlusPower(original_power, star, gloves));
			return result;
		}

		if (fail_stack > 1) {
			result.setResult("2번 실패로 확정 강화성공 적용");
			result.setChange(meso - mesoForForce[star] * discount);
			result.setMeso_used(mesoForForce[star] * discount);
			result.setFail_stack(0);
			result.setResult_star(star + 1);
			result.setMeso_need(mesoForForce[star + 1] * discount);
			result.setStat(original_stat + stat[star+1]);
			result.setPower(getPlusPower(original_power, star+1, gloves));
			return result;
		}

		if (chance < success_persentage[star] * starcatch) {
			result.setResult("강화성공");
			result.setChange(meso - mesoForForce[star] * discount * defense);
			result.setFail_stack(0);
			result.setResult_star(star + 1);
			result.setMeso_need(mesoForForce[star + 1] * discount);
			result.setStat(original_stat + stat[star+1]);
			result.setPower(getPlusPower(original_power, star+1, gloves));
		} else if (chance >= success_persentage[star] * starcatch && chance < broke_persentage[star]) {
			result.setResult("강화실패");
			result.setChange(meso - mesoForForce[star] * discount * defense);
			if (star <= 10 || star == 15 || star == 20) {
				result.setFail_stack(0);
				result.setResult_star(star);
				result.setMeso_need(mesoForForce[star] * discount);
				result.setStat(original_stat + stat[star]);
				result.setPower(getPlusPower(original_power, star, gloves));
			} else {
				result.setFail_stack(fail_stack + 1);
				result.setResult_star(star - 1);
				result.setMeso_need(mesoForForce[star - 1] * discount);
				result.setStat(original_stat + stat[star-1]);
				result.setPower(getPlusPower(original_power, star-1, gloves));
			}
		} else {
			result.setResult("장비파괴");
			result.setChange(meso - mesoForForce[star] * discount);
			result.setFail_stack(0);
			result.setResult_star(12);
			result.setMeso_need(mesoForForce[star] * discount);
			result.setStat(original_stat + stat[12]);
			result.setPower(getPlusPower(original_power, 12, gloves));
		}
		result.setMeso_used(mesoForForce[star] * discount);

		return result;
	}
}
