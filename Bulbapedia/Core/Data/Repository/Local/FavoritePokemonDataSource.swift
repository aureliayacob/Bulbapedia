//
//  FavoritePokemonDataSource.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine
import CoreData

class FavoritePokemonDataSource: FavoritePokemonDataSourceProtocol {
    
    
    var manager: CoreDataManager
    private let entityName: String = "FavoritePokemonEntity"
    private var savedEntities: [FavoritePokemonEntity] = []
    
    init(coreDataManager: CoreDataManager = .instance){
        self.manager = coreDataManager
        self.getPokemon()
    }
    
    func getData() -> AnyPublisher<[FavoritePokemonEntity], Error> {
        return Future<[FavoritePokemonEntity], Error> { completion in
            let request = NSFetchRequest<FavoritePokemonEntity>(entityName: self.entityName)
            do {
                self.savedEntities = try self.manager.context.fetch(request)
                completion(.success(self.savedEntities))
            } catch let error {
                print("Error \(error)")
            }
        }.eraseToAnyPublisher()
    }
    
    func getDataById(id: Int) -> AnyPublisher<FavoritePokemonEntity, Error> {
        
        return Future<FavoritePokemonEntity, Error> { completion in
            var pokemonById: [FavoritePokemonEntity] = []
            let request = NSFetchRequest<FavoritePokemonEntity>(entityName: self.entityName)
            request.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
            
            do {
                pokemonById = try self.manager.context.fetch(request)
            } catch let error {
                print("Error fetching PokemonEntity. \(error)")
            }
            
            if let pokemon = pokemonById.first {
                completion(.success(pokemon))
            } else
            {
                completion(.failure(CoreDataError.requestFailed))
            }
            
        }.eraseToAnyPublisher()
    }
    
    func updateTabel(by pokemon: FavoritePokemonModel) {
        if self.savedEntities.first(where: {$0.id == pokemon.id ?? 0 }) != nil {
            
        } else {
            self.add(pokemon: pokemon)
        }
    }
    
    func deleteById(id: Int) {
        guard let pokemonToDelete = self.getItem(id: id) else {
            return
            
        }
        self.manager.context.delete(pokemonToDelete)
        
        self.applyChanges()
    }
    
    private func add(pokemon: FavoritePokemonModel){
        let entity = FavoritePokemonEntity(context: manager.context)
        entity.id = Int64(pokemon.id ?? 0)
        entity.name = pokemon.name
        entity.type = pokemon.type
        entity.image = pokemon.image
        entity.desc = pokemon.desc
        entity.height = Int64(pokemon.height ?? 0)
        entity.weight = Int64(pokemon.weight ?? 0)
        entity.atk = Int64(pokemon.atk ?? 0)
        entity.def = Int64(pokemon.def ?? 0)
        self.applyChanges()
        
    }
    
    private func save() {
        manager.save()
    }
    
    private func applyChanges() {
        self.save()
        let request = NSFetchRequest<FavoritePokemonEntity>(entityName: self.entityName)
        do {
            self.savedEntities = try self.manager.context.fetch(request)
        } catch _ {
            
        }
    }
    
    private func getItem(id: Int) -> FavoritePokemonEntity? {
        for pokemon in self.savedEntities {
            if id == pokemon.id {
                return pokemon
            }
        }
        
        return nil
    }
    
    private func getPokemon() {
        let request = NSFetchRequest<FavoritePokemonEntity>(entityName: entityName)
        do {
            savedEntities = try manager.context.fetch(request)
        } catch _ {
            
        }
    }
}

