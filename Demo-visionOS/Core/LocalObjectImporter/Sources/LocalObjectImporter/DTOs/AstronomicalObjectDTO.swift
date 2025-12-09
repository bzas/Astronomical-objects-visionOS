//
//  AstronomicalObjectDTO.swift
//  LocalObjectImporter
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

struct AstronomicalObjectDTO: Codable {
    
    let id: Int
    let name: String
    let model3DInfo: Model3DInfoDTO
    let gravity: Float
    let distanceFromSun: Float // Millions of Kms
    let temperature: Float // Celsius
    let yearDuration: Float // Days
    let dayLengthHours: Float // Hours
    let weight: Float
    let radius: Float // Kms
    let satellites: Int
    let artificialSatellitesEstimation: Int
}
