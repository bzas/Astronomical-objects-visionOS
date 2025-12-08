//
//  Model3DInfo.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

public struct Model3DInfo: Sendable {
    
    public let modelName: String
    public let scale: SIMD3<Float>
    
    public init(
        modelName: String,
        scale: SIMD3<Float>
    ) {
        self.modelName = modelName
        self.scale = scale
    }
}
