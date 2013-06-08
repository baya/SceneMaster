$(function(){
    $('#add').bind('click', function(){
	validate = validates('input.role', '角色不能为空', function(item){
	    return item.val();
	})
	if(!validate)
	    return false
	
	validate = validates('input.action', '动作不能为空', function(item){
	    return item.val();
	})
	if(!validate)
	    return false

	var data = getActivityData();
	sendActivityData(data);
	
    })

    function validates(col, msg, handler){
	var item = findActivityItem(col);
	if(handler(item)){
	    return true;
	} else {
	    alert(msg);
	    return false;
	}
    }

    function findActivityItem(col) {
	var item = $('#add').prev().children(col).first();
	return item;
    }

    function getActivityData(){
	var role = findActivityItem('input.role');
	var action = findActivityItem('input.action');
	var content = findActivityItem('textarea.content');
	var scene_id = $('input#scene_id').val();
	var data = {
	    scene_id: scene_id,
	    role: role.val(),
	    action: action.val(),
	    content: content.val()
	};

	return data;
    }

    function sendActivityData(data){
	$.ajax({
	    type: 'POST',
	    url: '/activity',
	    data: data,
	    dataType: 'json',
	    success: function(text){
		console.dir(text);
	    }
	})
    }

})