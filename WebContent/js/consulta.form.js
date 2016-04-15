$(function() {
	$('.mask').inputmask();
	
	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);
	$('.datepicker').datepicker({format: 'dd/mm/yyyy',language:'pt-BR'});
	$('#datepicker').datepicker({format: 'dd/mm/yyyy',language:'pt-BR'});
	
	$.timepicker.setDefaults($.timepicker.regional['pt-BR']);
	
	$('.timepicker').timepicker({format: 'dd/mm/yyyy',language:'pt-BR'});
	$('#timepicker').timepicker({format: 'HH:mm',language:'pt-BR'});
	
	
	$('.timepicker1').timepicker({format: 'dd/mm/yyyy',language:'pt-BR'});
	$('#timepicker1').timepicker({format: 'HH:mm'});
	
	$('#consulta_form').on('submit',function(){
		
		//$('#inicio').val($('#consulta_datas').data('daterangepicker').startDate.format('DD/MM/YYYY h:mm'));
		//$('#fim').val($('#consulta_datas').data('daterangepicker').endDate.format('DD/MM/YYYY h:mm'));
		//datepicker + timepicker
		var inicioFormatado = $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker').timepicker('getTime');
		var fimFormatado = $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker1').timepicker('getTime');
		
		$('#inicio').val(inicioFormatado);
		$('#fim').val(fimFormatado);
		
		if($('#convenio_id').val() == ''){
			$('#convenio_id').attr('name','');
		}
		
	});

	$('#paciente_id').select2({
		width : 'resolve',
		minimumInputLength : 3,
		initSelection: function (element, callback) {
            var id = $(element).val();
            if (id !== "") {
            	$.ajax({
        			url : CONTEXT_PATH + '/paciente/getPaciente',
        			data : {
        				'paciente.id' : $(element).val()
        			},
        			dataType : 'json',
        			type : 'GET',
        			success : function(data) {
        				data.paciente.text = data.paciente.nome;
        				$('#paciente_cpf').val(data.paciente.cpf);
        				$('#paciente_telefoneResidencial').val(data.paciente.telefoneResidencial);		
        				$('#paciente_telefoneCelular').val(data.paciente.telefoneCelular);
        				$('#paciente_convenio').val(data.paciente.convenio.nome);
        				callback(data.paciente);        				
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({ 
				url : CONTEXT_PATH + '/paciente/getPacientesSemConsulta',
				data : {
					'filtro' : key,
					'inicio': $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker').timepicker('getTime'),
				    'fim'   :  $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker1').timepicker('getTime'),
				    'consulta.id':$('#consulta_id').val() 
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
	
	$('#paciente_id').on("change",function(object){
		$('#paciente_cpf').val(object.added.cpf);
		$('#paciente_telefoneResidencial').val(object.added.telefoneResidencial);		
		$('#paciente_telefoneCelular').val(object.added.telefoneCelular);
		$('#paciente_convenio').val(object.added.convenio.nome);
	});
	$('#btnBuscaPaciente').on("click",function(){
		$.ajax({
			url : CONTEXT_PATH + '/paciente/getPaciente',
			data : {
				'paciente.cpf' : $('#paciente_cpf').val()
			},
			dataType : 'json',
			type : 'GET',
			success : function(data) {
				$('#paciente_id').select2('val',data.paciente.id);
			}
		});
	});
	
	$('#convenio_id').select2({
		width : 'resolve',
		minimumInputLength : 3,
		initSelection: function (element, callback) {
            var id = $(element).val();
            if (id !== "") {
            	$.ajax({
        			url : CONTEXT_PATH + '/convenio/getConvenio',
        			data : {
        				'convenio.id' : $(element).val()
        			},
        			dataType : 'json',
        			type : 'GET',
        			success : function(data) {
        				data.convenio.text = data.convenio.nome;
        				callback(data.convenio);
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({
				url : CONTEXT_PATH + '/convenio/getConvenios',
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
	}); //#convenio_id
	
	
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
        				callback(data.odontologo);
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({
				url : CONTEXT_PATH + '/odontologo/getOdontologosDisponiveis',
				data : {
					'filtro' : key,
					'inicio': $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker').timepicker('getTime'),
				    'fim'   :  $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker1').timepicker('getTime'),
				    'consulta.id':$('#consulta_id').val() 
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
	}); //#odontologo_id
	
	$('#odontologo_id').on("change", function(object) {
		console.log(object.added);
		$('#odontologo_especialidade').val(object.added.especialidade);
	});
	
	$('#consultorio_id').select2({
		width : 'resolve',
		minimumInputLength : 3,
		initSelection: function (element, callback) {
            var id = $(element).val();
            if (id !== "") {
            	$.ajax({
        			url : CONTEXT_PATH + '/consultorio/getConsultorio',
        			data : {
        				'consultorio.id' : $(element).val()
        			},
        			dataType : 'json',
        			type : 'GET',
        			success : function(data) {
        				data.consultorio.text = data.consultorio.descricao;
        				callback(data.consultorio);
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({
				url : CONTEXT_PATH + '/consultorio/getConsultoriosDisponveis',
				data : {
					'filtro' : key,
					'inicio': $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker').timepicker('getTime'),
				    'fim'   :  $('#datepicker').datepicker('getDate').toString('dd/MM/yyyy') + ' '+$('#timepicker1').timepicker('getTime'),
				    'consulta.id':$('#consulta_id').val() 
				},
				dataType : 'json',
				type : 'GET',
				success : function(data) {
					$.each( data.list, function( key, value ) {
						value.text = value.descricao;  
					});
					
					query.callback({
						results : data.list
					});
				}
			});
			
		}
	}); //#consultorio_id

	

});
