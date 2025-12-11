//
//  HeaderView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 9/12/25.
//

import SwiftUI
import AppState

struct HeaderView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    // MARK: - Immersive space handling
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            HStack {
                Text(appModel.object?.name ?? "")
                    .font(.extraLargeTitle2)
                
                Spacer()
                
                Button(appModel.isImmersiveSpaceOpen ? "Hide" : "Show") {
                    showOrHide()
                }
            }
            
            Text(appModel.object?.description ?? "")
                .font(.body)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.leading)
                .padding(.top, 12)
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
                default:
                    appModel.isImmersiveSpaceOpen = false
                }
            }
        }
    }
}
