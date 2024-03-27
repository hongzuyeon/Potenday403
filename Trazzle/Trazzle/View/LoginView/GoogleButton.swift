//
//  GoogleButton.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct GoogleButton: View {

    // GoogleSignInButtonViewModel 인스턴스 생성
        let viewModel = GoogleSignInButtonViewModel()

        var body: some View {
            Button(action: {
                // 버튼을 눌렀을 때 실행할 코드
                handleSignInButton()
            }) {
                // 버튼 내부 뷰
                Image("google_login_large_wide")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
            }
        }
    
    func handleSignInButton() {
        let signInConfig = GIDConfiguration.init(clientID: "com.googleusercontent.apps.637815114175-1ek25ia415ddh5co26ir60husqpnpqag")
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let result = signInResult else {
                // Inspect error
                return
            }
            // If sign in succeeded, display the app's main content View.
        }
    }
}



