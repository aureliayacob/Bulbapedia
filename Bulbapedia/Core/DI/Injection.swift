//
//  Injection.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation

final class Injection: NSObject {
    
    private func provideDataSource() -> PokemonDataSourceProtocol {
        return PokemonDataSource()
    }
    
    private func provideLocalDataSource() -> FavoritePokemonDataSourceProtocol {
        return FavoritePokemonDataSource()
    }
    
    private func provideRepository() -> PokemonRepositoryProtocol {
        let pokemonDataSource = provideDataSource()
        return PokemonRepository(dataSource: pokemonDataSource)
    }
    
    private func provideLocalRepository() -> FavoritePokemonRepositoryProtocol {
        let localPokemonDataSource = provideLocalDataSource()
        return FavoritePokemonRepository(dataSource: localPokemonDataSource)
    }
    
    private func provideUseCase() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    private func provideDetailUseCase() -> DetailUseCase {
        let repository = provideLocalRepository()
        return DetailInteractor(repository: repository)
    }
    
    private func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = provideLocalRepository()
        return FavoriteInteractor(repository: repository)
    }
    
    func provideHome() -> HomeUseCase {
      let repository = provideRepository()
      return HomeInteractor(repository: repository)
    }
    
    func provideDetail(pokemon: PokemonModel) -> DetailUseCase {
      let repository = provideLocalRepository()
      return DetailInteractor(repository: repository)
    }
    
    func provideFavorite() -> FavoriteUseCase {
      let repository = provideLocalRepository()
      return FavoriteInteractor(repository: repository)
    }
}
