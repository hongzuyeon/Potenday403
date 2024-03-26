//
//  GeoJSONMapDrawer.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/26.
//

import CodableGeoJSON
import Foundation
import SwiftUI

struct CountryProperties: Codable {
    let name: String
}

typealias MapFeatureCollection = GeoJSONFeatureCollection<MultiPolygonGeometry, CountryProperties>

struct GeoJSONMapDrawer {
    let featureCollection: MapFeatureCollection?
    
    let colorDict: [GeoJSONFeatureIdentifier: Color]
    
    func drawMap(borderColor: Color, borderWidth: CGFloat,
                 size: CGSize, context: GraphicsContext) {
        
        func transformProjectedPoint(_ point: CGPoint) -> CGPoint {
            point
                .applying(CGAffineTransform(scaleX: size.width, y: size.height))
        }
        
        guard let featureCollection = self.featureCollection else { return }
        let features = featureCollection.features
        for feature in features {
            guard let multipolygon = feature.geometry?.coordinates else { continue }
            var multiPolygonPath = Path()
            let fillColor = colorDict[feature.id ?? ""] ?? .mapBlankColor
            for polygon in multipolygon {
                let firstLinearRing = polygon.first!
                for (index, position) in firstLinearRing.enumerated() {
                    if index == 0 {
                        multiPolygonPath.move(to:
                                                transformProjectedPoint(project(long: position.longitude,
                                                                                lat: position.latitude))
                        )
                    } else {
                        multiPolygonPath.addLine(to:
                                                    transformProjectedPoint(project(long: position.longitude,
                                                                                    lat: position.latitude))
                        )
                    }
                }
                multiPolygonPath.closeSubpath()
            }
            context.fill(multiPolygonPath, with: .color(fillColor))
            context.stroke(multiPolygonPath, with: .color(borderColor), lineWidth: borderWidth)
        }
        print("Done!")
    }
    
    // this converts a longitude and latitude into a coordinate in a unit square
    func project(long: Double, lat: Double) -> CGPoint {
        let lowestLongitude: Double = -180
        let longitudeRange: Double = 360
        // the top and bottom of the map needs to be truncated,
        // because of how the mercator projection works
        // here I truncated the top 10 degrees and the bottom 24 degrees, as is standard
        let lowestLatitudeMercator: Double = mercator(-66)
        let latitudeRangeMercator: Double = mercator(80) - mercator(-66)
        let projectedLong = CGFloat((long - lowestLongitude) / longitudeRange)
        let projectedLat = CGFloat(1 - ((mercator(lat) - lowestLatitudeMercator) / latitudeRangeMercator))
        return CGPoint(x: projectedLong, y: projectedLat)
    }
    
    func mercator(_ lat: Double) -> Double {
        asinh(tan(lat * .pi / 180))
    }
}
