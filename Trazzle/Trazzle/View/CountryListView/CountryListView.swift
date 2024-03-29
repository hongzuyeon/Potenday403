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
    
    
    init() {
        UITableView.appearance().backgroundColor = .white
        UICollectionView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        @State var searchText = ""
        var count = 0
        
        NavigationView {
            VStack(spacing: 0) {
                
                HStack {
                    BackButton()
                    Spacer()
                    Text("여행 기록")
                    Spacer()
                }
                .padding()
                .frame(height: 48)
                

                VStack() {
                    SearchBar(searchText: $searchText, placeHolder: "국가명으로 검색")
                        .padding()
                    
                    Text("총 \(count)개국")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 16)
                        .font(Font.system(size: 12))
                        .foregroundColor(.g300)
                        
                }.background(Color.g50)
                
                    
                
                if #available(iOS 16.0, *) {
                    List(countries, id: \.id) { country in
                        Text(country.name)
                            .listRowBackground(Color.white)
                    }.scrollContentBackground(.hidden)
                        .preferredColorScheme(.light)
                        .background(Color.g50)
                } else {
                    List(countries, id: \.id) { country in
                        Text(country.name)
                            .listRowBackground(Color.white)
                    }
                    .preferredColorScheme(.light)
                    .background(Color.g50)
                }
                
            }
            /*
            .navigationTitle("여행 기록")
            .background(Color.white)
            .foregroundColor(.black)
             */
        }
        
    }
}

struct BackButton: View {
    var body: some View {
        Button(action: {
            // 뒤로가기 버튼 기능 구현
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        }
    }
}

#Preview {
    CountryListView()
}
