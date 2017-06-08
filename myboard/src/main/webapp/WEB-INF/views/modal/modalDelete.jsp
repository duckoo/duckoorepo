<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade in" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">글삭제</h4>
			</div>
				<div class="modal-body">
					정말 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" id="cancelModalBtn" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" id="deleteModalBtn" class="btn btn-primary">확인</button>
				</div>
		</div>
	</div>
</div>
