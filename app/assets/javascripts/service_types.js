(function() {
	$(document).tooltop();
});


$(document).ready(function () {

	$('#serviceTypeTable').DataTable({
		"paging": true,
		"lengthChange": false,
		"searching": true,
		"ordering": true,
		"info": true,
		"autoWidth": false
	});

});
