function svgDrawLine( eTarget, eSource, browser ) {				
    var $source = eTarget;
    var $target = eSource;
    var originX = $source.offset().left + (($source.width()+20)/2);
    var originY = $source.offset().top + $source.height() - 95;
    var endingX = $target.offset().left + (($source.width()+20)/2);
    var endingY = $target.offset().top - 120;
	var space = ((endingY-originY)/2);
	drawing(originX, originY, endingX, endingY, space, browser);
}


function drawing(originX, originY, endingX, endingY, space)
 {
	if($.browser.msie)
	{
		var svg = $("#svgbasics");

	    svg.drawLine(originX, originY+35, originX , originY + space + 40, {
			 'color': '#bacee6',
		     'stroke': 2
	 	}); // beginning
	    svg.drawLine(originX, originY + space + 40, endingX, endingY - space + 40, {
			 'color': '#bacee6',
		     'stroke': 2
	    }); // diagonal line
	    svg.drawLine(endingX, endingY - space + 40, endingX, endingY + 40, {
			 'color': '#bacee6',
		     'stroke': 2
	    }); // ending
	} else {
		var svg = $("#svgbasics").svg();
		svg = $("#svgbasics").svg('get');

	    var space = ((endingY-originY)/2);
	    svg.line(originX, originY+35, originX , originY + space + 40, {
			'stroke': '#bacee6',
	        'strokeWidth': 2   
	 	}); // beginning
	    svg.line(originX, originY + space + 40, endingX, endingY - space + 40, {
	        'stroke': '#bacee6',
	        'strokeWidth': 2
	    }); // diagonal line
	    svg.line(endingX, endingY - space + 40, endingX, endingY + 40, {
	        'stroke': '#bacee6',
	        'strokeWidth': 2
	    }); // ending
	}
}
