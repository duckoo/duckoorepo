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
          <button type="button"  id="conferm" class ="btn btn-success">conform</button>
        </div>
      </div>
    </div>
</div>