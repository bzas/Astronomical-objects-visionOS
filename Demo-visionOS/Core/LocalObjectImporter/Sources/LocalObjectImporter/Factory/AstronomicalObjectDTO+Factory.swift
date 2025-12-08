//
//  AstronomicalObjectDTO+Factory.swift
//  LocalObjectImporter
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Domain

// MARK: - Convert to Domain object

extension AstronomicalObjectDTO {
    
    func toDomain() -> AstronomicalObject {
        AstronomicalObject(
            id: id,
            name: name,
            model3DInfo: model3DInfo.toDomain(),
            gravity: gravity,
            distanceFromSun: distanceFromSun,
            temperature: temperature,
            yearDuration: yearDuration,
            weight: weight,
            radius: radius
        )
    }
}
