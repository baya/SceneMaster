$(function(){
    $('#add').bind('click', function(){
	var role = findActivityItem('input.role');
	validate = validates(role, '角色不能为空', function(item){
	    return item.val();
	})
	if(!validate)
	    return false

	var action = findActivityItem('input.action');
	validate = validates(action, '动作不能为空', function(item){
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
	    "<span class='label label-inverse role'>" + data.role + "</span>" +
	    "<span class='label action'>" + data.action + "</span>" +
	    "<span class='label label-info content'>" + data.content + "</span>" +
	    "</li>";

	return html;
    }

    function validates(item, msg, handler){
	
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
	var sort_array = computeActivitiesSortArray();
	var position = sort_array.length;
	var data = {
	    scene_id: scene_id,
	    role: role.val(),
	    action: action.val(),
	    content: content.val(),
	    sort_array: sort_array,
	    position: position
	};

	return data;
    }

    function sendActivityData(activity_data, handler){
	var url = '/activity';
	$.post(url, activity_data, handler, 'json')
    }

    function clickBtnTextToInput(col) {
	$('.label.' + col).bind('click', function(){
	    var item = findActivityItem('.' + col);
	    item.val($(this).text());
	})
    }

    clickBtnTextToInput('role');
    clickBtnTextToInput('action');
    clickBtnTextToInput('content');

    function hoverSceneIcons(){
	$('.node').hover(
	    function(){
		$(this).find('.icons').show();
		$(this).find('.ph').hide();
	    },
	    function(){
		$(this).find('.icons').hide();
		$(this).find('.ph').show();
	    }
	)
    }

    hoverSceneIcons();

    function hideActivityCRUDBtns(){
	$('.crud').hide();
	$('.ph').show();
    }

    function hoverActivityCRUDBtns(){
	$('.activity').hover(
	    
	    function(){
		$(this).find('.crud').show();
	    },
	    
	    function(){
		$(this).find('.crud').hide();
	    }
	)
    }


    hideActivityCRUDBtns();
    hoverActivityCRUDBtns();

    function trashActivity(activity_id, handler){
	var url = '/activity/delete';
	$.post(url, {id: activity_id}, handler, 'json')
    }

    function removeDeletedActivity(activity){
	activity.remove();
    }

    $('.trash').bind('click', function(){
	var res = confirm("确定删除?");
	if(res == true){
	    var activity = $(this).parent().parent();
	    var activity_id = activity.children('.data').first().val();
	    var res = '';
	    trashActivity(activity_id, function(data){
		var res = data.result;
		if(res == 'success'){
		    removeDeletedActivity(activity);
		} else {
		    alert('删除失败，请稍后重试');
		}
	    })
	} else {
	    return false
	}

    })

    function hideEdt(){
	$('input.edt').hide();
	$('textarea.edt').hide();
	$('button.edt').hide();
    }

    hideEdt();

    $('.wrench').bind('click', function(){
	hideEdt();
	hideAftActivity();
	$('.activity > .icons').addClass('crud');
	$('.activity > .label').show();
	var activity = $(this).parent().parent();
	activity.find('.label').hide();
	activity.find('.edt').show();
	activity.children('.icons').removeClass('crud').hide();
    })

    $('button.edt').bind('click', function(){
	var activity = $(this).parent().parent();
	var activity_id = activity.find('input.data').val();
	var role = activity.find('input.role');
	var action = activity.find('input.action');
	var content = activity.find('textarea.content');
	var url = '/activity/update';
	var data = {
	    id: activity_id,
	    role: role.val(),
	    action: action.val(),
	    content: content.val()
	}

	validate = validates(role, '角色不能为空', function(item){
	    return item.val();
	})
	if(!validate)
	    return false

	validate = validates(action, '动作不能为空', function(item){
	    return item.val();
	})
	if(!validate)
	    return false

	$.post(url, data, function(data){
	    if(data.error){
		alert('发生错误，请确认输入的数据正确');
	    } else {
		hideEdt();
		renderUpdatedActivityData(activity, data);
		activity.children('.label').show();
		activity.children('.icons').addClass('crud').show();
	    }
	}, 'json')
    })

    function renderUpdatedActivityData(activity, data){
	var role = activity.find('.label.role');
	var action = activity.find('.label.action');
	var content = activity.find('.label.content');

	role.text(data.role);
	action.text(data.action);
	content.text(data.content);
    }

    function hideAftActivity(){
	$('.aft-activity').hide();
    }

    hideAftActivity();

    function computeActivitiesSortArray(){
	var sort_array = [];
	$('.activity').each(function(index, activity){
	    sort_array[index] = $(activity).children('.data').val();
	});

	return sort_array;
    }

    $('.add').bind('click', function(){
	hideAftActivity();
	hideEdt();
	$(this).parent().parent().next().show();
    })

    $('.cfm').bind('click', function(){
	var aft_activity = $(this).parent().parent();
	var scene_id = $('#scene_id').val();
	var position = aft_activity.children('.data.position').val();
	var role = aft_activity.children('.role');
	var action = aft_activity.children('.action');
	var content = aft_activity.children('.content');
	var sort_array = computeActivitiesSortArray();
	var data = {
	    scene_id: scene_id,
	    role: role.val(),
	    action: action.val(),
	    content: content.val(),
	    position: position,
	    sort_array: sort_array
	};
	var url = '/activity';

	$.post(url, data, function(data){
	    var activity_html = getActivityHtmlText(data);
	    if(data.error){
		alert('发生错误，请稍后重试');
	    } else {
		aft_activity.before(activity_html);
		aft_activity.hide();
	    }
	}, 'json')
    })

    var pre_drag_activity;
    // drag
    $('.drag').bind('mousedown', function(){
    	pre_drag_activity = $(this).parent();
	$('.insert-ph').show();
	// disable text select
	return false;
    })

    function getHowToInsert(drage_a, place_a, sort_array){
	var drage_a_num = drage_a.find('.data').val();
	var place_a_num = place_a.find('.data').val();
	// up drage
	if(sort_array.indexOf(drage_a_num) > sort_array.indexOf(place_a_num)){
	    return 'before'
	// down drage    
	} else {
	    return 'after'
	}
    }

    $('.activity').bind('mouseup', function(){
	if(!pre_drag_activity)
	    return false
	var sort_array = computeActivitiesSortArray();
	var hti = getHowToInsert(pre_drag_activity, $(this), sort_array);
	$(this)[hti](pre_drag_activity.clone(true)[0]);
	pre_drag_activity.remove();
    	pre_drag_activity = null;

	saveSortArrayToServer();
    })

    function saveSortArrayToServer(){
	var sort_array = computeActivitiesSortArray();
	var scene_id = $('#scene_id').val();
	var url = '/sort_array/save';
	var data = {
	    scene_id: scene_id,
	    sort_array: sort_array
	};
	$.post(url, data, function(data){
	    if(data.error){
		alert('发生错误，请稍后再试');
	    } else {
		// do nothing
	    }
	}, 'json');
    }


})