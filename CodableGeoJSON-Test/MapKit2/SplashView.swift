//
//  SplashView.swift
//  MapKit2
//
//  Created by joomin on 3/23/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
                    Color.blue
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("403 프로젝트")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
    }
}

#Preview {
    SplashView()
}
