//
//  PokemonModel.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation

struct PokemonModel: Identifiable {
    let id: Int?
    let attack, defense: Int?
    let description: String?
    let height : Int?
    let imageURL: String?
    let name, type: String?
    let weight: Int?
}
