//
//  AppView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import Detail
import Common
import AppState
import ImmersiveView

@main
struct AppView: App {
    
    // MARK: - App setup
    
    let assembly: AppAssembly
    @StateObject var appModel: AppModel
    
    init() {
        let assembly = AppAssembly()
        
        self.assembly = assembly
        _appModel = StateObject(
            wrappedValue: assembly.makeAppModel()
        )
    }
    
    var body: some Scene {
        ImmersiveSpace(id: AppModel.immersiveSpaceName) {
            AppImmersiveView()
        }
        .environmentObject(appModel)
        
        WindowGroup {
            DetailObjectInfoView()
        }
        .environmentObject(appModel)
        .defaultSize(width: 500, height: 500)
    }
}
