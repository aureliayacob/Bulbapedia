//
//  CoreDataError.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 05/01/23.
//

import Foundation

public enum CoreDataError: LocalizedError {
    
    case requestFailed
    
    public var errorDescription: String? {
        switch self {
        case .requestFailed: return "Error in fetching data"
        }
    }
}
