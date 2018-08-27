# DHUStore
![导图](https://github.com/lmy1108/DHUStore/blob/master/image/graph.png)
## 2.1 前端技术
### 2.1.1 LayUI
layUI是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式。本项目使用了LayUI提供的后台框架进行本系统后台的架构，并使用大量LayUI组件，例如一些小图标等，用于完善系统功能，美化界面。
### 2.1.2 Bootstarp
本系统使用Bootstrap提供的HTML和CSS规范来优化前端界面。使用到其中的响应式布局，使本系统能够兼容多个终端，为用户提供更好的界面和用户体验。同时，本系统还使用到了jQuery，Bootstrap内置的jQuery插件可以与其配合使用，便于开发。
### 2.1.3 jQuery+jQueryUI
本系统使用了jQuery中的Javascript脚本库，并使用jQuery提供的功能函数，完成编码逻辑，实现业务功能，并解决了多个浏览器的兼容性问题。
本系统使用了大量jQuery UI中的插件以及动画特效，例如本系统中的选择日期的日历、统计生成的图表等。同时它是免费开源的，可根据需要自定义甚至重新设计，十分方便易用。
## 2.2后端技术
### 2.2.1 JSP
JSP有静态部分和动态部分组成，可在其中嵌入Java脚本。本系统主要使用到了JSTL的迭代标签<c:forEach>，结合EL表达式${}，迭代输出标签内部的内容，简化迭代操作。
### 2.2.2 MyBatis
MyBatis是一个实现了JPA规范的用来连接数据库并对其进行增、删、改、查操作的开源框架，底层就是一个JDBC封装的组件。
本系统主要使用了Mybatis-Generator，一个自动生成实体代码的插件，使用该插件可以很方便的生成实体类、Mapper接口以及对应的XML文件。
### 2.2.3 Spring
Spring是一个开源框架，主要优势之一就是其分层架构，分层架构允许使用者选择使用哪一个组件，同时为 J2EE 应用程序开发提供集成的框架。Spring使用基本的JavaBean来完成以前只可能由EJB完成的事情。Spring的核心是控制反转（IoC）和面向切面（AOP）。
### 2.2.4 SpringMVC
Spring MVC框架提供了一个DispatcherServlet作为前端控制器来分派请求，同时提供灵活的配置处理程序映射、视图解析、语言环境和主题解析，支持文件上传，每一个功能实现由一个专门的对象负责完成。Spring MVC还分离了控制器、模型对象、分派器以及处理程序对象的角色。
### 2.2.5 Maven
Maven仓库用来存放Maven管理的所有Jar包，分为本地仓库和中央仓库。在Maven中一个项目都是用一个唯一的坐标来表示。本项目在开发中，需要依赖于其他的一些项目，所以 PO应该具备dependencies这个属性，用来表示其所依赖的外部项目，pom.xml就是PO对象的XML描述。
