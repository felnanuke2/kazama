//
//  SearchLocation.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchResults = try? newJSONDecoder().decode(SearchResults.self, from: jsonData)

import Foundation

// MARK: - SearchResult
class SearchResult: Codable {
    let id: Int
    let name: String
    let region: String
    let country: String
    let lat, lon: Double
    let url: String

    init(id: Int, name: String, region: String, country: String, lat: Double, lon: Double, url: String) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.url = url
    }
}




typealias SearchResults = [SearchResult]
