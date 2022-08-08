/**
 * 
 */
 
 $(document).ready(function(){
	//alert("Document ready");
});

//not use
function Check() {
	var chkPassport = document.getElementById("checkbox");
	if (chkPassport.checked) {
		alert("CheckBox checked.");
	} else {
		alert("CheckBox not checked.");
	}
}


// Like button events
function doLike(pid, uid){ 
	const d = {
		pid: pid,
		uid: uid,
		operation: 'Like'
	}
	
	$.ajax({
		url: "LikeServlet",
		data: d,
		success: function(data, textStatus, jqXHR){
			//console.log(data);
			if(data.trim() =='true'){
				let c = $(".like-counter").html();
				c++;
				$('.like-counter').html(c);
			}
		},error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR);
		}
		
	});
}