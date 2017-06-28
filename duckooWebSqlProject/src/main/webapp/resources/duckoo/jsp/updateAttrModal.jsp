<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<% Random random = new Random(); 
    int token= random.nextInt();
%> 	
<link rel="stylesheet" href="/resources/duckoo/css/addAttrModal.css?<%=token%>">
 <!-- Modal -->
  <div class="modal fade" id="updateAttrModalWindow" role="dialog">
    <div class="modal-dialog modal-sm" style="width:40%;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">컬럼 수정</h4>
        </div>
        <div class="modal-attrBody" id="asdfasdfasdf">	
                <div class='addRow'>
                    <div class="ctitle">키타입</div>
                    <div class="ccontent">
                        <select id="keyTypeUp" class="teststtstst">
                            <option data-pk="true" data-fk="false"  value="PK">PK</option>
                            <option data-pk="false" data-fk="false"  value="None">None</option>
                            <option data-pk="true" data-fk="true" value="PKFK">PK/FK</option>    
                        </select>
                    </div>
                </div>
             
                <div class='addRow'>
                    <div class="ctitle">논리이름</div>
                    <div class="ccontent">
                        <input id="lNameUp" type='text' style="width:100px; border-top-style:solid;border-top-color:#c8c8c8; border-left-style:solid;border-left-color:#c8c8c8;"></input>
                    </div>
                </div>
             
                <div class='addRow'>
                    <div class="ctitle">물리이름</div>
                    <div class="ccontent">
                        <input id="pNameUp" type='text' style="width:100px; border-top-style:solid;border-top-color:#c8c8c8; border-left-style:solid;border-left-color:#c8c8c8;"></input>
                    </div>
                </div>
             
                <div class='addRow'>
                    <div class="ctitle">데이터타입</div>
                    <div class="ccontent">
                        <div class="select-editable">
                            <select onchange="this.nextElementSibling.value=this.value">
                                <option value=""></option>
                                <option value="int()">int()</option>
                                <option value="varchar()">varchar()</option>
                            </select>
                            <input id="dataTypeUp" type="text" name="format" value=""/>
                        </div>
                    </div>
                </div>
         
                <div class='addRow'>
                    <div class="ctitle">기본값</div>
                    <div class="ccontent">
                        <input id="defaultValUp" type='text' style='width:100px; border-top-style:solid;border-top-color:#c8c8c8; border-left-style:solid;border-left-color:#c8c8c8;'></input>
                    </div>
                </div>
           
                <div class='addRow'>
                    <div class="ctitle">제약조건</div>
                    <div class="ccontent">
                        <input id="notNullUp" type='checkbox' name='Not Null' value='Not Null'>Not Null</input>
                        <input id="autoIncreUp" type='checkbox' name='Autoincrement' value='Autoincrement'>Autoincrement</input>
                        <input id="uniqueValUp" type='checkbox' name='Unique' value='Unique'>Unique</input>
                    </div>
                </div>
            
        </div>
        <div class="modal-footer">
          <button type="button" id="updateAttrFinalBtn" data-id="defalut" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>