//
//  CountryData.swift
//  MapKit2
//
//  Created by joomin on 3/23/24.
//

import Foundation

// 국가 정보 모델
struct CountryData: Codable {
    let type: String
    let features: [Feature]
}

struct Feature: Codable {
    let type: String
    let geometry: Geometry
    let properties: Properties
}

struct Geometry: Codable {
    let type: String
    let coordinates: [[[[Double]]]] // "coordinates" 필드를 배열의 배열의 배열의 Double로 변경
}

struct Properties: Codable {
    let name: String
    let id: String?
}
