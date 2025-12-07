//
//  Demo_visionOSApp.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI

@main
struct Demo_visionOSApp: App {
    
    var body: some Scene {
        ImmersiveSpace(id: Constants.immersiveSpace) {
            PlanetRealityView(planet: .earth)
        }
        
        WindowGroup {
            PlanetInfoView(planet: .earth)
        }
        .defaultSize(width: 500, height: 500)
    }
}
