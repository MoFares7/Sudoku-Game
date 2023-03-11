import React from "react"
import Navbar from "./components/Navbar"
import Hero from "./components/Hero"
import Card from "./components/Card";
import DataCard from "./Data/DataCard";
/*
Challenge: Build the Hero component.
Check the Figma file for the design specifics.
*/
const DataCards = DataCard.map(item => {
  return <Card
    key={item.id}
    item={item}
  />
})

function App() {
  return (
    <div className="main--div">
      <Navbar />
      <Hero />
      <section className="cards-list">
        {DataCards}
      </section>

    </div>
  )
}
export default App;