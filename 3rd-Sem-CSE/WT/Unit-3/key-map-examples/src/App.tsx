import React from "react";

function App() {
  return (
    <div>
      <p key="1">Konigsegg</p>
      <p key="2">Bugatti</p>
      <p key="3">Lmaoborghini</p>
      <hr />
      <List2 name={["Konigsegg", "Bugatti", "Lmaoborghini", "Ferrari", "McLaren"]} />
    </div>
  );
}

type List2Props = {
  name: string[];
};

function List2(props: List2Props) {
  return (
    <div>
      {props.name.map((key: string) => (
        <p key={key}>{key}</p>
      ))}
    </div>
  );
}

export default App;
