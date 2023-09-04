/**
 * basic.js
 */
//document.addEventListener("DOMContentLoaded", loadFunc);

//$(document).ready(loadFunc);

$(loadFunc);

function loadFunc(){

	var p = document.createElement('p'); //dom 객체
	var txt = document.createTextNode("Sample"); // text node
	p.appendChild(txt);
	document.querySelector('body').appendChild(p);
	
	var pTag = $('<p/>'); //jquery 객체
	pTag.text("jquery sample");
	$('#bdy').append(pTag);
	
	console.log(p);
	console.log(pTag);
	
	var li = document.createElement('li');
	li.innerText = 'Apple';
	document.querySelector('body ul#list1').appendChild(li);
	
	$('#list1').append($('<li/>').text('Banana'));
}
