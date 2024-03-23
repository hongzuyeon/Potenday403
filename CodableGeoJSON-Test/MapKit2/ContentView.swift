//
//  ContentView.swift
//  MapKit2
//
//  Created by 홍주연 on 2024/03/21.
//

import SwiftUI
import MapKit
import CodableGeoJSON

// CGPoint를 저장할 데이터 구조체 정의
struct CGPointData: Codable {
    let x: CGFloat
    let y: CGFloat
}

// CGPoint를 CGPointData로 변환하는 extension 추가
extension CGPoint {
    var asData: CGPointData {
        return CGPointData(x: self.x, y: self.y)
    }
}

struct ContentView: View {
    //    @State private var region = MKCoordinateRegion(
    //        center: CLLocationCoordinate2D(latitude: 37.5111158,
    //                                       longitude: 127.098167),
    //        span: MKCoordinateSpan(latitudeDelta: 0.1,
    //                               longitudeDelta: 0.1))
    
    @State private var currentScale: CGFloat = 0
    @State private var finalScale: CGFloat = 1
    
    var body: some View {
        
        // JSON 데이터를 파싱하여 저장할 모델
        @State var countriesData: CountryData? = nil
        
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
            
            //world 데이터 연결
            if let url = Bundle.main.url(forResource: "world", withExtension: "json") {
                // JSON 파일이 있으므로 해당 URL을 사용하여 데이터를 읽을 수 있음
                do {
                    let jsonData = try Data(contentsOf: url)
                    // jsonData를 사용하여 원하는 작업을 수행
                    
                    do {
                        countriesData = try JSONDecoder().decode(CountryData.self, from: jsonData)
                        print("countriesData: \(countriesData)")
                        
                        if let countriesData = countriesData {
                            let result = findNearestCountryName(to: location, countriesData: countriesData)
                            
                            print("결과:")
                            print(result)
                            
                        } else {
                            print("countriesData is nil")
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } catch {
                    print("Error reading JSON file:", error)
                }
            } else {
                print("JSON file not found")
            }
        }

        
        
    }
    
    
    // 가장 가까운 좌표를 찾아 해당하는 국가 이름 반환
    func findNearestCountryName(to point: CGPoint, countriesData: CountryData) -> String? {
        
        var nearestCountryName: String? = nil
        var minDistance = CGFloat.infinity
        
        // 모든 국가에 대해 반복하여 가장 가까운 좌표를 찾음
        for feature in countriesData.features {
            // 국가의 좌표를 반복
            if let coordinates = feature.geometry.coordinates.first {
                for coordinate in coordinates {
                    // coordinate를 사용하여 작업 수행
                    if coordinate.count == 2 {
                        // 국가의 좌표를 CGPoint로 초기화
                        let countryPoint = CGPoint(x: CGFloat(coordinate[0][0]), y: CGFloat(coordinate[0][1]))
                        
                        // 유클리드 거리 계산
                        let distance = sqrt(pow(point.x - countryPoint.x, 2) + pow(point.y - countryPoint.y, 2))
                        
                        // 현재까지 최소 거리보다 더 가까운 경우, 최소 거리 업데이트
                        if distance < minDistance {
                            minDistance = distance
                            nearestCountryName = feature.properties.name
                        }
                    }
                }
            } else {
                print("coordinates가 없음")
            }
        }
        
        return nearestCountryName
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
