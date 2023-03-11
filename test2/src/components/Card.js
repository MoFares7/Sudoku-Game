import React from "react";
import star from "../images/star.png"

export default function (props) {

        let badegText;
        if (props.item.openSpots == 0) {
                badegText = "SOLD OUT"
        }
        else {
                if (props.item.location == "Online") {
                        badegText = "ONLINE"
                }
        }
        return (
                <div className="card">
                        {badegText && <div className="card--badge">{badegText}</div>}
                        <img className="card--image" src={props.item.coverImg} />
                        <div className="card--status">
                                <img className="card--star" src={star} />
                                <span>5.0</span>
                                <span className="gray">{props.item.reviewCount} • </span>
                                <span className="gray">{props.item.location}</span>
                        </div>
                        <p>{props.title}</p>
                        <p><span className="bold">From ${props.item.price}</span> / person</p>
                </div>

        )
}