<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <script id="sqlCreate" type="text/x-handlebars-template">
 create table {{name}} (  
{{#attr}}
	  {{name}},
      {{gen name type}}

 {{/attr}}
);
</script> 


 <script id="mysqlCreateDDL" type="text/x-handlebars-template">
 create table {{name}} (  
   {{#attr}}
  {{pName}} {{#genMySQLType domainName datetype datelength}}{{/genMySQLType}} {{#if notNull}} NOT NULL {{/if}} {{#isEnd @last}}{{/isEnd}}    
   {{/attr}}
);

ALTER TABLE {{name}}
ADD CONSTRAINT PK_{{name}} PRIMARY KEY({{#getPk this}} {{/getPk}}) 



</script> 
<script type="text/javascript" src="/resources/duckoo/js/sql/sqlgen.js?<%=request.getParameter("token")%>"></script>