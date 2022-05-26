# JSP(Java Server Pages)

* __Servlet/JSP__
  * __Server-client Model__ : 서버는 특정한 서비스를 제공하는 컴퓨터를, 클라이언트는 이러한 서비스를 이용하는 사용자를 말한다.
* __Web통신 구조__
  * Client(서비스 사용자) <-> Web Server(HTML) <-> WAS(JSP/Servlet) <-> Database(데이터 관리 서버)

---

* __Web Server__ : 사용자에게 HTML페이지나 jpg, png같은 이미지를 HTTP프로토콜을 통해 웹 브라우저에 제공하는 서버로 내부의 내용이 이미 만들어져 있는 정적 인 요소들을 화면에 보여주는 역할을 한다.
  * __종류__  
    * __Apache__ : Apache Software Foundation에서 만든 서버로 HTTP통신에 대한 여러 라이브러리 제공
    * __Windows IIS__ : Window OS에서 제공하는 웹 서버로 높은 수준의 보안성과 성능 제공
    * __NGINX__ : 무료 오픈 소스 서버로 사용자 요청을 스레드가 아닌 확 장성이 있는 이벤트 기반 설계로 리소스만 할당해 사용

---

* __WAS__ : Web Application Server의 약자로 사용자가 요청한 서비스의 결과를 스크립트 언어 등으로 가공하여 생성한 동적인 페이지를 사용자에게 보여주는 역할
  * __종류__
    * __tomcat__ : Apache Software Foundation에서 Servlet과 JSP를 통한 동적인 웹 문서를 처리하기 위해 만든 웹 애플리케이션 서버
    * __wildfly__ : Jboss라고도 불리며 톰캣이 제공하는 Servlet Container 뿐만 아니라 EJB Container를 별도로 제공하여 폭 넓은 서비스 구현
    * __jeus__ : 국산 WAS, 대용량 데이터 트랜잭션을 고성능으로 처리하며 개발 및 운영에 관한 기술 지원이 뛰어나다.

---

* __서블릿 컨테이너(Servlet-Container)__
  * 서블릿의 생명 주기 관리(생성, 초기화, 소멸), HttpServletRequest/  HttpResponse객체 생성, 요청에 따라 멀티 스레딩 구성, 전송 방식에 따라 동적으로 페이지 구성하는 작업 진행, __정적 로딩 처리__

* __JSP 컨테이너(JSP-Container)__
  * JSP파일을 다시 java코드로 변경해주고 class파일로 전환하여 메모리 공간에 로드한 뒤 실행 가능하게 만드는 작업 진행(Servlet화),  처리 결과를 HTML파일로 만들어주는 작업 진행, __동적 로딩 처리__

---

* __Servlet vs JSP__

  |          |        __servlet__        |              __JSP__               |
  | :------: | :-----------------------: | :--------------------------------: |
  | __형태__ | Java코드에 HTML코드 삽입  |      HTML코드에 Java코드 삽입      |
  | __예시__ |  out.println("<HTML>");   | <% for(int k = 0; k < 10; k++){ %> |
  | __특징__ | Business 로직 처리에 적합 |       화면 로직 처리에 적합        |

  

* __JSP Elements 표기법__

  |    __태그__     |   __표기법__   |
  | :-------------: | :------------: |
  |   Commentstag   | <%-- 주석 --%> |
  |  Directive tag  | <%@ 지시자 %>  |
  | Declaration tag | <%! 선언문 %>  |
  |  Scriptlet tag  |   <% 코드 %>   |
  | Expression tag  | <%= 표현식 %>  |

  

* __JSP 내장 객체 종류__

  | __내장 객체 명__ |                __설명__                 |
  | :--------------: | :-------------------------------------: |
  |     request      |    HttpServletRequest 객체 참조 변수    |
  |     response     |   HttpServletResponse 객체 참조 변수    |
  |       out        |        JspWriter 객체 참조 변수         |
  |     session      |       HttpSession 객체 참조 변수        |
  |   application    |      ServletContext 객체 참조 변수      |
  |       page       |     현재 JSP페이지에 대한 참조 변수     |
  |    exception     | 발생하는 Throwable객체에 대한 참조 변수 |



* __JSP 내장 객체 영역__

  |  __영역__   |                  __설명__                  |
  | :---------: | :----------------------------------------: |
  |    page     | 하나의 JSP페이지를 처리할 때 사용되는 영역 |
  |   request   |   하나의 요청을 처리할 때 사용되는 영역    |
  |   session   |       하나의 브라우저와 관련된 영역        |
  | application |    하나의 웹 애플리케이션과 관련된 영역    |

  application > session > request > page

---

* __jsp기본 설정__

```js
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 
    
    ~~~
```

---



* __Request 주요 메소드__

  |      __메소드 명__       |                         __설정__                          |
  | :----------------------: | :-------------------------------------------------------: |
  |    getParameter(name)    |                  name 파라미터의 값 리턴                  |
  | getParameterValues(name) |    name 파라미터의 값을 배열 형태로 리턴(checkbox 등)     |
  |   getParameterNames()    |             요청에 포함된 파라미터 이름 리턴              |
  |       getMethod()        |                    현재 요청 방식 리턴                    |
  |       getSession()       |                    현재 세션 객체 리턴                    |
  |  setCharacterEncoding()  | 클라이언트에서 서버로 전달된 값을 지정한 문자 셋으로 변경 |

  

* __ Response 주요 메소드__

  |       __메소드 명__        |                      __설명__                      |
  | :------------------------: | :------------------------------------------------: |
  |     sendRedirect(url)      |   응답 결과를 요청으로 하여 지정된 url에 재전송    |
  | setStatus(int status_code) |  응답으로 전송될 상태 코드 설정, 성공은 200 / OK   |
  | sendError(int status_code) |   에러가 발생한 경우 응답 헤더에 상태 코드 설정    |
  |   setContentType(String)   | 서버에서 클라이언트로 전달될 값의 데이터 타입 설정 |

---

