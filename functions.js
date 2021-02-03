/*Progetto per l'esame di Codifica di Testi, aa 2019/20
 Codifica di cartoline storiche della Grande Guerra
 A cura di: Francesca Poli, mat. 560190 */

function debounce(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) func.apply(context, args);
	};
}; 

function updateSize(){
    var facsimile = document.querySelectorAll(".facsimile");
        facsimile.forEach(fs => {
            var {naturalWidth, width} = fs.querySelector('img');
            var aree = fs.querySelectorAll('area');
            gestoreResize(width, naturalWidth, aree);
        })
}

function gestoreResize (img,span,aree) {
        var ratio = img/span;
        //creo un array con le coordinate delle aree per modificarle
        var coords = [];
        for (var i=0; i<aree.length; i++){
            var area = aree[i];
            coords[i] = area.coords.split(',');
            for(var j=0; j<coords[i].length; j++){
                coords[i][j] *= ratio;
            }
            area.coords = coords[i].join(',');
        }
}

function gestoreClick(event){
    var {target} = event;
    //get attribute + cerca testo con id simile
    //classlist.remove(is-hidden) --> elementi hidden = display:none
    var id = target.getAttribute('id');
    var element = document.getElementById('text_'+id);
    element.classList.toggle('is-hidden');
}

function gestoreClick2(event){
    var {target} = event;
    var id = target.getAttribute('id');
    var element = document.getElementById('show_'+id);
    element.toggle('.is-hidden');  
}

function gestoreLoad() {

    window.onresize = updateSize()//debounce(updateSize(), 300); 

        var righe = document.querySelectorAll('.transcription');
        righe.forEach(function(riga){
            riga.addEventListener('mouseenter', function(event){
                var id = event.target.getAttribute('id');
                var area = $(id.replace('text_', '#'));
                if(!area){
                    return;
                }
                area.mouseover();
            });
            riga.addEventListener('mouseleave', function(){
                var id = this.getAttribute('id');
                var area = $(id.replace('text_', '#'));
                if(!area){
                    return;
                }
               area.mouseout();
            });
        });



        $(document).ready(function(){
            var maps = $('.map');
            maps.maphilight({
                fillColor: 'ff0000'
            });
        });
}

window.onload = gestoreLoad;
window.onresize = updateSize; 


