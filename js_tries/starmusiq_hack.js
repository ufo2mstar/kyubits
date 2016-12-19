jscript = document.createElement('script');
jscript.src = "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js";
jscript.src= "https://code.jquery.com/jquery-3.1.0.min.js"
document.getElementsByTagName("body")[0].appendChild(jscript);

/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[4]/td[3]/a

$x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[2]/td[3]/a')[0].click()

$x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[4]/td[3]/a')[0].click()

$x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[2]/td[3]/a')[0].click()

var max_songs= 30;
var i = 2;
do{
if($x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0] != [])
  $x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0].click();
} while(i<max_songs)

var max_songs= 30;
var i = 2;
do{
if($x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0] != []){
  // console.log("$x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr["+i+"]/td[3]/a')[0].click();");
  console.log($x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0] );
}
i=i+1;
} while(i<max_songs)

javascript: $x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[2]/td[3]/a')[0].click()

javascript:
function _x(STR_XPATH) {
    var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
    var xnodes = [];
    var xres;
    while (xres = xresult.iterateNext()) {
        xnodes.push(xres);
    }

    return xnodes;
}

function download(i){
	path = "_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr["+i+"]/td[3]/a')[0].click();";
  console.log(path);
  // eval(path);
}

var max_songs= 30,i = 2,delay=1000;

do{
if(_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0]){
	setTimeout(download(i),delay);
}
i=i+1;
} while(i<max_songs)

var i=2
setTimeout(function(i){console.log(i)},1000);i++
setTimeout(function(i){console.log(i)},2000);i++
setTimeout(function(){writeNumber.html("3")},3000);


javascript:
function _x(STR_XPATH) {
    var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
    var xnodes = [];
    var xres;
    while (xres = xresult.iterateNext()) {
        xnodes.push(xres);
    }

    return xnodes;
}

function download(i){
	path = "_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr["+i+"]/td[3]/a')[0].click();";
  console.log(path);
  // eval(path);
}

var max_songs= 30,i = 2,delay=1000;
var node_head = '/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr[';
var node_tail = ']/td[3]/a';

do{
if(_x(node_head+i+node_tail)[0]){
	path = node_head+i+node_tail;
	setTimeout(
		function(i){
	path = "_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr["+i+"]/td[3]/a')[0].click();";
  console.log(path);
  // eval(path);
}
,delay);
}
i=i+1;
} while(i<max_songs)




// just to try

javascript:
function _x(STR_XPATH) {
    var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
    var xnodes = [];
    var xres;
    while (xres = xresult.iterateNext()) {
        xnodes.push(xres);
    }

    return xnodes;
}

function download(i){
	path = "_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr["+i+"]/td[3]/a')[0].click();";
  console.log(path);
  // eval(path);
}

var max_songs= 30,i = 2,delay=1000;

do{
if(_x('/html/body/table[1]/tbody/tr[2]/td[2]/table[4]/tbody/tr[1]/td/table/tbody/tr['+i+']/td[3]/a')[0]){
	setTimeout(download(i),i*delay);
}
i=i+1;
} while(i<max_songs)





// grrr.. anonymous

var array = [1,2,3];
vari=0;
function call_next(){array[0]};
do{function(array,i){ 
        setTimeout(function(){
            console.log(array[i]);
        }, 3000*i);
    }(array,i);
    i++;
}while(i<array.length)

// why not

// Dangit! Closures was a whole thing you needed to have known!!
