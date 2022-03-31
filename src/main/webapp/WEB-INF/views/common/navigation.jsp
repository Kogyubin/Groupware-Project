<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">

		<!-- Search -->
		<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
		</section>

		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				
				<h2>Menu</h2>
			</header>

				<ul>
					<c:if test='${sessionScope.session_id == "admin" }'>
					<li><span class="opener" >조직관리</span>
						<ul>
							<li><span><a onclick="contentAdd('${path}/user')">사원관리</a></span></li>
							<li><span><a onclick="contentAdd('${path}/dept')">부서관리</a></span></li>
						</ul>
					</c:if>
					
					<li><span><a onclick="contentAdd('${path}/boardlist')">게시판</a></span></li>
					<li><span class="opener" >전자결재</span>
						<ul>
							<li><span><a onclick="contentAdd('${path}/signdetail')"  >기안하기</a></span></li>
							<li><span><a onclick="contentAdd('${path}/signListTobe')" >결재받을(은)문서</a></span></li>
							<!--                                     <li><a href="#">결재할(한)문서</a></li> -->
						</ul>
					<li><span class="opener" >메일</span>
						<ul>
							<li><span><a onclick="contentAdd('${path}/MailForm')"  >새 메일</a></span></li>
							<li><span><a onclick="contentAdd('${path}/ReceiveMailRead')" >받은 메일</a></span></li>
							<!--                                     <li><a href="#">결재할(한)문서</a></li> -->
						</ul>	
				</ul>
		</nav>
		
		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; kitri group ware
			</p>
		</footer>

	</div>
</div>