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
    @State var navTitle: String = "MY Travel"
    
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
                HomeNavView(titleText: $navTitle)
                    .frame(height: 52, alignment: .top)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        print("floating button action")
                        if LoginManager.shared.isLoggedIn {
                            //CountryListView
                        } else {
                            //LoginView
                        }
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.all)
                    })
                    .background(Color.mainGreen)
                    .frame(width: 56, height: 56)
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

