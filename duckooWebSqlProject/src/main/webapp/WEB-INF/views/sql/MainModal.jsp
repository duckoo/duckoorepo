<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="tbl_nameModal" role="dialog" >
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-stitle">테이블 생성.</h4>
        </div>
        <div class="modal-sbody">
          <p>테이블 이름 입력.<input type="text" id="tbl_name"></input></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="button"  id="conform" class ="btn btn-success">conform</button>
        </div>
      </div>
    </div>
</div>

<div class="modal fade" id="relationModal" role="dialog" >
    <div class="modal-dialog modal-m">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-Rtitle">관계생성.</h4>
        </div>
        <div class="modal-Rbody">
          <div class="identify">
          	<button type="button" id="idf" class="btn btn-info">식</button>
          </div>
          <div class="nidentify">
          	<button type="button" id="ndif"class="btn btn-danger">비식</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>



<div class="modal fade" id="identified" role="dialog" >
    <div class="modal-dialog modal-m">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-Rtitle">관계생성[식별]</h4>
        </div>
        <div class="modal-Rbody">
        <div id="srcInfo">
        	<select id="sourceCol">
        		<option selected="selected" value="1">col1</option>
        		<option value="2">col2</option>
        	</select>
        </div>
        <div id="targetInfo">
        	<select id="targetCol">
        		<option selected value="1">tarcol1</option>
        		<option>tarcol2</option>
        	</select>
        </div>
        <div id="options">
        	<input type="checkbox" class="option" class="relationtype" value="OneToOne">1:1<br />
        	<input type="checkbox" class="option" class="relationtype" value="OneToMany" checked>1:M<br />
        	<input type="checkbox" class="option" class="relationtype" value="ManyToMany">M:N<br />
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
           <button type="button" id="relSave" class="btn btn-success" data-dismiss="modal">save</button>
        </div>
      </div>
    </div>
</div>