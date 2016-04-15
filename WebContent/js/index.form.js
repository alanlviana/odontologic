$(document).ready(function() {
	

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	
	var calendar = $('#calendario-consulta').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultView: 'agendaDay',
		events: {
		         url: 'consulta/getConsultas',
		         cache: true,
		         textColor: 'black'
		},
		
		allDaySlot:false,
		
		monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'],
		
		buttonText: {
			prev: '<i class="fa fa-angle-left"></i>',
			next: '<i class="fa fa-angle-right"></i>',
			prevYear: '<i class="fa fa-angle-double-left"></i>',  // <<
			nextYear: '<i class="fa fa-angle-double-right"></i>',  // >>
			today:    'Hoje',
			month:    'Mês',
			week:     'Semana',
			day:      'Dia'
		}
	});
	
	$('#logoContainer').css("min-height", "inherit");
	$('#wrap').css("min-height", "inherit");
	$('#logo').css("position", "relative");
	$('#logo').css("margin-top", ($('#logoContainer').height()/2)-100);
});