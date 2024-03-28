//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "globe.americas.fill")
                        Text("홈")
                    }
                ExploreView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("탐험")
                    }
                MapCollectionView().tabItem {
                    Image(systemName: "book.fill")
                    Text("지도집")
                }
            }
            .accentColor(.mainGreen)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
