//
//  AstronomicalObject.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import Foundation

public struct AstronomicalObject: Sendable {
    
    public let id: Int
    public let name: String
    public let model3DInfo: Model3DInfo
    public let gravity: Float
    public let distanceFromSun: Float // Millions of Kms
    public let temperature: Float // Celsius
    public let yearDuration: Float // Days
    public let weight: Float
    public let radius: Float // Kms
    
    public init(
        id: Int,
        name: String,
        model3DInfo: Model3DInfo,
        gravity: Float,
        distanceFromSun: Float,
        temperature: Float,
        yearDuration: Float,
        weight: Float,
        radius: Float
    ) {
        self.id = id
        self.name = name
        self.model3DInfo = model3DInfo
        self.gravity = gravity
        self.distanceFromSun = distanceFromSun
        self.temperature = temperature
        self.yearDuration = yearDuration
        self.weight = weight
        self.radius = radius
    }
}
