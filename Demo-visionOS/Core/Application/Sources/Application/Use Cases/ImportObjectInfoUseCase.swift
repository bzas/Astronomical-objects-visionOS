//
//  ImportObjectInfoUseCase.swift
//  Application
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Foundation
import Domain

public protocol ImportObjectInfoUseCaseProtocol: Sendable {
    
    func fetch(
        _ object: AstronomicalObjectType
    ) async throws -> AstronomicalObject
}

actor ImportObjectInfoUseCase: ImportObjectInfoUseCaseProtocol {
    
    let objectRepository: AstronomicalObjectRepositoryProtocol
    
    init(objectRepository: AstronomicalObjectRepositoryProtocol) {
        self.objectRepository = objectRepository
    }
    
    func fetch(
        _ object: AstronomicalObjectType
    ) async throws -> AstronomicalObject {
        try await objectRepository.fetchInfo(object)
    }
}
