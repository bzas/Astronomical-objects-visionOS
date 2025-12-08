//
//  AstronomicalObject.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import Foundation

struct AstronomicalObject: Codable {
    
    let id: Int
    let name: String
    let model3DInfo: Model3DInfo
    let gravity: Float
    let distanceFromSun: Float // Millions of Kms
    let temperature: Float // Celsius
    let yearDuration: Float // Days
    let weight: Float
    let radius: Float // Kms
}
