//
//  ScaleControlView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 10/12/25.
//

import SwiftUI
import AppState

struct ScaleControlView: View {
    
    @EnvironmentObject var appModel: AppModel
    
    var speedText: String {
        switch appModel.autoRotationSpeed {
        case -40:
            return "x2"
        case -60:
            return "x3"
        case -80:
            return "x4"
        default:
            return "x1"
        }
    }
    
    var body: some View {
        if appModel.isImmersiveSpaceOpen {            
            HStack(spacing: 12) {
                Image(systemName: "scale.3d")
                    .font(.title2)
                
                Slider(value: $appModel.modelScale, in: 0.5...1.5)
                    .frame(width: 200)
            }
            .padding()
            .glassBackgroundEffect()
        }
    }
}
