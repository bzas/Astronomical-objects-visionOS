//
//  AstronomicalObjectRepositoryProtocol.swift
//  Domain
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

public protocol AstronomicalObjectRepositoryProtocol: Sendable {
    
    func fetchAll() async throws -> [AstronomicalObject]
}
