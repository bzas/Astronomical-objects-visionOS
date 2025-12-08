//
//  DependencyContainer.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Domain
import LocalObjectImporter

struct DependencyContainer {
    
    // MARK: - Repositories
    
    let objectRepository: AstronomicalObjectRepositoryProtocol
    
    init() {
        self.objectRepository = AstronomicalObjectRepository()
    }
}
