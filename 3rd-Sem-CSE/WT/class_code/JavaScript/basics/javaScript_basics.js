//alert("You are entering the website")
console.log("Hello From JavaScript")
//print()
a = 10;
console.log("Value of a = ", a);
console.log(typeof (a));
a = "20";
console.log("Value of a = ", a);
console.log(typeof (a));
//let a will cause error as it is `re-declared` from already existing `a`

let b = 30;
console.log("Value of let b = ", b);
b = 35
console.log("Value of let b = ", b);
b = "32"
console.log(typeof (b));


// const c = 30;
// console.log("Value of let c = ", c);
// c = 35
// console.log("Value of let b = ", c);
// c = "32"
// console.log(typeof (c));


a = "20";
b = 20
console.log("a + b = ", a + b);
if(b == a){
    console.log(true);
}
if(b === a){
    console.log(true);
}else{
    console.log(false);
}

let student = {fname: "ABC", lname: "XYZ", age:26}
console.log(typeof(student))
console.log(student.fname, typeof(student.fname));
console.log(student.lname, typeof(student.lname));
console.log(student.age, typeof(student.age));

let r = isNaN(student.fname)
console.log(r, typeof(r))

const arr = [1, 2, 3];
console.log(typeof(arr));
const dt = Date();
console.log(dt);
