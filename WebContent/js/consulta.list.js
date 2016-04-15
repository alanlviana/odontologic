$(function(){
	$('.daterangepicker2').daterangepicker(
			{
				datepicker:true,
				format: 'DD/MM/YYYY',
				locale: {
					applyLabel: 'Aplicar',
					cancelLabel: 'Voltar',
					fromLabel: 'Desde',
					toLabel: 'Até',
					customRangeLabel: 'Personalizado',
					daysOfWeek: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
					monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
					firstDay: 1
				}
			}
	);
	$('.datepicker').datepicker();
	
	$('#odontologo_id').select2({
		width : 'resolve',
		minimumInputLength : 3,
		initSelection: function (element, callback) {
            var id = $(element).val();
            if (id !== "") {
            	$.ajax({
        			url : CONTEXT_PATH + '/odontologo/getOdontologo',
        			data : {
        				'odontologo.id' : $(element).val()
        			},
        			dataType : 'json',
        			type : 'GET',
        			success : function(data) {
        				data.odontologo.text = data.odontologo.nome;
        				//$('#paciente_telefoneResidencial').val(data.paciente.telefoneResidencial);		
        				//$('#paciente_telefoneCelular').val(data.paciente.telefoneCelular);
        				callback(data.odontologo);
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({
				url : CONTEXT_PATH + '/odontologo/getOdontologos',
				data : {
					'filtro' : key
				},
				dataType : 'json',
				type : 'GET',
				success : function(data) {
					$.each( data.list, function( key, value ) {
						value.text = value.nome;  
					});
					
					query.callback({
						results : data.list
					});
				}
			});
		}
	});
});
