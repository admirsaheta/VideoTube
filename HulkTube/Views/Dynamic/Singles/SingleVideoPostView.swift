//
//  SingleVideoPostView.swift
//  HulkTube
//
//  Created by admin on 28.4.22..
//
import AVKit
import SwiftUI
import Combine
import AVFoundation

struct SingleVideoPostView: View {
    
    
// There is an option of adding a custom video player // which would require a tad-bit more time and hassling. If you look in the codebase there is a VideoPlayerView which you can add to the view and alter to ur needs with a few parameters.
// Example would be
    
// MARK: Code Example - Start -

// VideoPlayerView(player: player ( // needs to be defined first, gravity: ( // Gravity which is defined )
// .frame ( // Modifier to define the size )
// .onAppear(perform: {
//        let asset = AVAsset(url: URL(string: video.sources)!)
//        player?.replaceCurrentItem(with: AVPlayerItem(asset: asset))
//    })
    
// MARK: Code Example - End -
    
    
// After which you could make a Controller with Video Player options e.g play, pause, scrub seek or add custom gestures ( would be in uikit
// then you could use it with UIViewRepresentable in SwiftUI ) :D
    

    
    @StateObject private var viewModel = VideoViewModel(service: VideoService())
    let video: Video

    
   

  
    
    var body: some View {
        VStack{
            switch viewModel.state{
            case .success:
                let fileUrl = URL(string: video.sources)
                let player = AVPlayer(url: fileUrl!)
               
                VStack(alignment: .leading){
                    
                    VideoPlayer(player: player)
                        .scaledToFit()
                        .onAppear(perform: {
                            player.play()
                            player.isMuted = true
                        })
                        .onDisappear(perform: {
                         
                            // Seems like I should do nothing here :/
                            
                        })
                        
                    
                       
                    
                    Text(video.title)
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding([.leading, .bottom], 10)
                        
                    
                    Text(video.videoDescription)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                        .padding(.bottom, 20)
                        
                    
        
                }
               
                .background(Color(.label).opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 15)
               
               
                
            case .loading:
                ProgressView()
                
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getVideos()
        }
    }
}

