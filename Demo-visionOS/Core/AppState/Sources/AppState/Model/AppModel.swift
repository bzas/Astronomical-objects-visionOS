//
//  AppModel.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Combine
import Domain
import Application
import Foundation
import RealityKit
import SwiftUI

@MainActor
public final class AppModel: ObservableObject {
    
    public static let immersiveSpaceName = "AppImmersiveSpace"
    
    // MARK: - Properties
    
    @Published public var object: AstronomicalObject?
    @Published public var isImmersiveSpaceOpen = false

    // MARK: - Use cases
    
    let importObjectInfoUseCase: ImportObjectInfoUseCaseProtocol
    
    // MARK: - 3D Model loader
    
    let appEntityLoader: AppEntityLoader
    
    public init(
        importObjectInfoUseCase: ImportObjectInfoUseCaseProtocol
    ) {
        self.importObjectInfoUseCase = importObjectInfoUseCase
        self.appEntityLoader = AppEntityLoader()
    }
    
    public func load() {
        Task {
            do {
                object = try await importObjectInfoUseCase.fetch(.earth)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public func currentEntity() async -> AnchorEntity? {
        await appEntityLoader.loadEntity(object)
    }
}
