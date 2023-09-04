/**
 * todo.js
 */

 class ToDo{
	 toDoAdd(param={num, todo}, callback){
		//$.post('AjaxReplyAdd.do', param, function(data){
		//	callback(data);
		//})
		
		$.ajax({
			url: 'AjaxToDoAdd.do',
			data: param,
			success: function(data){
				callback(data);
			}
		})
	}
	
	toDoDel(num, callback){
		$.ajax({
			url: 'AjaxToDoDel.do?num=' + num,
			success: function(data){
				callback(data);
			}
		})
	}
 }