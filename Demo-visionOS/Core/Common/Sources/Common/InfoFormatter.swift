//
//  InfoFormatter.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import Foundation

public struct InfoFormatter {
    
    public static func formatGravity(_ gravity: Float) -> String {
        String(format: "%.2f m/s²", gravity)
    }
    
    public static func formatDistanceFromSun(_ distance: Float) -> String {
        String(format: "%.0f M km", distance)
    }
    
    public static func formatTemperature(_ temperature: Float) -> String {
        String(format: "%.0f ºC", temperature)
    }
    
    public static func formatYearDuration(_ yearDuration: Float) -> String {
        String(format: "%.0f days", yearDuration)
    }
    
    public static func formatDayLength(_ hours: Float) -> String {
        String(format: "%.1f hours", hours)
    }
    
    public static func formatRadius(_ radius: Float) -> String {
        String(format: "%.0f km", radius)
    }
    
    public static func formatSatellites(_ satellites: Int) -> String {
        "\(satellites)"
    }
    
    public static func formatWeight(_ weight: Float) -> String {
        guard weight != 0 else { return "0 kg" }
        
        let exponent = floor(log10(abs(weight)))
        let powerOfTen = pow(10.0 as Float, exponent)
        let coefficient = weight / powerOfTen
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 3
        
        let coefficientString = numberFormatter.string(from: NSNumber(value: coefficient)) ?? String(format: "%.3f", coefficient)
        return "\(coefficientString) × 10^\(Int(exponent)) kg"
    }
}
