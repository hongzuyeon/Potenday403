//
//  HomeView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/25.
//

import SwiftUI
import CodableGeoJSON

struct HomeView: View {
    
    var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.horizontal,
                       showsIndicators: false) {
                Canvas(rendersAsynchronously: true) { context, size in
                    let drawer = GeoJSONMapDrawer(featureCollection: homeVM.loadGeojson(),
                                                  colorDict: [
                                                    "RU": .mainGreen,
                                                  ])
                    drawer.drawMap(borderColor: .black,
                                   borderWidth: 1,
                                   size: size,
                                   context: context)
                }
                // from a quick google, 1.65 is apparently best for a mercator map
                .aspectRatio(1.65, contentMode: .fill)
            }
            
            // Floating Button
            Button(action: {
                print("floating button action")
            }, label: {
                Image(systemName: "plus") // 이미지 결정 시 추후 변경
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color.mainGreen)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 4, x: 0 , y: 4)
            .offset(x: -16, y: -40)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
