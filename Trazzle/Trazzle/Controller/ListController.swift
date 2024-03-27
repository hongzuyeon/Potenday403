//
//  ListController.swift
//  Trazzle
//
//  Created by joomin on 3/27/24.
//

import Foundation


class ListController: ObservableObject {
    @Published var responseData: [Decodable] = []

    func fetchData<T: Decodable>(from url: String, model: T.Type) {
        // 요청할 API 엔드포인트 URL
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }

        // 네트워크 요청 생성
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // JSON 데이터 파싱
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([T].self, from: data)
                DispatchQueue.main.async {
                    self.responseData = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
