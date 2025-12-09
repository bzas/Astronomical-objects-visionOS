//
//  DetailObjectInfoView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AppState

public struct DetailObjectInfoView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    public init() {}
        
    public var body: some View {
        VStack {
            DetailHeaderView()
            Spacer()
            DetailMetricsInfoView()
        }
        .padding(32)
        .environmentObject(appModel)
        .onAppear() {
            appModel.load()
        }
    }
}
