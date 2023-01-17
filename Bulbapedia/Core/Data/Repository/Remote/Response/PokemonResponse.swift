//
//  PokemonResponse.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 12/01/23.
//

import Foundation

struct PokemonModelResponse: Codable {
    let id: Int?
    let attack, defense: Int?
    let description: String?
    let height : Int?
    let imageURL: String?
    let name, type: String?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense
        case description = "description"
        case height, id
        case imageURL = "imageUrl"
        case name, type, weight
    }
}


typealias PokemonResponse = [PokemonModelResponse?]
