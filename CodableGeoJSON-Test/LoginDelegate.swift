//
//  LoginDelegate.swift
//  MapKit2
//
//  Created by joomin on 3/25/24.
//

import Foundation
import UIKit
import KakaoSDKCommon

class LoginDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // 메인번들에 있는 카카오 앱키 불러오기
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""

        // kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        return true
    }
}
