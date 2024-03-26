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
    @State var tag: Int? = 0
    
    var body: some View {
        TrazzleNavView {
            ZStack(alignment: .bottomTrailing) {
                TrazzleNavLink(destination: CountryListView(),
                               tag: 1,
                               selection: $tag) {
                                    
                }.trazzleNavBarItems(title: "여행 기록", hidden: false)
                
                ScrollView([.horizontal],
                           showsIndicators: false) {
                    Canvas(rendersAsynchronously: true) { context, size in
                        let drawer = GeoJSONMapDrawer(featureCollection: homeVM.loadGeojson(),
                                                      colorDict: [
                                                        "RU": .mainGreen,
                                                      ])
                        drawer.drawMap(borderColor: .homeBgColor,
                                       borderWidth: 1.6,
                                       size: size,
                                       context: context)
                    } //Canvas
                    // from a quick google, 1.65 is apparently best for a mercator map
                    .aspectRatio(1.65, contentMode: .fill)
                }// ScrollView
                Button(action: {
                    print("floating button action")
                    self.tag = 1
                }, label: {
                    Image(systemName: "plus") // 이미지 결정 시 추후 변경
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding()
                })// Floating Button
                .background(Color.mainGreen)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0 , y: 4)
                .offset(x: -16, y: -40)
            }
            .trazzleNavBarItems(title: "MY Travel", hidden: true)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
