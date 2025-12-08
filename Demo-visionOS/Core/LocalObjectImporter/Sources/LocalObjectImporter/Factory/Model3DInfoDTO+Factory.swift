//
//  Model3DInfoDTO+Factory.swift
//  LocalObjectImporter
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Domain

// MARK: - Convert to Domain object

extension Model3DInfoDTO {
    
    func toDomain() -> Model3DInfo {
        Model3DInfo(
            modelName: modelName,
            scale: scale
        )
    }
}
