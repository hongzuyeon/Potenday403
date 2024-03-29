//
//  AppleButton.swift
//  Trazzle
//
//  Created by joomin on 3/27/24.
//

import SwiftUI

struct AppleButton: View {
    var body: some View {
        Button {
            
            //애플 로그인
            
        } label : {
            Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)
                    .cornerRadius(16) // 버튼을 rounded로 만듦
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
                    .overlay(
                        HStack {
                            // 아이콘 이미지 추가
                            Image("apple_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            // 텍스트 추가
                            Text("Apple로 계속하기")
                                .foregroundColor(.white)
                        }
                    )
        }.padding(8)
    }
}

//#Preview {
//    AppleButton()
//}
