//
//  LoginSender.swift
//  Trazzle
//
//  Created by joomin on 3/29/24.
//

import Foundation

class LoginSender {
    
    func sendData(url: String, accessToken: String, oauthProvider: String) {
        print("url: \(url)")
        print("accessToken: \(accessToken)")
        print("oauthProvider: \(oauthProvider)")
        
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }

        let parameters = ["accessToken": accessToken, "oauthProvider": oauthProvider]
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters) else {
            print("Failed to serialize data")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("login token send Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data in response")
                return
            }

            /*
            do {
                let decodedResponse = try JSONDecoder().decode(response.self, from: data)
                DispatchQueue.main.async {
                    self.responseMessage = decodedResponse.message
                }
            } catch {
                print("Error decoding response: \(error)")
            }
             */
        }.resume()
    }
    
}


