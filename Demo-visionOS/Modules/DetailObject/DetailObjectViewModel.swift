//
//  DetailObjectViewModel.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Combine

@MainActor
final class DetailObjectViewModel: ObservableObject {
        
    // MARK: - Properties
    
    @Published var object: AstronomicalObject?
    
    
    
    func load() async {
        do {
            object = try await ObjectImporter().fetchInfo(.earth)
        } catch {
            // Consider logging or handling the error appropriately. For now, we clear the object on failure.
            object = nil
        }
    }
}

