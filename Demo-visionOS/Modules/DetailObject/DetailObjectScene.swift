//
//  DetailObjectScene.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import SwiftUI

struct DetailObjectScene: Scene {
    
    @StateObject var viewModel: DetailObjectViewModel
    
    init() {
        _viewModel = StateObject(
            wrappedValue: DetailObjectViewModel()
        )
    }
    
    var body: some Scene {
        ImmersiveSpace(id: Constants.immersiveSpace) {
            DetailObjectRealityView()
                .environmentObject(viewModel)
        }
        
        WindowGroup {
            DetailObjectInfoView()
                .environmentObject(viewModel)
        }
        .defaultSize(width: 500, height: 500)
    }
}
