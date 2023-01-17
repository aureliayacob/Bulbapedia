//
//  NetworkConnection.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 02/01/23.
//

import Foundation
import Network
import Combine

class NetworkConnection: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    static let shared = NetworkConnection()
    
    @Published private(set) var connected: Bool = false
    var cancelables = Set<AnyCancellable>()
    var monitorCubscription: AnyCancellable?
    
    init(){
        checkConnection()
    }
    
    func checkConnection(){
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.connected = true
                }
            } else {
                DispatchQueue.main.async {
                    self.connected = false
                }
            }
        }
        monitor.start(queue: queue)
        
    }
}
