<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<script>

function starforce_suparial(btn) {
	var supa_meso = $('#supa_meso').val();
	var supa_star = $('#supa_star').val();
	var supa_fail_stack = $('#supa_fail_stack').val();
	var supa_starcatch_bi = $('#supa_starcatch').prop('checked');
	var supa_meso_used = $('#supa_meso_used').val();
	var supa_original_stat = $('#supa_original_stat').val();
	var supa_original_power = $('#supa_original_power').val();
	var supa_broken = $('#supa_broken').val()
	
	$.ajax(
			{
				type : 'POST',
				url : '/mpaUsr/home/starforceAJAX',
				data : {
					meso : supa_meso,
					star : supa_star,
					fail_stack : supa_fail_stack,
					starcatch_bi : supa_starcatch_bi,
					meso_used : supa_meso_used,
					original_stat : supa_original_stat,
					original_power : supa_original_power,
					broken : supa_broken
				},
				dataType : 'json',
				success : function(data) {
					if(data.result == '장비파괴'){
						alert('장비 파괴 됨 ㅗㅗㅗㅗㅗㅗ');
						$('#supa_fail_stack').remove();
						$('#supa_fail_re').append('<input type=\"hidden\" id=\"supa_fail_stack\" value=\"' + 0 + '\">');
						$('#supa_meso_used').remove();
						$('#supa_meso_used_re').append('<input type=\"hidden\" id=\"supa_meso_used\" value=\"'+ data.meso_used + '\" />');
						$('#supa_broken').remove();
						$('#supa_broken_re').append('<input type=\"hidden\" id=\"supa_broken\" value=\"'+ data.broken + '\" />');
						$('#supa_meso').remove();
						$('#supa_meso_re').append('<input id=\"supa_meso\" value=\"'+ data.meso + '\" />');
						$('#supa_star').remove();
						$('#supa_star_re').append('<input id=\"supa_star\" value=\"'+ 0 + '\" />');
						$('#supa_result_msg').text(data.result);
						$('#supa_meso_used_write').text(data.meso_used);
						$('#supa_meso_need').text(data.meso_need);
						$('#supa_result_power').text(data.power);
						$('#supa_result_stat').text(data.stat);
						$('#supa_result_star').text(data.star + ' 성');
						$('#supa_broken_stack').text(data.broken + ' 번');
					}
					else{
						$('#supa_fail_stack').remove();
						$('#supa_fail_re').append('<input type=\"hidden\" id=\"supa_fail_stack\" value=\"' + data.fail_stack + '\">');
						$('#supa_meso_used').remove();
						$('#supa_meso_used_re').append('<input type=\"hidden\" id=\"supa_meso_used\" value=\"'+ data.meso_used + '\" />');
						$('#supa_broken').remove();
						$('#supa_broken_re').append('<input type=\"hidden\" id=\"supa_broken\" value=\"'+ data.broken + '\" />');
						$('#supa_meso').remove();
						$('#supa_meso_re').append('<input id=\"supa_meso\" value=\"'+ data.meso + '\" />');
						$('#supa_star').remove();
						$('#supa_star_re').append('<input id=\"supa_star\" value=\"'+ data.star + '\" />');
						$('#supa_result_msg').text(data.result);
						$('#supa_meso_used_write').text(data.meso_used);
						$('#supa_meso_need').text(data.meso_need);
						$('#supa_result_power').text(data.power);
						$('#supa_result_stat').text(data.stat);
						$('#supa_result_star').text(data.star + ' 성');
						$('#supa_broken_stack').text(data.broken + ' 번');
					}
				},
			}).fail(function(data) {
		alert('실패');
	});
	return false;
}
function starforce_apsol(btn) {
	var apsol_meso = $('#apsol_meso').val();
	var apsol_star = $('#apsol_star').val();
	var apsol_fail_stack = $('#apsol_fail_stack').val();
	var apsol_discount = $('#apsol_discount').val();
	var apsol_starcatch_bi = $('#apsol_starcatch').prop('checked');
	var apsol_depense_bi = $('#apsol_depense').prop('checked');
	var apsol_meso_used = $('#apsol_meso_used').val();
	var apsol_original_stat = $('#apsol_original_stat').val();
	var apsol_original_power = $('#apsol_original_power').val();
	var apsol_broken = $('#apsol_broken').val();
	var apsol_gloves = false;
	
	if($('#apsol_gloves').val()==1){
		apsol_gloves=true;
	}
		
	$.ajax(
			{
				type : 'POST',
				url : '/mpaUsr/home/apsolAJAX',
				data : {
					meso : apsol_meso,
					star : apsol_star,
					fail_stack : apsol_fail_stack,
					discount : apsol_discount,
					starcatch_bi : apsol_starcatch_bi,
					depense_bi : apsol_depense_bi,
					meso_used : apsol_meso_used,
					original_stat : apsol_original_stat,
					original_power : apsol_original_power,
					gloves : apsol_gloves,
					broken : apsol_broken
				},
				dataType : 'json',
				success : function(data) {
					if(data.result == '장비파괴'){
						alert('장비 파괴 됨 ㅗㅗㅗㅗㅗㅗ');
						$('#apsol_fail_stack').remove();
						$('#apsol_fail_re').append('<input type=\"hidden\" id=\"apsol_fail_stack\" value=\"' + 0 + '\">');
						$('#apsol_meso_used').remove();
						$('#apsol_meso_used_re').append('<input type=\"hidden\" id=\"apsol_meso_used\" value=\"'+ data.meso_used + '\" />');
						$('#apsol_broken').remove();
						$('#apsol_broken_re').append('<input type=\"hidden\" id=\"apsol_broken\" value=\"'+ data.broken + '\" />');
						$('#apsol_meso').remove();
						$('#apsol_meso_re').append('<input id=\"apsol_meso\" value=\"'+ data.meso + '\" />');
						$('#apsol_star').remove();
						$('#apsol_star_re').append('<input id=\"apsol_star\" value=\"'+ 12 + '\" />');
						$('#apsol_result_msg').text(data.result);
						$('#apsol_meso_need').text(data.meso_need);
						$('#apsol_meso_used_write').text(data.meso_used);
						$('#apsol_result_power').text(data.power);
						$('#apsol_result_stat').text(data.stat);
						$('#apsol_result_star').text(data.star + ' 성');
						$('#apsol_broken_stack').text(data.broken + ' 번');
					}
					else{
						$('#apsol_fail_stack').remove();
						$('#apsol_fail_re').append('<input type=\"hidden\" id=\"apsol_fail_stack\" value=\"' + data.fail_stack + '\">');
						$('#apsol_meso_used').remove();
						$('#apsol_meso_used_re').append('<input type=\"hidden\" id=\"apsol_meso_used\" value=\"'+ data.meso_used + '\" />');
						$('#apsol_broken').remove();
						$('#apsol_broken_re').append('<input type=\"hidden\" id=\"apsol_broken\" value=\"'+ data.broken + '\" />');
						$('#apsol_meso').remove();
						$('#apsol_meso_re').append('<input id=\"apsol_meso\" value=\"'+ data.meso + '\" />');
						$('#apsol_star').remove();
						$('#apsol_star_re').append('<input id=\"apsol_star\" value=\"'+ data.star + '\" />');
						$('#apsol_result_msg').text(data.result);
						$('#apsol_meso_need').text(data.meso_need);
						$('#apsol_meso_used_write').text(data.meso_used);
						$('#apsol_result_power').text(data.power);
						$('#apsol_result_stat').text(data.stat);
						$('#apsol_result_star').text(data.star + ' 성');
						$('#apsol_broken_stack').text(data.broken + ' 번');
					}
				},
			}).fail(function(data) {
		alert('실패');
	});
	return false;
}
</script>

