//
//  LoginView.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    
    var body: some View {
        VStack {
            KakaoButton()
            GoogleButton()
            /*
            GoogleSignInButton(action: handleSignInButton)
                .frame(width : UIScreen.main.bounds.width * 0.9)
                .multilineTextAlignment(.center)*/
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

