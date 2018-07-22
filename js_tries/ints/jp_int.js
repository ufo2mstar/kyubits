var a = function () {
    var i = 1;

    function toString() {
    }

    return a + i
};


if (a() == 1)
// if (a == 1 && a == 2 && a == 3)
    console.log("true");
else
    console.log("false");

