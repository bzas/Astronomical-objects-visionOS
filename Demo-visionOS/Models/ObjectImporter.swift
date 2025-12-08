//
//  ObjectImporter.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Foundation

actor ObjectImporter {
    
    lazy var decoder: JSONDecoder = {
       JSONDecoder()
    }()
    
    func fetchInfo(
        _ object: AstronomicalObjectType
    ) throws -> AstronomicalObject {
        guard let url = Bundle.main.url(
            forResource: "AstronomicalObjectList",
            withExtension: "json"
        ) else {
            throw ObjectImporterError.missingInBundle
        }
        
        let data = try Data(contentsOf: url)
        let astronomicalObjectList = try decoder.decode(
            [AstronomicalObject].self,
            from: data
        )
        
        guard let astronomicalObject = astronomicalObjectList.first(where: { $0.id == object.rawValue }) else {
            throw ObjectImporterError.missingInJson
        }
        
        return astronomicalObject
    }
}
