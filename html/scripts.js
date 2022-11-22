// Partial Functions
function closeMain() {
	$("body").css("display", "none");
}
function openMain() {
    console.log("körs")
    $("body").css("display", "block");
	$(".databank-container").css("display", "block").css("user-select", "none");
    $(".databank-container iframe").css("display", "block");
    $(".tablet-frame").css("display", "block").css("user-select", "none");
    $(".databank-bg").css("display", "block");
}
function closeAll() {
	$(".body").css("display", "none");
}
$(".close").click(function(){
    $.post('https://bg-skills/quit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {
var item = event.data;
console.log(JSON.stringify(item))
	// Open & Close main window
	if (item.message == "show") {
		if (item.clear == true){
			$( ".col-md-12" ).empty();
		}
		openMain();
	}

	if (item.message == "hide") {
		closeMain();
	}

	if (item.message == "add"){
		$( ".col-md-12" ).append(' <h3 class="progress-title">'+item.label+'</h3>' +
					'<div class="progress">' +
					'<div class="progress-bar" style="width:'+item.procent+'%; background:'+item.color+';">' +
					'<div class="progress-value">'+item.procent+'%</div>' +
					'</div>'
					);
	}
});


$(document).on("keydown", function() {
    switch(event.keyCode) {
        case 27:
			$.post('https://bg-skills/quit', JSON.stringify({}));
        break;
    }
});