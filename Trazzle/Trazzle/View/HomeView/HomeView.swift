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
        ScrollView(.horizontal, showsIndicators: false) {
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
