//
//  TrazzleNavLink.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import SwiftUI

struct TrazzleNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    let tag: Int?
    let selection: Binding<Int?>
    
    init(destination: Destination,
         tag: Int? = nil,
         selection:Binding<Int?> = .constant(0),
         @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
        self.selection = selection
        self.tag = tag
    }
    
    var body: some View {
        NavigationLink(tag: tag ?? 0,
                       selection: selection,
                       destination: {
            TrazzleNavBarContainerView {
                destination
            }
            .navigationBarHidden(true)
        },
                       label: { label })
        //        NavigationLink(
        //            destination:
        //                TrazzleNavBarContainerView {
        //                    destination
        //                }
        //                .navigationBarHidden(true)
        //            ,
        //            label: {
        //                label
        //            })
    }
}

struct TrazzleNavLink_Previews: PreviewProvider {
    static var previews: some View {
        TrazzleNavView {
            TrazzleNavLink(
                destination: Text("destination")) {
                    Text("click me")
                }
        }
        
    }
}

