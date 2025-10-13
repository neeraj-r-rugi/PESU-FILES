import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import App2 from './hook.jsx'
import InputVal, { ColorSwitcher } from './hook2.jsx'

createRoot(document.getElementById('root')).render(
  <InputVal />
)
