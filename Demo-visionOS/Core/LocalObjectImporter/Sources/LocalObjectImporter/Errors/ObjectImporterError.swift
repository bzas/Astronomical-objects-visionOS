//
//  ObjectImporterError.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Foundation

public enum ObjectImporterError: LocalizedError {
    
    case missingInBundle
    case missingInJson
    
    public var errorDescription: String? {
        switch self {
        case .missingInBundle:
            "Missing model in app Bundle"
        case .missingInJson:
            "Missing model in JSON"
        }
    }
}
