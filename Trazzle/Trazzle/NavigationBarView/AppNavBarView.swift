//
//  AppNavBarView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//
// https://www.youtube.com/watch?v=aIDT4uuMLHc&list=PLwvDm4Vfkdphc1LLLjCaEd87BEg07M97y&index=14

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        TrazzleNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                TrazzleNavLink(destination:Text("destination")
                    .trazzleNavigationTitle("second screen")
                ) {
                    Text("Navigate")
                }
            }
            .trazzleNavBarItems(title: "Custom TItle!", hidden: true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination: Text("destination")
                        .navigationTitle("title 2")
                        .navigationBarBackButtonHidden(false),
                    label: {
                        Text("Navigate")
                    })
            }
            .navigationTitle("Nav title here")
        }
    }
}
