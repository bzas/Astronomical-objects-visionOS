//
//  AstronomicalObjectType.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Foundation

public enum AstronomicalObjectType: Int, Sendable {
    
    // MARK: - Solar System planets
    
    case mercury = 0
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    case pluto
    
    // MARK: - Others
    
    case sun
    case moon
    case blackHole
}
