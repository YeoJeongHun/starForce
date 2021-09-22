<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<%@ include file="simulationCSS.jspf" %>

<%@ include file="simulationScript.jspf" %>
<br/><br/><br/><br/>
<div id="main">
	<div class="container_main">
		<div class="search_main">
			<div class="search_main_top">
				<div class="search_main_top_division">
					<div>아이템구분</div>
					<div>
						<select id="apsol_discount">
							<option value="1">전체</option>
							<option value="1.03">장비</option>
							<option value="1.05">장신구</option>
							<option value="1.1">강화아이템</option>
						</select>
					</div>
				</div>
				<div class="search_main_top_part">
					<div>부위</div>
					<div>
						<select id="apsol_discount">
							<option value="1">전체</option>
							<option value="1.03">모자</option>
							<option value="1.05">상의</option>
							<option value="1.1">등등</option>
						</select>
					</div>
				</div>
				<div class="search_main_top_job">
					<div>직업</div>
					<div>
						<select id="apsol_discount">
							<option value="1">전체</option>
							<option value="1.03">전사</option>
							<option value="1.05">마법사</option>
							<option value="1.1">궁수</option>
							<option value="1.1">도적</option>
							<option value="1.1">해적</option>
						</select>
					</div>
				</div>
				<div class="search_main_top_level">
					<div>레벨</div>
					<span>
						<select id="apsol_discount">
							<option value="1">100</option>
							<option value="1.03">110</option>
							<option value="1.05">120</option>
							<option value="1.1">130</option>
							<option value="1.1">140</option>
							<option value="1.1">150</option>
							<option value="1.1">160</option>
							<option value="1.1">200</option>
						</select>
					</span>
					<span> ~ </span>
					<span>
						<select id="apsol_discount">
							<option value="1">100</option>
							<option value="1.03">110</option>
							<option value="1.05">120</option>
							<option value="1.1">130</option>
							<option value="1.1">140</option>
							<option value="1.1">150</option>
							<option value="1.1">160</option>
							<option value="1.1">200</option>
						</select>
					</span>
				</div>
				<div class="search_main_top_button"><a class="btn btn-sm btn-primary" onclick="#">검색</a></div>
			</div>
			<div class="search_main_bottom">
				<div class="search_main_bottom_list">목록</div>
				<div class="search_main_bottom_coast">가격</div>
				<div><div class="search_main_bottom_list_box">목록박스</div></div>
				<div><div class="search_main_bottom_coast_box">가격박스</div></div>
			</div>
		</div>
		<div class="buyANDsell_main">
			<div></div><div></div><div></div><div></div><div></div><div></div>
			<div class="buyANDsell_main_buy"><i class="fas fa-arrow-right"><br/>구매</i></div>
			<div class="buyANDsell_main_sell"><i class="fas fa-arrow-left"><br/>판매</i></div>
			<div></div><div></div>
		</div>
		<div class="inven_main">
			<div class="inven_top_menu">
				<div></div>
				<div class="inven_top_menu_1">장비</div>
				<div class="inven_top_menu_2">소비</div>
				<div class="inven_top_menu_3">캐시</div>
				<div></div>
			</div>
			<div class="inven_main_menu">
				<c:forEach var="i" begin="0" end="29">
					<div class="inven_main_menu_itembox"></div>
				</c:forEach>
			</div>
			<div class="inven_main_mesoANDcash">
				<div class="inven_main_mesoANDcash_meso">메소 : </div><div class="inven_main_mesoANDcash_meso1">100</div>
				<div class="inven_main_mesoANDcash_cash">캐시 : </div><div class="inven_main_mesoANDcash_cash1">1000</div>
			</div>
			<div class="inven_main_button">
				<div></div>
				<div class="inven_main_button_look">보기</div>
				<div class="inven_main_button_wear">장착</div>
				<div class="inven_main_button_power"><a onclick="test(this)">강화</a></div>
				<div></div>
			</div>
		</div>
		<div class="equip_main">
			<div class="equip_main_middle">
				<div class="equip_main_middle_box"></div><div class="equip_main_middle_box_hidden"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box_hidden"></div><div class="equip_main_middle_box"></div>
				<div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box_hidden"></div><div class="equip_main_middle_box"></div>
				<div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div>
				<div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div>
				<div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div>
				<div class="equip_main_middle_box_hidden"></div><div class="equip_main_middle_box_hidden"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div><div class="equip_main_middle_box"></div>
			</div>
			<div class="equip_main_button">
				<div></div>
				<div class="equip_main_button_look">보기</div>
				<div class="equip_main_button_takeoff">해제</div>
				<div></div>
			</div>
		</div>
		<div class="power_main">
			<div class="power_main_topmenu">
				<div class="power_main_topmenu_power">강화</div>
				<div class="power_main_topmenu_starforce">스타포스</div>
				<div class="power_main_topmenu_cube">큐브</div>
			</div>
			<div class="power_main_place">
				<div id="power_power_main">
				<div class="power_power_main" id="power_power_main_re">
					<div class="power_power_main_item">
						<div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div>
						<div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div><div class="power_power_main_item_box"></div>
					</div>
					<div class="power_power_main_home">
						<div class="power_power_main_home_myitem">내 아이템</div>
						<div class="power_power_main_home_result">강화 결과</div>
						<div class="power_power_main_home_power_button">강화 버튼</div>
						<div class="power_power_main_home_cancle_button">취소 버튼</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div>
			aaa
		</div>
		<div>
			종합
		</div>
	</div>



main
</div>

<%@ include file="../common/foot.jspf"%>