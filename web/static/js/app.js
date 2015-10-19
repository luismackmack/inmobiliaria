import "deps/phoenix_html/web/static/js/phoenix_html"


let paisSelect = $("#pais")
let estadoSelect = $("#estado")
let ciudadSelect = $("#ciudad")

paisSelect.on("change", event => {
	$.get( "/inmuebles/query_estado/"+`${paisSelect.val()}`, function(data) {
		console.log(`${paisSelect.val()}`)
		if (data.result != '') {
			var items = [];
			items.push( "<option value='" + 0 + "'>Seleccione una opcion</option>" );
			$.each( data.result, function( key, val ) {
				items.push( "<option value='" + val.id + "'>" + val.nombre + "</option>" );
  			});
  			$(estadoSelect).html(items);
	    } else {
			console.log("consulta retorna vacio")
	    }
	});   
})

estadoSelect.on("change", event => {
	$.get( "/inmuebles/query_ciudad/"+`${estadoSelect.val()}`, function(data) {
		console.log(`${estadoSelect.val()}`)
		if (data.result != '') {
			var items = [];
			items.push( "<option value='" + 0 + "'>Seleccione una opcion</option>" );
			$.each( data.result, function( key, val ) {
				items.push( "<option value='" + val.id + "'>" + val.nombre +"</option>" );
  			});
  			$(ciudadSelect).html(items);
	    } else {
			console.log("consulta retorna vacio")
	    }
	});   
})