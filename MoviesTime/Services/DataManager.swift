//
//  DataManager.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    let names = [
        "Logan",
        "Deadpool",
        "Avengers: Age of Ultron",
        "Sully",
        "The LEGO Batman Movie",
        "Kong: Skull Island",
        "Arrival",
        "Mad Max: Fury Road",
        "Captain America: Civil War",
        "Rogue One",
        "Doctor Strange",
        "Suicide Squad",
        "Batman v Superman: Dawn of Justice"
    ]
    
    let genre = [
        "Action, Drama, Sci-Fi",
        "Action, Adventure, Comedy",
        "Action, Adventure, Sci-Fi",
        "Biography, Drama",
        "Animation, Action, Adventure",
        "Action, Adventure, Fantasy",
        "Drama, Mystery, Sci-Fi",
        "Action, Adventure, Sci-Fi",
        "Action, Adventure, Sci-Fi",
        "Action, Adventure, Sci-Fi",
        "Action, Adventure, Fantasy",
        "Action, Adventure, Fantasy",
        "Action, Adventure, Sci-Fi"
    ]
    
    let image = ["logan", "deadpool", "avengersultron", "sully", "legobatman",
                 "kongskull", "arrival", "madmax", "civilwar", "rogueone",
                 "doctorstrange", "suicidesquad", "batmanvsuperman"
    ]
    
    let description = [
        "Future.",
        "A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.",
        "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's Mightiest Heroes to stop the villainous Ultron from enacting his terrible plans.",
        "The story of Chesley Sullenberger, an American pilot who became a hero after landing his damaged plane on the Hudson River in order to save the flight's passengers and crew.",
        "Bruce Wayne must not only deal with the criminals of Gotham City, but also the responsibility of raising a boy he adopted.",
        "A team of explorers and soldiers travel to an uncharted island in the Pacific, unaware that they are crossing into the domain of monsters, including the mythic Kong.",
        "When twelve mysterious spacecraft appear around the world, linguistics professor Louise Banks is tasked with interpreting the language of the apparent alien visitors.",
        "A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.",
        "Political interference in the Avengers' activities causes a rift between former allies Captain America and Iron Man.",
        "The Rebel Alliance makes a risky move to steal the plans for the Death Star, setting up the epic saga to follow.",
        "A former neurosurgeon embarks on a journey of healing only to be drawn into the world of the mystic arts.",
        "A secret government agency recruits some of the most dangerous incarcerated super-villains to form a defensive task force. Their first mission: save the world from the apocalypse.",
        "Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs."
    ]
    
    private init() {}
}
