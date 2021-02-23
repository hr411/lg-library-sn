test - spring legacy project

# 개발환경
- 개발언어 : jdk 1.8
- 프레임워크 : Spring Framework 3.1.1
- 템플릿: spring legacy project
- IDE : sts 4 with spring tool 3 add-on)
- 빌드도구 : maven 3.6.3
- WAS : apache tomcat 9.0
- 데이터베이스 : mariadb server 10
- ORM : myBatis 3.4.5
- UI : HTML,jQuery, css3 


# 디렉토리 구조
```
- src/main
  |- java/com/mycompany/proj001
    |- home                           * home 컴포넌트(legacy 샘플)
    |- login                          * login 컴포넌트
    |  |- controller 
    |  |- dao
    |  |- model
    |  `- service
    `- posts                          * posts 컴포넌트
       |- controller 
       |- dao
       |- model
       `- service
  |- resources
  |  |- mapper/mariadb
  |  |  |- login
  |  |  |  `- loginMapper.xml         * login mapper 파일
  |  |  `- posts
  |  |     `- postsMapper.xml         * posts mapper 파일
  |  `- mybatisAlias.xml              * mybatis 약어
  `- webapp
    |- resources
    |  |- css                         * css 파일
    |  |- images                      * images 파일
    |  `- js                          * js 파일
    `- WEB-INF
      |- spring
      |  |- sppServlet
      |  |  `- servlet-context.xml    * servlet 설정파일
      |  |- db-context.xml            * db 설정파일
      |  `- root-context.xml          * context-param의 메인 설정파일
      |- views                        * 화면 파일
      `- web.xml                      * tomcat 설정 파일
```

# 실행 방법
- 프로젝트를 STS4 워크스페이스에 임포트
- 프로젝트 프로퍼티 설정
  - java complier 설정 > 1.8
  - project facets 설정
    - dynamic web module : 3.1
    - java : 1.8
- tomcat 9.0 설치 및 IDE와 연결
- Server 에서 Add and Remove로 프로젝트와 연결
- server.xml context path 설정 "/"로 변경
- tomcat 실행
- 브라우저에서 localhost:8080 접속
