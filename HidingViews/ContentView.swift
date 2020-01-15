//
//  ContentView.swift
//  HidingViews
//
//  Created by George Elsham on 15/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isTextHidden = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .isHidden(isTextHidden)
            
            Spacer()
                .frame(height: 20)
            
            Button("Toggle Hidden") {
                self.isTextHidden.toggle()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
