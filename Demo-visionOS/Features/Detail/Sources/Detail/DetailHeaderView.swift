//
//  DetailHeaderView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 9/12/25.
//

import SwiftUI
import AppState

struct DetailHeaderView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    // MARK: - Immersive space handling
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        HStack {
            Text(appModel.object?.name ?? "Unknown")
                .font(.extraLargeTitle2)
            
            Spacer()
            
            Button(appModel.isImmersiveSpaceOpen ? "Hide" : "Show") {
                showOrHide()
            }
        }
    }
    
    func showOrHide() {
        Task {
            if appModel.isImmersiveSpaceOpen {
                await dismissImmersiveSpace()
                appModel.isImmersiveSpaceOpen = false
            } else {
                let result = await openImmersiveSpace(id: AppModel.immersiveSpaceName)
                switch result {
                case .opened:
                    appModel.isImmersiveSpaceOpen = true
                case .userCancelled, .error:
                    appModel.isImmersiveSpaceOpen = false
                @unknown default:
                    appModel.isImmersiveSpaceOpen = false
                }
            }
        }
    }
}
