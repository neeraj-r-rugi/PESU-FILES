a = 20;
let b = 30
const c = 40
hello()
hello2()
hello3()
function hello(){
    console.log("Hello: ", a)
    console.log("Hello: ", b)
    console.log("Hello: ", c)
    var a = 100;
    b = 200;
    // let b = 20 Error, B  already exists in scope
    // c = 300 Error
}

function hello2(){
    console.log("hello2: ", d)
    var d = 100;
    console.log("hello2: ", d)
}

function hello2(){
    console.log("hello2: ", f)
    let f = 69;
    console.log("hello2: ", f)
}