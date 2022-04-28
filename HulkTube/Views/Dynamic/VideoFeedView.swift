//
//  VideoFeedView.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

import SwiftUI

struct VideoFeedView: View {
    
    @StateObject private var viewModel = VideoViewModel(service: VideoService())
    
    
    var body: some View {
        NavigationView{
            // Testing testing
            
            switch viewModel.state{
            case .success(let data):
                ScrollView{
                
                // Add LazyVStack for production
                    
                LazyVStack(alignment: .leading, spacing: 50){
                    ForEach(data, id: \.id){ video in
                        SingleVideoPostView(video: video)
                            .padding(.bottom, 30)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, UIScreen.main.bounds.height / 6)
            }
                .navigationTitle("HulkTube")
                
                
            case .loading:
                ProgressView()
                
            default:
                EmptyView()
            }
        }
        // OnAppear doesen't work with asnyc :/ But task does hehe
        .task {
            await viewModel.getVideos()
        }
    }
}


