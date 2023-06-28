//
//  SwipeView.swift
//  Bunka
//
//  Created by apprenant54 on 28/06/2023.
//

import SwiftUI

struct Card: Identifiable {
    
    let id = UUID()
    let imageName : String
    
    // Card X position
    var x: CGFloat = 0.00
    // Card Y position
    var y: CGFloat = 0.00
    // Card rotation angle
    var degree : Double = 0.0
    
    static var data : [Card] {
        [
            
            Card(imageName: "indochine"),
            Card(imageName: "milleSoleilSplendid"),
            Card(imageName: "Diablo4"),
            Card(imageName: "cyrano"),
            Card(imageName: "MarioBrosJeu")
        
        
        ]
    }
    
    
}
