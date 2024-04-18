//
//  LoginView.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View, DispatchCompletionDelegate {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color(.white)
                .ignoresSafeArea(.all)
            
            Image("login_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                KakaoButton(delegate: self)
                GoogleButton(delegate: self)
                AppleButton(delegate: self)
                
                Text("로그인 및 회원가입시, 아래 내용에 동의하는 것으로 간주됩니다.")
                    .foregroundColor(.g400)
                    .font(Font.system(size: 12))
                    .padding(.vertical, 12)
                
                HStack {
                    Text("약관 동의")
                        .foregroundColor(.g400)
                        .underline(true, color: .g400)
                    
                    Text("개인정보처리방침")
                        .foregroundColor(.g400)
                        .underline(true, color: .g400)
                }
            }
            
        }
    }
    
    func dispatchQueueDidFinishTask() {
            print("DispatchQueue 작업이 완료되었습니다.")
            dismiss()
        }
}

