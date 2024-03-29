//
//  TrazzleNavBarView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/26.
//

import SwiftUI

struct TrazzleNavBarView: View {
    // TODO
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            
            Spacer()
            titleSection
            Spacer()
        }
        .padding()
        .tint(.textBlack)
        
        .foregroundColor(.textBlack)
        .background(Color.white.opacity(0.6).ignoresSafeArea(edges:.top))
    }
}

struct TrazzleNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrazzleNavBarView(showBackButton: true,
                              title: "title here")
            Spacer()
        }
    }
}

// MARK: - Extensions
extension TrazzleNavBarView {
    private var backButton: some View {
        Button(
            action: {
                // TODO
                presentationMode.wrappedValue.dismiss()
            } ,label: {
                Image(systemName: "chevron.left")
            })
        
    }
    
    private var titleSection: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
    }
}
