
module.exports = {
	init: function() {
		var zan = $('#zan');
		var data = {
			id: 123,
			zan: 1 //1表示赞, 0表示取消赞.
		};
		$.ajax({
			url: 'http://localhost:8000/article/zan',
			method: 'POST',
			dataType: 'jsonp',
			jsonp: 'callback',
			//jsonpcallback: 'jsonpcallback',
			data: data,
			timeout: 2000,
			success: function(data) {
				console.log(data.data);
			},
			error: function(e) {
				console.log('fail');
			}	
		});
	}
}
