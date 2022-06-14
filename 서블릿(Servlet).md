# 서블릿(Servlet)

* Server + Applet의 합성어로 JAVA언어를 이용하여 사용자의 요청을 받아 처리하고 그 결과를 다시 사용자에게 전송하는 역할의 Class파일을 말함 즉 웹에서 동적인 페이지를 java로 구현한 서버 측 프로그램

---

* __서블릿 동작 구조__

  * 클라이언트 <-> 웹서버 <-> 서블릿 컨테이너 <->서블릿객체

    * __서블릿 컨테이너__ : 웹 서버 또는 응용 프로그램 서버의 일부로, 웹 서버에서 온 요청을 받아 서블릿 class를 관리하는 역할(생명주기)

      컨테이너의 서블릿에 대한 설정은  __Deployment Descriptor(web.xml)__ 파일 이용

      

## 배포 서술자

​	배포 서술자(DD, Deployment Descriptor)는 애플리케이션에 대한 전체 설정 정보를 가지고 있는 파일을 말하며 이 정보를 가지고 웹 컨테이너가 서블릿 구동, xml파일로 요소(태그)로 이루어져 있음 애플리케이션 폴더의 WEB-INF 폴더에 web.xml파일이 배포 서술자

* 설정 정보
  *  Servlet 정의, Servlet 초기화 파라미터
  *  Session 설정 파라미터
  *  Servlet/JSP 매핑, MIME type 매핑
  *  보안 설정
  *  Welcome file list 설정
  *  에러 페이지 리스트, 리소스, 환경 변수

* 파일 세부내용
  * < web-app > : 루트 속성, 문법 식별자 및 버전 정보를 속성 값으로 설정
  * < context-param > : 웹 애플리케이션에서 공유하기 위한 파라미터 설정
  * < mime-mapping > : 특정 파일 다운로드 시 파일이 깨지는 현상 방지
  * < servlet > ~ < servlet-class > /< servlet-mapping > : 서블릿 매핑
  * < servlet > ~ < servlet-class > : 컨테이너에 서블릿 설정
  * < welcome-file-list > : 시작 페이지 설정
  * < filter > : 필터 정보 등록
  * < error-page > : 에러 발생 시 안내 페이지 설정
  * < session-config> : session 기간 설정
  * < listener> : 이벤트 처리 설정(6가지)

---

__서블릿 매핑__

* 예시

  ```xml
  <servlet>
  <servlet-name>mapping 명칭</servlet-name>
  <servlet-class>실제 클래스 명칭</servlet-class>
  </servlet>
  <servlet-mapping>
  <servlet-name>mapping 명칭</servlet-name>
  <url-pattern>사용자 접근 명칭</url-pattern>
  </servlet-mapping>
  ```

  

__서블릿 메소드__

* __doGet__
  * client에서 데이터 전송 방식을 get방식으로 전송하면 호출되는 메소드
* __doPost__
  * client에서 데이터 전송 방식을 post방식으로 전송하면 호출되는 메소드 	
    *  반드시 ServletException 처리 해야 함

---

# JSTL(JSP Standard Tag Library)

**JSP 페이지 내에서 [자바](https://ko.wikipedia.org/wiki/자바_(프로그래밍_언어)) 코드를 바로 사용하지 않고 로직을 내장하는 효율적인 방법을 제공하는 라이브러리**

* Core (c) : 변수, 반복문, 조건, 페이지 이동
* Formatting (fmt) : 숫자, 날짜, 시간을 포메팅
* DataBase (sql)
* Xml (x)
* Function (fn)

```jsp
JSTL을 사용하기 위한 설정
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

```



---

# ajax

- `Ajax`는 Asynchronous JavaScript and XML의 약자로, 말 그대로 JavaScript와 XML을 이용한 비동기적 정보 __교환 기법__이다.
  - 웹페이지내에서 새로고침을 하지않고 로그인 부분만 바꿔줄때 주로 사용 한다.

```javascript
<script type="text/javascript">
    $.ajax({
    url: "//url",
    method: "GET",
    dataType: "JSON",
    success: function(data) {
        $("#content").html(data);
    },error: function(){
        alert("실패");
    }
})
</script>
```
