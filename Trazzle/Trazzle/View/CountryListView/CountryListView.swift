//
//  CountryListView.swift
//  Trazzle
//
//  Created by joomin on 3/27/24.
//

import SwiftUI

struct CountryListView: View {
    
    @State private var countries: [Country] = [
        Country(name: "Afghanistan", id: "AF"),
        Country(name: "Albania", id: "AL"),
        Country(name: "Algeria", id: "DZ"),
        Country(name: "American Samoa", id: "AS"),
        Country(name: "Andorra", id: "AD"),
        Country(name: "Angola", id: "AO"),
        Country(name: "Anguilla", id: "AI"),
        Country(name: "Antarctica", id: "AQ"),
        Country(name: "Antigua and Barbuda", id: "AG"),
        Country(name: "Argentina", id: "AR"),
        Country(name: "Armenia", id: "AM"),
        Country(name: "Aruba", id: "AW"),
        Country(name: "Australia", id: "AU"),
        Country(name: "Austria", id: "AT"),
        Country(name: "Azerbaijan", id: "AZ"),
        Country(name: "Bahamas", id: "BS"),
        Country(name: "Bahrain", id: "BH"),
        Country(name: "Bangladesh", id: "BD")
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                VStack {
                }
                .navigationBarItems(trailing: EmptyView()) // 우측에 공간 추가
                .navigationBarTitleDisplayMode(.inline) // 타이틀을 가운데 정렬하기 위해 필요
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        // 뒤로가기 버튼 또는 다른 필요한 버튼 추가
                        BackButton()
                    }
                    ToolbarItem(placement: .principal) {
                        // 텍스트 뷰를 사용하여 navigationTitle 대체
                        Text("여행 기록")
                            .font(.subheadline) // 타이틀의 크기 설정
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        // 우측에 공간 추가
                        EmptyView()
                    }
                }
                
                
                
                List(countries, id: \.id) { country in
                    Text(country.name)
                }
            }
            .navigationTitle("여행 기록") // 네비게이션 타이틀 설정
        }
        
    }
}

struct BackButton: View {
    var body: some View {
        Button(action: {
            // 뒤로가기 버튼 기능 구현
        }) {
            Image(systemName: "arrow.left")
        }
    }
}

#Preview {
    CountryListView()
}
