//
//  CityListView.swift
//  Trazzle
//
//  Created by joomin on 3/29/24.
//

import SwiftUI

struct CityListView: View {
    let country: Country
    let cities = ["New York", "London", "Paris", "Tokyo", "Sydney", "Rome", "Berlin", "Moscow", "Seoul", "Beijing",
                  "New York", "London", "Paris", "Tokyo", "Sydney", "Rome", "Berlin", "Moscow", "Seoul", "Beijing"]
        
        init(country: Country) {
            self.country = country
        }
    
    var body: some View {
        ZStack {
            
            VStack {
                
                List(cities, id: \.self) { city in
                                Text(city)
                            }
                
                MainButton(buttonText: "다음")
                    .frame(maxWidth: .infinity)
                
            }.navigationTitle(country.name)
            
        }
    }
}


struct CancelButton: View {
    var body: some View {
        Button(action: {
            // 뒤로가기 버튼 기능 구현
        }) {
            Image(systemName: "xmark")
                .foregroundColor(.black)
        }
    }
}


//#Preview {
//    let country = Country(name: "Korea", code: "KR")
//    CityListView(country: country)
//}
