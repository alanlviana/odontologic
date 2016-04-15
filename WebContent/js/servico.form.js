$(function(){
	$('.mask').inputmask();
	$.datepicker.setDefaults( $.datepicker.regional[ "pt-BR" ] );
	$('.datepicker').datepicker();
	
	$('#servico_form').on('submit',function(){
		
		//$('#inicio').val($('#consulta_datas').data('daterangepicker').startDate.format('DD/MM/YYYY h:mm'));
		//$('#fim').val($('#consulta_datas').data('daterangepicker').endDate.format('DD/MM/YYYY h:mm'));
		//datepicker + timepicker
		$('#servico_valor').val($('#servico_valor_calc').val().replace('.',','));
		
	});

});

