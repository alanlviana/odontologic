$(function() {
	$('.mask').inputmask();
	$.datepicker.setDefaults( $.datepicker.regional[ "pt-BR" ] );
	$('.datepicker').datepicker();
	$('#odontologo\\.especialidade').tokenfield(
			{
				autocomplete : {
					delay : 100
				},
				showAutocompleteOnFocus : false
			});
	
	var estado_id = $('#odontologo\\.endereco\\.cidade\\.estado\\.id');
	var cidade_id = $('#odontologo\\.endereco\\.cidade\\.id');
	estado_id.on('change',function(){
		$.post(
				CONTEXT_PATH+'/endereco/cidadeList',
				{'estado.id':estado_id.val()},
				function(data){
					cidade_id.find('option').remove().end();
					$.each(data.list,function(index,object){
						console.log(object.nome);
						cidade_id.append(new Option(object.nome,object.id));
					});
					}
				);
	});
	
});

