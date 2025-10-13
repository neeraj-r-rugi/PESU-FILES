function Done(){
  return(
    <h2 hidden id={"done"}>The counter is Reset</h2>
  )
  
}
let i = 0;
function App(){
  return (
    <div>
    <h1 id={"count"}>Counter: 0</h1>
    <Button1 /><Button2 />
    <Done />
  </div>
  )
  
}
function Button2(){
  return(
    <button style={{paddingRight: "50px", paddingLeft: "50px"}} onClick={handleReset} id={"butt"}>Reset</button>
  )
  
}

function Button1(){
  return(
    <button style={{paddingRight: "50px", paddingLeft: "50px"}}  onClick={handleClick} id={"butt"}>+</button>
  )
  
}
function handleReset(){
  i = 0;
  let h1 = document.getElementById("count");
  if (h1) {
    h1.innerHTML = "Counter: 0";

  }
  let reset = document.getElementById("done");
  reset.removeAttribute("hidden");
  setTimeout(()=>{
    reset.toggleAttribute("hidden")
  }, 2000)
}
function handleClick(){
  i++;
  let h1 = document.getElementById("count");
  if (h1) {
    h1.innerHTML = "Counter: " + i;
  }
}

export default App
