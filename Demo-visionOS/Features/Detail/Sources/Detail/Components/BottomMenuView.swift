//
//  BottomMenuView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 10/12/25.
//

import SwiftUI
import AppState

struct BottomMenuView: View {
    
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
            Button {
                appModel.playOrPause()
            } label: {
                Image(systemName: appModel.isRotationPaused ? "play.fill" : "pause.fill")
            }
            
            Button {
                appModel.increaseSpeed()
            } label: {
                HStack {
                    Text(speedText)
                    Image(systemName: "forward.fill")
                }
            }
        }
    }
}
