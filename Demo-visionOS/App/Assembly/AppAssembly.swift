//
//  AppAssembly.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Application
import Detail
import AppState

final class AppAssembly {
    
    let container: DependencyContainer
    let useCaseFactory: UseCaseFactory
    
    init() {
        self.container = DependencyContainer()
        self.useCaseFactory = UseCaseFactory(
            objectRepository: container.objectRepository
        )
    }
    
    func makeAppModel() -> AppModel {
        AppModel(
            importObjectInfoUseCase: useCaseFactory.makeImportObjectInfoUseCase()
        )
    }
}
