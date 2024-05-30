// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parser = try? JSONDecoder().decode(Parser.self, from: jsonData)

import Foundation

// MARK: - Parser
struct Parser: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentUnits: CurrentUnits
    let current: Current

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
    }
}

// MARK: - Current
struct Current: Codable {
    let time: String
    let interval: Int
    let temperature2M, apparentTemperature, windSpeed10M: Double

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case windSpeed10M = "wind_speed_10m"
    }
}

// MARK: - CurrentUnits
struct CurrentUnits: Codable {
    let time, interval, temperature2M, apparentTemperature: String
    let windSpeed10M: String

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case windSpeed10M = "wind_speed_10m"
    }
}
