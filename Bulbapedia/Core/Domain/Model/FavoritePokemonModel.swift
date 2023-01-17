//
//  FavoritePokemonModel.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation

public struct FavoritePokemonModel: Codable {
    
    let id: Int?
    let name, type: String?
    let image, desc: String?
    let atk, def, height, weight: Int?
    
}
