$(function(){
	$('#servico_id').select2({
		width : 'resolve',
		minimumInputLength : 3,
		initSelection: function (element, callback) {
            var id = $(element).val();
            if (id !== "") {
            	$.ajax({
        			url : CONTEXT_PATH + '/servico/getServico',
        			data : {
        				'servico.id' : $(element).val()
        			},
        			dataType : 'json',
        			type : 'GET',
        			success : function(data) {
        				data.servico.text = data.servico.nome;
        				$('#servico_valor').val(data.servico.valor);
        				callback(data.servico);
        			}
        		});
           
            }
        },
		query : function(query) {
			self = this;
			var key = query.term;

			$.ajax({
				url : CONTEXT_PATH + '/servico/getServicos',
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
	$('#servico_id').on("change",function(object){
		$('#servico_valor').val("R$ "+object.added.valor);
	});
	$('#addServico').submit(function(evento){
		var dados = $(this).serializeArray();
		var url = $(this).attr("action");
		
		$.ajax({
			url: url,
			type: "POST",
			data: dados,
			success: function(){
				$.ajax({url:CONTEXT_PATH+'/consulta/tabelaServico',
					type:'GET',
					success:function(data){
						$('#tabelaServico').html(data);
						
						//alert(data);
					}
				});
			}
		});
		evento.preventDefault();
		//evento.unbind();
	});
	
	removerItem = function(index){
		$.ajax({
			url: CONTEXT_PATH+'/consulta/removerServico',
			type: "POST",
			data: {'index':index},
			success: function(){
				$.ajax({url:CONTEXT_PATH+'/consulta/tabelaServico',
					type:'GET',
					success:function(data){
						$('#tabelaServico').html(data);
						
						//alert(data);
					}
				});
			}
		});
	};
	
});