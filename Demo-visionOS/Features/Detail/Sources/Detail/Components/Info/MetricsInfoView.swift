//
//  MetricsInfoView.swift
//  Detail
//
//  Created by Alfonso Boizas Crespo on 9/12/25.
//

import SwiftUI
import AppState
import Common

struct MetricsInfoView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    var body: some View {
        if let object = appModel.object {
            VStack(alignment: .leading, spacing: 12) {
                metricRow(
                    "Gravity",
                    value: InfoFormatter.formatGravity(object.gravity)
                )
                metricRow(
                    "Distance from Sun",
                    value: InfoFormatter.formatDistanceFromSun(object.distanceFromSun)
                )
                metricRow(
                    "Average temperature",
                    value: InfoFormatter.formatTemperature(object.temperature)
                )
                metricRow(
                    "Year duration",
                    value: InfoFormatter.formatYearDuration(object.yearDuration)
                )
                metricRow(
                    "Day length",
                    value: InfoFormatter.formatDayLength(object.dayLengthHours)
                )
                metricRow(
                    "Weight",
                    value: InfoFormatter.formatWeight(object.weight)
                )
                metricRow(
                    "Radius",
                    value: InfoFormatter.formatRadius(object.radius)
                )
                metricRow(
                    "Satellites",
                    value: InfoFormatter.formatSatellites(object.satellites)
                )
                metricRow(
                    "Artificial satellites (estimation)",
                    value: InfoFormatter.formatSatellites(object.artificialSatellitesEstimation)
                )
            }
            .padding(.top, 24)
        } else {
            ProgressView("Loading object info...")
                .padding(.top, 24)
        }
    }
    
    @ViewBuilder
    func metricRow(_ title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
        }
    }
}
