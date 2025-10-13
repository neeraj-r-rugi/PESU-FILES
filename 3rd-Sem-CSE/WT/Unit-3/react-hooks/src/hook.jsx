import React, { useState, useRef, useEffect } from "react";

function Done({ visible }) {
  if (!visible) return null;
  return <h2 id={"done"}>The counter is Reset lol</h2>;
}

function Button({ onClick, children }) {
  return (
    <button
      style={{ paddingRight: "50px", paddingLeft: "50px" }}
      onClick={onClick}
      id={"butt"}
    >
      {children}
    </button>
  );
}

function App2() {
  const [count, setCount] = useState(0);
  const [showDone, setShowDone] = useState(false);
  const timeoutRef = useRef(null);

  useEffect(() => {
    return () => {
      if (timeoutRef.current) clearTimeout(timeoutRef.current);
    };
  }, []);

  function handleClick() {
    setCount((c) => c + 1);
  }

  function handleReset() {
    setCount(0);
    setShowDone(true);
    if (timeoutRef.current) clearTimeout(timeoutRef.current);
    timeoutRef.current = setTimeout(() => {
      setShowDone(false);
      timeoutRef.current = null;
    }, 2000);
  }

  return (
    <div>
      <h1 id={"count"}>Counter: {count}</h1>
      <Button onClick={handleClick}>+</Button>
      <Button onClick={handleReset}>Reset</Button>
      <Done visible={showDone} />
    </div>
  );
}

export default App2;
