<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<script>

function starforce(btn) {
	var meso = $('#meso').val();
	var star = $('#star').val();
	var fail_stack = $('#fail_stack').val();
	var test = 1;
	
	$.ajax(
			{
				type : 'POST',
				url : '/mpaUsr/home/starforceAJAX',
				data : {
					meso : meso,
					star : star,
					fail_stack : fail_stack
				},
				dataType : 'json',
				success : function(data) {
					if(data.result == '장비파괴'){
						alert('장비 파괴 됨 ㅗㅗㅗㅗㅗㅗ');
					}
					$('#fail_stack').remove();
					$('#fail_re').append('<input type=\"hidden\" id=\"fail_stack\" value=\"' + data.fail_stack + '\">');
					$('#meso').remove();
					$('#meso_re').append('<input id=\"meso\" value=\"'+ data.meso + '\" />');
					$('#star').remove();
					$('#star_re').append('<input id=\"star\" value=\"'+ data.star + '\" />');
					$('#result_msg').text(data.result);
				},
			}).fail(function(data) {
		alert('실패');
	});
	return false;
}
</script>

<div style="margin: 0 auto; width: 80%; display: flex;">
	<div style="width: 30%; display: left; border: 1px solid red">
		<h2>내 장비 상태 입력</h2>
		<span id="fail_re"><input type="hidden" id="fail_stack" value="0"></span>
		<div>
			메소 보유량 : <span id="meso_re"><input id="meso" value="1" /></span>
		</div>
		<div>
			현재 강화 : <span id="star_re"><input id="star" value="4" /></span>
		</div>
		<div>
			강화 결과 : <div id="result_msg"></div>
		</div>
		<div><a onclick="starforce(this)">강화 버튼</a></div>

	</div>
	<div style="width: 70%; display: right; border: 1px solid blue">
		강화 결과
		<div>
		a
		</div>
		<div>
		b
		</div>
		<div>
		c
		</div>
		<div>
		d
		</div>
		<div>
		e
		</div>
		
	</div>



</div>

<%@ include file="../common/foot.jspf"%>