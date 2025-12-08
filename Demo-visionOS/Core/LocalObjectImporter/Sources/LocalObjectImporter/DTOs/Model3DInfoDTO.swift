//
//  Model3DInfoDTO.swift
//  LocalObjectImporter
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

struct Model3DInfoDTO: Codable {
    
    let modelName: String
    let scale: SIMD3<Float>
}
