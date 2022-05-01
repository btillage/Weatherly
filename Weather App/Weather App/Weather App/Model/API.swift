//
//  API.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import Foundation

// MARK: - Welcome
struct WeatherResponse: Codable {
    let forecast: [Forecast]
}

// MARK: - Forecast
struct Forecast: Codable {
    let name: String
    let temperature: Int
    let unit: Unit
    let forecastDescription: String

    enum CodingKeys: String, CodingKey {
        case name, temperature, unit
        case forecastDescription = "description"
    }
}

enum Unit: String, Codable {
    case f = "F"
}

