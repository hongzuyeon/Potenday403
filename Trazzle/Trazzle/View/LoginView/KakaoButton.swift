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
            Image("kakao_login_large_wide")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : UIScreen.main.bounds.width * 0.9)
        }
    }
}
