//
//  ObjectInfoView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AppState

public struct ObjectInfoView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    public init() {}
        
    public var body: some View {
        VStack {
            HeaderView()
            Spacer()
            MetricsInfoView()
        }
        .padding(32)
        .environmentObject(appModel)
        .onAppear() {
            appModel.load()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                BottomMenuView()
                    .environmentObject(appModel)
            }
        }
    }
}
