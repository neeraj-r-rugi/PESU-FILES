import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function Link1(){
  return(
    <a style={{color:"white"}} href='https://www.youtube.com/@Cinnabrit'><p>Press Me</p></a>
  )
}
function Image1({src}) {
      return(
        <img src={src} alt="Image" />
        
      )
      
}
function Link1({href}) {
      return(
        <div>
          <a href={href}>Smash Me</a>
        </div> 
      )
}

function Result({src, href}){
  return(
    <div>
      <Image1 src={src} />
      <Link1 href={href} />

    </div>
  )
}

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
      <Link1 />
    </>
  )
}

export default App
