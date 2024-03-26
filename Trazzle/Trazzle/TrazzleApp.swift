//
//  TrazzleApp.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct TrazzleApp: App {
    
    init() {
            // kakao SDK 초기화
            KakaoSDK.initSDK(appKey: "a9cf757f00972eaeff4befd171abe6b1")
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
