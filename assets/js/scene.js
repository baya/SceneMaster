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
	sendActivityData(data, function(data){
	    renderActivityData(data);
	    resetActivityInput();
	});
	
    })

    function resetActivityInput(){
	var role = findActivityItem('input.role');
	var action = findActivityItem('input.action');
	var content = findActivityItem('textarea.content');

	role.val('');
	action.val('');
	content.val('');
    }

    function renderActivityData(data){
        var html = getActivityHtmlText(data);
	$('#add').parent().prev().before(html)
    }

    function getActivityHtmlText(data){
	var html = "<li class=\'activity\'>" +
	    "<span class='btn btn-primary role'>" + data.role + "</span>" +
	    "<span class='btn btn-inverse action'>" + data.action + "</span>" +
	    "<span class='btn btn-info content'>" + data.content + "</span>" +
	    "</li>";

	return html;
    }

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
	var item = $('#add').parent().prev().children(col).first();
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

    function sendActivityData(activity_data, handler){
	var url = '/activity';
	$.post(url, activity_data, handler, 'json')
    }

    function clickBtnTextToInput(col) {
	$('.btn.' + col).bind('click', function(){
	    var item = findActivityItem('.' + col);
	    item.val($(this).text());
	})
    }

    clickBtnTextToInput('role');
    clickBtnTextToInput('action');
    clickBtnTextToInput('content');

})