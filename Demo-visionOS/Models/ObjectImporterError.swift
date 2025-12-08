//
//  ObjectImporterError.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Foundation

enum ObjectImporterError: LocalizedError {
    case missingInBundle
    case missingInJson
    
    var errorDescription: String? {
        switch self {
        case .missingInBundle:
            "Missing model in app Bundle"
        case .missingInJson:
            "Missing model in JSON"
        }
    }
}
