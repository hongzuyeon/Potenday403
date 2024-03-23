//
//  ContentView.swift
//  MapKit2
//
//  Created by 홍주연 on 2024/03/21.
//

import SwiftUI
import MapKit
import CodableGeoJSON

struct ContentView: View {
    //    @State private var region = MKCoordinateRegion(
    //        center: CLLocationCoordinate2D(latitude: 37.5111158,
    //                                       longitude: 127.098167),
    //        span: MKCoordinateSpan(latitudeDelta: 0.1,
    //                               longitudeDelta: 0.1))
    
    @State private var currentScale: CGFloat = 0
    @State private var finalScale: CGFloat = 1
    
    var body: some View {
        Canvas(rendersAsynchronously: true) { context, size in
            // as an example, I coloured Russia green
            let drawer = GeoJSONMapDrawer(featureCollection: loadGeojson(),
                                          colorDict: [
                                            // the keys in this dictionary corresponds to the "id" property in each feature
                                            "CN": .red
                                          ])
            drawer.drawMap(borderColor: .black,
                           borderWidth: 1,
                           size: size,
                           context: context)
        }
        // from a quick google, 1.65 is apparently best for a mercator map
        .aspectRatio(1.65, contentMode: .fit)
        .scaleEffect(finalScale + currentScale)
        .gesture(
            MagnificationGesture().onChanged { newScale in
                currentScale = newScale
            }.onEnded{ scale in
                finalScale = scale
                currentScale = 0
            }
        )
        .onTapGesture(coordinateSpace: .global) { location in
            print("Tapped at \(location)")
        }
        
        
        
        
    }
    
    func loadGeojson() -> MapFeatureCollection {
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "world", withExtension: "json")!)
        return try! JSONDecoder().decode(MapFeatureCollection.self, from: data)
    }
    //        Map(coordinateRegion: $region)
    //        {
    
    //            MapPolygon(coordinates: CLLocationCoordinate2D(latitude: 11.3844028,
    //                                                           longitude: 45.6174815).locations)
    //                        .stroke(.purple.opacity(0.7), lineWidth: 5)
    //                        .foregroundStyle(.purple.opacity(0.7))
    //        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
