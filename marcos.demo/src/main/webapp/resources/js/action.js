var velocidad=200;
	var letras;
	function animar()
	{
		letras=new Array();
		var texto="Uso de cadenas con JavaScript para efectos dinámicos";
		for(i=0;i<texto.length;i++)
		{
			letras[i]=texto.charAt(i);
		}
		mueveLetras();
	}
	var TextoAct="";
	var n=-1;
	function mueveLetras()
	{
		n++;
		TextoAct += letras[n];
		document.title=TextoAct;
	if(n==letras.length-1)
	{
		n=-1;
		TextoAct="";
	}
	setTimeout("mueveLetras()",velocidad);
	}
	