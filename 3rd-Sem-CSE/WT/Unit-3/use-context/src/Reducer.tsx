import React from 'react'
import ReactDOM from 'react-dom/client'

function Reducer(state, action){
    if(action.type)
    {
        "increment_age":
        return(age: {state.age + 1});
    }else{
        return state;
    }
}

function Agecount(){
    const [age, dispatch] = useReducer(Reducer, {age:20})
    return(
        <div>
            <p>Age: {age}</p>
            <button onClick={dispatch() => (type: "increment_age")}> CLICK </button>
        </div>
    )
}

ReactDOM.createRoot(document.getElementById).render(

)