<div style="margin: 0 auto; width: 100%; display: flex;">
	<div style="width: 70%; display: left; border: 1px solid red">
		<h2>앱솔 장비 내장비 상태 입력</h2>
		<span id="apsol_fail_re"><input type="hidden" id="apsol_fail_stack" value="0"></span>
		<span id="apsol_meso_used_re"><input type="hidden" id="apsol_meso_used" value="0" /></span>
		<span id="apsol_broken_re"><input type="hidden" id="apsol_broken" value="0" /></span>
		<div>
			메소 보유량 : <span id="apsol_meso_re"><input id="apsol_meso" value="10000000000" /></span>
		</div>
		<div>
			필요 메소 : <span id="apsol_meso_need">0</span>
		</div>
		<div>
			내 장비 0성 스탯 : <span id="apsol_original_stat_re"><input id="apsol_original_stat" value="0" /></span>
		</div>
		<div>
			내 장비 0성 공마 : <span id="apsol_original_poser_re"><input id="apsol_original_power" value="0" /></span>
		</div>
		<div>
			장비 구분 : 
			<span id="apsol_starcatch_re">
				<select id="apsol_gloves">
					<option value="0">모자</option>
					<option value="0">견장</option>
					<option value="1">장갑</option>
					<option value="0">망토</option>
					<option value="0">신발</option>
					<option value="0">한벌옷</option>
				</select>
			</span>
		</div>
		<div>
			현재 강화 : <span id="apsol_star_re"><input id="apsol_star" value="0" /></span>
		</div>
		<div>
			할인 적용 : 
			<span id="apsol_discount_re">
				<select id="apsol_discount">
					<option value="1">할인없음 0%</option>
					<option value="1.03">mvp실버 -> 3%</option>
					<option value="1.05">mvp골드 -> 5%</option>
					<option value="1.1">mvp다이아, 레드 -> 10%</option>
					<option value="1.3">30프로 이벤트 -> 30%</option>
				</select>
			</span>
		</div>
		<div>
			스타 캐치 : <span id="apsol_starcatch_re"><input id="apsol_starcatch" type="checkbox" value="1" /></span>
		</div>
		<div>
			파괴 방지 : <span id="apsol_depense_re"><input id="apsol_depense" type="checkbox" value="1" /></span>
		</div>
		<div>
			강화 결과 : <span id="apsol_result_msg"></span>
		</div>
		<div><a class="btn btn-sm btn-primary" onclick="starforce_apsol(this)">강화 버튼</a></div>

	</div>
	<div style="width: 30%; display: right; border: 1px solid blue">
		강화 결과
		<div>
			스타포스 : <span id="apsol_result_star"></span>
		</div>
		<div>
			강화 결과 주스탯 : <span id="apsol_result_stat"></span>
		</div>
		<div>
			강화 결과 공마 : <span id="apsol_result_power"></span>
		</div>
		<div>
			장비 파괴 횟수 : <span id="apsol_broken_stack"></span>
		</div>
		<div>
			누적 메소 : <span id="apsol_meso_used_write"></span>
		</div>
	</div>
