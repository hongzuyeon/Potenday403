//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "globe.americas.fill")
                    Text("홈")
                }
            MapCollectionView().tabItem {
                Image(systemName: "book.fill")
                Text("지도집")
            }
            
            .frame(height: 83)
        }
        .accentColor(.mainGreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
