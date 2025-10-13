import React, { useEffect, useState, useRef } from "react";

export function ColorSwitcher() {
    // color state drives both the h1 color and its text
    const [color, setColor] = useState("yellow");

    const label = `Color: ${color.charAt(0).toUpperCase() + color.slice(1)}`;

    return (
        <div>
            <h1 style={{ color }}>{label}</h1>
            <button id="rebButton" onClick={() => setColor("red")}>RED</button>
            <button id="blueButton" onClick={() => setColor("blue")}>BLUE</button>
        </div>
    );
}

function InputVal() {
    const [inputValue, setInputValue] = useState("");
    const count = useRef(0);

    // Keep count.current in sync with number of characters entered
    useEffect(() => {
        count.current = inputValue.length;
    }, [inputValue]);

    return (
        <div>
            <input
                style={{ backgroundColor: "white", color:"black" }}
                type="text"
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
            />
            <p>Count: {count.current} Characters entered</p>
        </div>
    );
}

export default InputVal;
