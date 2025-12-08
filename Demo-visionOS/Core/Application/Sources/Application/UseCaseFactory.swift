//
//  UseCaseFactory.swift
//  Application
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Domain

public struct UseCaseFactory {
    
    let objectRepository: AstronomicalObjectRepositoryProtocol
    
    public init(objectRepository: AstronomicalObjectRepositoryProtocol) {
        self.objectRepository = objectRepository
    }
    
    public func makeImportObjectInfoUseCase() -> ImportObjectInfoUseCaseProtocol {
        ImportObjectInfoUseCase(
            objectRepository: objectRepository
        )
    }
}
