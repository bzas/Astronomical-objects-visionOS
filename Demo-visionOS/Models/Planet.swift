//
//  Planet.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

struct Planet {
    
    let name: String
    let modelName: String
    let gravity: Float
    let distanceFromSun: Float // Millions of Kms
    let temperature: Float // Celsius
    let yearDuration: Float // Days
    let weight: Float
    let radius: Float // Kms
    
    static let earth = Planet(
        name: "Earth",
        modelName: "Earth",
        gravity: 9.81,
        distanceFromSun: 149.6,
        temperature: 15,
        yearDuration: 365.25,
        weight: 5.97e24,
        radius: 6371
    )
}
