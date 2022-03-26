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
					<li><a onclick="contentAdd('${path}/user')">사용자관리</a></li>
					<li><a onclick="contentAdd('${path}/dept')">부서관리</a></li>
					</c:if>
					
					<li><a  href="elements.html">게시판</a></li>
					<li><span class="opener" >전자결재</span>
						<ul>
							<li><a onclick="contentAdd('${path}/signdetail')"  >기안하기</a></li>
							<li><a onclick="contentAdd('${path}/signListTobe')" >결재받을(은)문서</a></li>
							<!--                                     <li><a href="#">결재할(한)문서</a></li> -->
						</ul>
				</ul>
		</nav>
		
		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>

	</div>
</div>