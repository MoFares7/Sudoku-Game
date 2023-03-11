import React from "react"
import wom from "../images/wom.png"

export default function Hero() {
        return (
                <div>
                        <section>
                                <img className="hero--photo" alt="ds" src={wom} />
                                <h1 className="hero--header">Online Experiences</h1>
                                <p className="hero--text">Join unique interactive activities led by
                                        one-of-a-kind hosts—all without leaving home.</p>
                        </section>
                </div>
        )
}