</div>

<div style="margin: 0 auto; width: 100%; display: flex;">
	<div style="width: 70%; display: left; border: 1px solid red">
		<h2>탈벨 내 장비 상태 입력</h2>
		<span id="supa_meso_used_re"><input type="hidden" id="supa_meso_used" value="0" /></span>
		<span id="supa_fail_re"><input type="hidden" id="supa_fail_stack" value="0"></span>
		<span id="supa_broken_re"><input type="hidden" id="supa_broken" value="0" /></span>
		<div>
			메소 보유량 : <span id="supa_meso_re"><input id="supa_meso" value="10000000000" /></span>
		</div>
		<div>
			필요 메소 : <span id="supa_meso_need">0</span>
		</div>
		<div>
			내 장비 0성 스탯 : <span id="supa_original_stat_re"><input id="supa_original_stat" value="0" /></span>
		</div>
		<div>
			내 장비 0성 공마 : <span id="supa_original_poser_re"><input id="supa_original_power" value="0" /></span>
		</div>
		<div>
			현재 강화 : <span id="supa_star_re"><input id="supa_star" value="0" /></span>
		</div>
		<div>
			스타 캐치 : <span id="supa_starcatch_re"><input id="supa_starcatch" type="checkbox" value="1" /></span>
		</div>
		<div>
			강화 결과 : <span id="supa_result_msg"></span>
		</div>
		<div><a class="btn btn-sm btn-primary" onclick="starforce_suparial(this)">강화 버튼</a></div>

	</div>
	<div style="width: 30%; display: right; border: 1px solid blue">
		강화 결과
		<div>
			스타포스 : <span id="supa_result_star"></span>
		</div>
		<div>
			강화 결과 주스탯 : <span id="supa_result_stat"></span>
		</div>
		<div>
			강화 결과 공마 : <span id="supa_result_power"></span>
		</div>
		<div>
			장비 파괴 횟수 : <span id="supa_broken_stack"></span>
		</div>
		<div>
			누적 메소 : <span id="supa_meso_used_write"></span>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>