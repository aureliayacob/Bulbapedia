//
//  CoreDataManager.swift
//  Pokedex
//
//  Created by Aurelia Yacob on 23/12/22.
//

import Foundation
import CoreData

class CoreDataManager{
		
		static let instance = CoreDataManager()
		
		lazy var context: NSManagedObjectContext = {
				return container.viewContext
		}()
		
		lazy var container: NSPersistentContainer = {
				return setupContainer()
		}()
		
		func setupContainer()->NSPersistentContainer{
				container = NSPersistentContainer(name: "PokemonContainer")
				
				container.loadPersistentStores { description, error in
						if let error = error {
								fatalError("Error: \(error.localizedDescription)")
						}
				}
				
				return container
		}
		
		func save(){
				do{
						try context.save()
				}catch let error{
						print("Error saving Core Data. \(error.localizedDescription)")
				}
		}
}

