//
//  MapKit2App.swift
//  MapKit2
//
//  Created by 홍주연 on 2024/03/21.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct MapKit2App: App {
    
    init() {
        
        // 메인번들에 있는 카카오 앱키 불러오기
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        print("key: \(kakaoAppKey)")
        
        // kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in
                            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                AuthController.handleOpenUrl(url: url)
                            }
                        })
                
        }
    }
}
