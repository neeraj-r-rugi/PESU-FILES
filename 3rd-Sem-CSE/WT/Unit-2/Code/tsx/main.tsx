// src/main.jsx
import React from "react";
import ReactDOM from "react-dom/client";

//Example-1

function Student() {
  const name: string = "Pavan";
  const course: string = "Web Technologies";
  const semester: number = 3;

  return (
    <div>
      <h2>Student Information</h2>
      <p>Name: {name}</p>
      <p>Course: {course}</p>
      <p>Semester: {semester}</p>
    </div>
  );
}

// Render Student component
ReactDOM.createRoot(document.getElementById("root1")).render(

    <Student />

);

-------------------------------------------

//Example-2

import React from "react";
import ReactDOM from "react-dom/client";

// Functional Component
function Welcome(props) {
  return <h1>Hello, {props.name}!</h1>;
}

// Rendering the component
ReactDOM.createRoot(document.getElementById("root")).render(
  <Welcome name="Pavan" />
);