<h2 id="Spring-boot-project">Spring-boot-project v1.0</h2>

<h2 id="documents">Documents</h2>

<p>Spring-boot Framework 기반의  Sing Page Appliaction  프로젝트</p>

<ol>
<li>Spring Data JPA  H2 DB연동</li>
<li>Spring Data JPA  Pageable 사용하여 페이징, 정렬 처리</li>
<li>Controller 기반 예외처리 @ExceptionHandler 사용</li>
<li>Random 함수, 아스키코드 사용하여 쿠폰번호 생성</li>
<li>Clinet 는 Jquery 사용하여  REST API 호출 </li>
<li>View 는 JSP 환경 설정</li>
<li>Junit TEST 구현</li>
</ol>

<h2 id="project-build">Project build</h2>

<p>github : <a href="https://github.com/minsu9250/spring-boot-project">https://github.com/minsu9250/spring-boot-project</a> <br>
import : github URL clone -&gt; Gradle (STS) Project -&gt; BuildModel</p>

<h2 id="gradle-setting">Gradle setting</h2>

<p>gradle:</p>

<p>compile(‘org.springframework.boot:spring-boot-starter-data-jpa’) <br>
compile(‘org.springframework.boot:spring-boot-starter-jdbc’) <br>
compile(‘org.springframework.boot:spring-boot-starter-web’) <br>
compile(‘com.h2database:h2’) <br>
runtime(‘mysql:mysql-connector-java’) <br>
providedRuntime(‘org.springframework.boot:spring-boot-starter-tomcat’) <br>
testCompile(‘org.springframework.boot:spring-boot-starter-test’) <br>
compile(‘org.apache.tomcat.embed:tomcat-embed-jasper’) <br>
compile(‘javax.servlet:jstl:1.2’) <br>
compile(‘org.webjars:jquery-ui:1.11.4’) <br>
compile(‘org.webjars:bootstrap:3.3.5’)</p>

<h2 id="execute">Execute</h2>

<p><a href="http://localhost:8080/kakao/index">http://localhost:8080/kakao/index</a></p>

<ul>
<li>해당 URL 접속 -&gt; 이메일 입력 -&gt; 목록 확인</li>
</ul>

<p><a href="http://localhost:8080/console/">http://localhost:8080/console/</a></p>

<ul>
<li>해당 URL 접속 -&gt; DB 저장 데이터 확인</li>
</ul>

<h2 id="table">Table</h2>

<table>
<thead>
<tr>
  <th>id</th>
  <th>email</th>
  <th>coupon</th>
  <th>regDate</th>
</tr>
</thead>
<tbody><tr>
  <td>1</td>
  <td>xxx@nate.com</td>
  <td>xxxx-xxxx-1234-xxxx</td>
  <td>2018-03-29T01:28:04.875+0000</td>
</tr>
<tr>
  <td>2</td>
  <td>xxx@naver.com</td>
  <td>xxxx-1234-xxxx-xxxx</td>
  <td>2018-03-29T01:28:04.875+0000</td>
</tr>
<tr>
  <td>3</td>
  <td>xxx@daum.net</td>
  <td>1234-xxxx-xxxx-xxxx</td>
  <td>2018-03-29T01:28:04.875+0000</td>
</tr>
</tbody></table>
