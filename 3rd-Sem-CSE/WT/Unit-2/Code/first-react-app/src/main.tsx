import React from "react";
import ReactDOM from "react-dom/client";
const Heading = function(){
  return(
    <h1>React Stuff.</h1>
  )
}
ReactDOM.createRoot(document.getElementById('root')).render(<Heading />)

// function Student(props){
//   return (<h1>Student Information: {props.name}</h1>)
// }
//   ReactDOM.createRoot(document.getElementById('root')).render(<Student  name="ABC"/>);

// function Student({ name, srn, age }) {
//   return (
//     <div>
//       <h1>Name: {name}</h1>
//       <h1>SRN: {srn}</h1>
//       <h1>Age: {age}</h1>
//     </div>
//   );
// }

// ReactDOM.createRoot(document.getElementById('root')).render(
//   <Student name="Neeraj" srn="SYBAU" age={21} />
// );
import './index.css'

function InStyle() {
  return (
    <div style={{ backgroundColor: "aqua" }}>
      <p>Vere Ante Outer </p>
      <p style={{ color: "red" }}>Aqua Minarali</p>
    </div>
  );
}
ReactDOM.createRoot(document.getElementById('root')).render(<InStyle />);