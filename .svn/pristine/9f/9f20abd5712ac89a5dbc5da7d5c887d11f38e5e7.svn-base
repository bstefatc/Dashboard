$(function() {
	$(".btn").popover()
})

$(function() {

	/* initiate plugin */
	$("div.holder").jPages({
		containerID : "itemContainer",
		perPage : 20
	});

	/* on select change */
	$("select").change(function() {

		var newPerPage = parseInt($(this).val());

		$("div.holder").jPages("destroy").jPages({
			containerID : "itemContainer",
			perPage : newPerPage
		});
	});

});

$("#small").click(function() {

	$("div.holder").jPages("destroy").jPages({
		containerID : "itemContainer",
		perPage : 20
	});
	$("img").css("width", 320);
	$("img").css("height", 200);

});

$("#medium").click(function() {

	$("div.holder").jPages("destroy").jPages({
		containerID : "itemContainer",
		perPage : 4
	});
	$("img").css("width", 640);
	$("img").css("height", 400);
});

$("#large").click(function() {

	$("div.holder").jPages("destroy").jPages({
		containerID : "itemContainer",
		perPage : 1
	});
	$("img").css("width", 1280);
	$("img").css("height", 800);
});

$(function() {
	$(".btn").popover()
})

$("#commentHidden").click(function() {
	$("#commentHidden").hide();
	$("#commentForma").show();
});

$("#toDoButton").click(function() {
	if (document.getElementById("toDoButton").value == "Add todo") {
		$("#toDoButton").prop("value", "cancel");
		$("#addToDo").show();
		alert(eachtask.getName());
	} else {
		$("#toDoButton").prop("value", "Add todo");
		$("#addToDo").hide();
	}
});

function showHideSubtask(id) {
	if (document.getElementById(id).style.display == "none") {
		document.getElementById(id).style.display = "inline";
	} else {
		document.getElementById(id).style.display = "none";
	}
};

