// // 'use strict';
//
// function foo(){
//     console.log(this.bar);
// }
//
// var bar = "global.bar";
// o1 = {bar: "o1.bar", foo: foo};
// o2 = {'bar': "o2.bar", foo: foo};
//
// // default binding rule.. strict mode rule fails.. node = undefined!
// foo();
// // implicit binding rule
// o1.foo();
// o2.foo();
//
//

// interviewer: what will the following code output?

// interviewer: what will the following code output?
const arr = [10, 12, 15, 21];
for (var i = 0; i < arr.length; i++) {
    setTimeout(function () {
        console.log('Index: ' + i + ', element: ' + arr[i]);
    }, 1000);
}

// let solution
for (let i = 0; i < arr.length; i++) {
    setTimeout(function () {
        console.log('Index: ' + i + ', element: ' + arr[i]);
    }, 1000);
}

// closure solution
for (var i = 0; i < arr.length; i++) {
    (function (i) {
        setTimeout(function () {
            console.log('Index: ' + i + ', element: ' + arr[i]);
        }, 1000*(i+1));
    })(i);
}
