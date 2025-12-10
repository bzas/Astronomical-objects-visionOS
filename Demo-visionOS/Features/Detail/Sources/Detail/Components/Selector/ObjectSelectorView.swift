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

    var body: some View {
        ScrollView {
            VStack {
                ForEach(appModel.objectList) { object in
                    ObjectCellView(
                        name: object.name,
                        iconName: object.model3DInfo.modelName,
                        isSelected: appModel.object?.id == object.id
                    )
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
}
