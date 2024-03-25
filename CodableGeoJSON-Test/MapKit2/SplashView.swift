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
            Color(hex: 0x19AE43)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("Trazzle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
    }
}

// Color를 16진수로 생성하는 extension입니다.
extension Color {
    init(hex: Int, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

#Preview {
    SplashView()
}
