//
//  HomeViewModel.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/26.
//

import Foundation

class HomeViewModel {
    
    static let shared = HomeViewModel()
    
    func loadGeojson() -> MapFeatureCollection? {
        guard let url = Bundle.main.url(forResource: "world", withExtension: "json") else {
            print(">> world.json 파일 없음")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print(">> world.json 데이터 변환 실패")
            return nil
        }
        
        return try? JSONDecoder().decode(MapFeatureCollection.self, from: data)
    }
}
