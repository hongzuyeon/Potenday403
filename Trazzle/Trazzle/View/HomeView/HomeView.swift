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
        ZStack{
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
                }
                // from a quick google, 1.65 is apparently best for a mercator map
                .aspectRatio(1.65, contentMode: .fill)
            }.ignoresSafeArea()
            
            VStack {
                HomeNavView()
                    .frame(height: 52, alignment: .top)
                Spacer()
                HStack() {
                    Spacer()
                    Button(action: {
                        print("floating button action")
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding()
                    })
                    .background(Color.mainGreen)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0 , y: 4)
                    Spacer().frame(width: 16)
                }
                Spacer().frame(height: 40)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.homeBgColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
