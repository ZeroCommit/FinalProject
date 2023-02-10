<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - 회원정보 수정 :::</title>
</head>

 	<!-- kakao 도로명주소 찾기 api -->
	<script src = "https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	
<style>
    .proName {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
        text-decoration: none;
        color: black;
        float: right;
         margin-bottom: 10px;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    
    .zzim-form {
        margin-left: 100px;
        margin-right: 100px;
        margin-top: 50px;
        display: flex;
    }
    
    .sidebar {
        width: 100%;
        height: 600px;
        width: 200px;
        position: sticky;
        top: 50px;
    }
    
    .sidebar ul {
        padding: 0;
        margin-top: 40px;
    }
    
    .sidebar ul li {
        list-style: none;
        margin-top: 20px;
    }
    
    .sidebar ul li a {
        text-decoration: none;
        color: #999;
    }
    
    .sidebar ul li a:hover {
        color: black;
    }
    
  /*   .zzim-container {
        width: 100%;
        position: relative;
        margin-left: 50px;
    } */
    
    .btn-delete {
        width: 100px;
        height: 35px;
        font-size: 16px;
        background-color: white;
        border: 1px solid #999;
        border-radius: 10px;
    }
    
    .btn-delete:hover {
        background-color: black;
        color: #fff;
    }
    
    .check-input {
        border-radius: 0.25em;
        width: 16;
        height: 16;
    }
    
    /* 드롭다운 css */
    #browsers {
        background-color: white;
        border: 1px solid gray;
        border-radius: 6px;
        padding: 0.2em 0.2em 0.2em 0.2em;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    /* 선택금액표시 div */
    .allprice-container {
        border: 4px solid black;
        text-align: center;
        margin-top: 50;
    }
    
    .allprice-content {
        display: inline-block;
        margin: 0 auto;
        vertical-align: top;
    }
    
    .allprice-form {
        padding: 20px 15px 18px;
        line-height: 17px;
        color: #555;
        text-align: center;
    }
    
    .all-plus {
        margin: 0 11px 0 10px;
        /* vertical-align: -4px; */
    }
    
    .allprice-form i {
        padding: 0 4px 0 5px;
        font: 700 17px/17px tahoma;
        color: #111;
    }
    
    .allprice-form
    .final-price {
        color: red;
        font-size: 20px;
    }
    
 /*    .zzimandprice button {
        width: 400;
        height: 50;
        margin: 30;
        margin-top: 70;
        border-radius: 6px;
        font-size: 19;
    } */
    
/*     .btn-zzim {
        background-color: #999;
        color: white;
        border: 1px solid #999;
    }
    
    .btn-zzim:hover {
        background: black;
    } */
    
    .btn-buy {
        color: #fff;
        background-color: #dc3545;
        border: 1px solid #dc3545;
    }
    
    .btn-buy:hover {
        background-color: #bb2d3b;
    }
    </style>
    
    <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section class="zzim-form">
        <div>
            <div class="sidebar">
                <h4>
                    <strong>마이페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/mypage/bookingList">예매내역</a></li>
                    <li><a href="${path }/mypage/zzim">찜한 전시회</a></li>
                    <li><a href="${path }/mypage/myQna">나의 문의</a></li>
                    <li><a href="${path }/mypage/faq">FAQ</a></li>
                    <br>
                    <br>
                    <li><h5><b>내정보</b></h5></li>
                    <li><a href="${path }/mypage/updateMember">회원정보 수정</a></li>
                    <li><a href="${path }/mypage/changePw">비밀번호 변경</a></li>
                    <li><a href="${path }/mypage/secession">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

<main>	

<h2 class="mt-5">정보수정</h2>
	<form action="${path }/mypage/updateMember.do" class="mt-5">
		<p class="text">아이디</p>
	   	<input type="text" name="memberId" id="memberId"  class="form-control" value="${loginMember.memberId }"
	   		readonly>
		
		<br/>
	   	<p class="text">이름</p>
	   	<input type="text" name="memberName" id="memberName" class="form-control" value="${loginMember.memberName }" required><br>
	   	
	   	<p class="text">생년월일</p>
	   	<input type="text" name="birthday" id="birthday" class="form-control" placeholder="ex) 19920101" value="${loginMember.birthday }" maxlength="8" required><br>
	        
	
	   	<p class="text">주소</p>
	    <input type="text" class="text" name="addr1" id="addr1" placeholder="우편번호"readonly="readonly">
        <input type="button" onclick="execPostCode()"   class="btn btn-secondary"  value="우편번호 찾기"><br>
	            <input type="text" class="form-control" name="addr2" id="addr2"  placeholder="도로명주소"readonly="readonly">
	            <input type="text" name="address" id="addr3" class="form-control" placeholder="상세주소" required><br>
	            <span id="guide" style="color:#999;display:none"></span>
	            <br/>
	         
	 	<div id="contents"> 
			<p class="text">이메일</p> 
			<input type="text" id="email" name="email" class="form-control" placeholder="Email" value="${loginMember.email }" required/>  
			 &nbsp; 
			<button type="button" id="emailChk" class="btn btn-outline-dark">인증</button><br> 
			<p id="emch" class="check"> </p><br/>
			<p class="text">인증번호</p>  
			<input type="text" id="email2" name="email2" class="form-control" placeholder="인증번호" required>
			 &nbsp;   
			<button type="button" id="enterBtn2" class="btn btn-outline-dark">확인</button> 	
	        </div>
	        <p id="emch2" class="check"> </p>	 
	        <br/>
	        
	        <div id="contents"> 
			<p class="text">휴대폰번호</p> 
			<input type="text" id="to" name="phone" class="form-control" placeholder="Phone" value="${loginMember.phone }" required/>  
			 &nbsp; 
			<button type="button" id="send" class="btn btn-outline-dark">인증</button><br> 
			<p id="phonech" class="check"> </p><br/>
			<p class="text">인증번호</p>  
			<input type="text" id="userNum" class="form-control" placeholder="인증번호" required>
			 &nbsp;   
			<button type="button" id="enterBtn" class="btn btn-outline-dark">확인</button> 	
	        </div>	 
	        <p id="phonech2" class="check"> </p><br/>
	        <hr class="mb-4">
	        
	        <br/>
	          <button type="submit" id="btn-Yes" class="btn btn-lg btn-dark btn-block">정보 수정</button>
	          <button type="submit" id="btn-No" class="btn btn-lg btn-dark btn-block">수정 취소</button>
	        <br>
	        <br>
	
	</form>

<script>
	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>