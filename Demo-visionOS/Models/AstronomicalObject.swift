//
//  AstronomicalObject.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

struct AstronomicalObject {
    
    let name: String
    let model3DInfo: Model3DInfo
    let gravity: Float
    let distanceFromSun: Float // Millions of Kms
    let temperature: Float // Celsius
    let yearDuration: Float // Days
    let weight: Float
    let radius: Float // Kms
    
    static let earth = AstronomicalObject(
        name: "Earth",
        model3DInfo: Model3DInfo(
            modelName: "Earth",
            scale: SIMD3(x: 0.005, y: 0.005, z: 0.005)
        ),
        gravity: 9.81,
        distanceFromSun: 149.6,
        temperature: 15,
        yearDuration: 365.25,
        weight: 5.97e24,
        radius: 6371
    )
}
