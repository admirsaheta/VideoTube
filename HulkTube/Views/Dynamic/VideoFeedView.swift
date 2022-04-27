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
                VStack{
                    ForEach(data, id: \.id){ video in
                        Text(video.title)
                    }
                }
                .navigationBarTitle("Titles")
                
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


