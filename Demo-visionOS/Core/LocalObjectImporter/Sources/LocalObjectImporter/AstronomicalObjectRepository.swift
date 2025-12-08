//
//  AstronomicalObjectRepository.swift
//  LocalObjectImporter
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Domain
import Foundation

public actor AstronomicalObjectRepository: AstronomicalObjectRepositoryProtocol {
    
    public init() {}
    
    public func fetchInfo(_ object: AstronomicalObjectType) async throws -> AstronomicalObject {
        guard let url = Bundle.module.url(
            forResource: "AstronomicalObjectList",
            withExtension: "json"
        ) else {
            throw ObjectImporterError.missingInBundle
        }
        
        let data = try Data(contentsOf: url)
        let astronomicalObjectList = try JSONDecoder().decode(
            [AstronomicalObjectDTO].self,
            from: data
        )
        
        guard let astronomicalObject = astronomicalObjectList.first(where: { $0.id == object.rawValue }) else {
            throw ObjectImporterError.missingInJson
        }
        
        return astronomicalObject.toDomain()
    }
}
