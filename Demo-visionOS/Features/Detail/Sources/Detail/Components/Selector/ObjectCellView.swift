//
//  ObjectCellView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 10/12/25.
//

import SwiftUI

struct ObjectCellView: View {
    
    var name: String
    var iconName: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(iconName)
                .resizable()
                .scaledToFit()
            Text(name)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(4)
        .padding(.bottom, 2)
        .frame(width: 75, height: 75)
        .background(isSelected ? .white.opacity(0.4) : .clear)
        .background(.regularMaterial)
        .clipShape(
            RoundedRectangle(
                cornerSize: CGSize(
                    width: 10,
                    height: 10
                )
            )
        )
    }
}
