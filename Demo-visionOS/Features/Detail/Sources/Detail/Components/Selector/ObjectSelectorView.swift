//
//  ObjectSelectorView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 10/12/25.
//

import SwiftUI
import AppState

struct ObjectSelectorView: View {
    
    @EnvironmentObject var appModel: AppModel
    
    // MARK: - Immersive space handling
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        ScrollView {
            VStack {
                ForEach(appModel.objectList) { object in
                    ObjectCellView(
                        name: object.name,
                        iconName: object.model3DInfo.modelName,
                        isSelected: appModel.object?.id == object.id
                    )
                    .onTapGesture {
                        Task {
                            await reloadModel(id: object.id)
                        }
                    }
                }
            }
            .padding(12)
        }
        .frame(maxHeight: 600)
        .scrollIndicators(.hidden)
        .glassBackgroundEffect(
            in: RoundedRectangle(
                cornerSize: CGSize(
                    width: 15,
                    height: 15
                )
            )
        )
    }
    
    func reloadModel(id: Int) async {
        appModel.selectObject(id: id)
        
        guard appModel.isImmersiveSpaceOpen else { return }
        
        await dismissImmersiveSpace()
        appModel.isImmersiveSpaceOpen = false
        
        let result = await openImmersiveSpace(id: AppModel.immersiveSpaceName)
        switch result {
        case .opened:
            appModel.isImmersiveSpaceOpen = true
        default:
            appModel.isImmersiveSpaceOpen = false
        }
    }
}
