//
//  KakaoButton.swift
//  Trazzle
//
//  Created by joomin on 3/25/24.
//


import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct KakaoButton: View{
    var body: some View{
        Button {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카카오톡이 설치되어있는 경우
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    if let oauthToken = oauthToken{
                        // 소셜 로그인(회원가입 API CALL)
                        print(oauthToken)
                    }
                }
            } else {
                //카카오톡이 설치되어있지 않은 경우 카카오 계정으로 로그인하는 함수
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    if let oauthToken = oauthToken{
                        print("kakao success")
                        // 소셜 로그인(회원가입 API CALL)
                    }
                }
            }
        } label : {
            Color(red: 254 / 255, green: 229 / 255, blue: 0 / 255)
                    .cornerRadius(16) // 버튼을 rounded로 만듦
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
                    .overlay(
                        HStack {
                            // 아이콘 이미지 추가
                            Image("kakao_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            // 텍스트 추가
                            Text("카카오로 계속하기")
                                .foregroundColor(.black)
                        }
                    )
        }.padding(4)
    }
}
