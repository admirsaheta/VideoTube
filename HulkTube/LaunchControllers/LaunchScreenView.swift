//
//  LaunchScreenView.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

// MARK: Imports

import SwiftUI

// MARK: Body


struct LaunchScreenView: View {
    
    // MARK: Vars
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive == true {
            VideoFeedView()
        } else {
            VStack{
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 100, alignment: .center)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7){
                    self.isActive = true
                }
            }
            
            
        }
    }
    
}


