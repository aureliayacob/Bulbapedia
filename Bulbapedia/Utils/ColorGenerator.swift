//
//  ColorGenerator.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 26/12/22.
//

import Foundation
import SwiftUI

class ColorGenerator {
    public static func getColor(for type: String) -> Color {
        switch type {
        case "fire":
            return Color("Fire")
        case "poison":
            return Color("Poison")
        case "water":
            return Color("Water")
        case "electric":
            return Color("Electric")
        case "psychic":
            return Color(.systemPurple)
        case "normal":
            return Color(.systemOrange)
        case "ground":
            return Color(.systemBrown)
        case "flying":
            return Color("Sky")
        case "fairy":
            return Color("Fairy")
        default:
            return Color.theme.mint
        }
    }
    
    public static func getCardColor(for type: String) -> Color {
        switch type {
        case "fire":
            return Color("Fire").opacity(0.5)
        case "poison":
            return Color("Poison").opacity(0.5)
        case "water":
            return Color("Water")
        case "electric":
            return Color("Electric")
        case "psychic":
            return Color(.systemPurple).opacity(0.5)
        case "normal":
            return Color(.systemOrange).opacity(0.5)
        case "ground":
            return Color(.systemBrown)
        case "flying":
            return Color("Sky").opacity(0.5)
        case "fairy":
            return Color("Fairy").opacity(0.5)
        default:
            return Color.theme.mint.opacity(0.5)
        }
    }
}
