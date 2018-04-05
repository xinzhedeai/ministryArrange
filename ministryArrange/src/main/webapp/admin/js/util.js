layui.use('jquery',function(){
	var $ = layui.jquery;
	console.info($);
	window.util = (function($){
		return {
			cusAjaxPost: function(url, reqParams, callback){
				$.ajax({
			        url: url,
			        timeout:600000,//超时60秒
			        data: reqParams, //json 对象
			        dataType: 'json',
			        type: "POST",
			        cache: false,
			        complete:function(res){
			           // $load.removeClass('progressBar').addClass('progressBarNone');
			           // $(".deviceback_opacity").hide();
			        },
			       /* dataFilter: function (data) {
			        	var resObj = $.parseJSON(data);
			        	return resObj;
			        },*/
			        success: callback,
			       /* error: function (XMLHttpRequest, textStatus, errorThrown){
			        	layer.alert(textStatus);
			        }*/
			    });
			}
		}
		
	})($);
});


/*function ajaxPostCus(url, reqParams, callback) {
	$.ajax({
//        async: _async,
        url: url,
        timeout:600000,//超时60秒
        data: reqParams, //json 对象
        dataType: 'json',
        //ifModified:true, 
        type: "POST",
        cache: false,
        complete:function(res){
           // $load.removeClass('progressBar').addClass('progressBarNone');
           // $(".deviceback_opacity").hide();
        },
        dataFilter: function (data) {
        	var resObj = $.parseJSON(data);
        	return resObj;
        },
        success: callback,
        error: function (XMLHttpRequest, textStatus, errorThrown){
        	layer.alert(textStatus);
        }
    });
}*/