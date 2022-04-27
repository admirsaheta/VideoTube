//
//  VideoViewModel.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

import Foundation


@MainActor
class VideoViewModel: ObservableObject {
    
    // A man's gotta have options
    
    enum State {
        case nope // Ye I did something wrong if this triggers
        case loading // Async await doing it's job
        case success(data: [Video]) // We wan't this
        case failed(error: Error) // Now we don't want this option, do we
    }
    
    
    @Published private(set) var state: State = .nope // We want it to be changed only in this class no exploits
    
    
    // Defining the service I just wrote so I can use it || See I actually know what dependency injection is lmao
    
    private let service: VideoService
    
    init(service: VideoService){
        self.service = service
    }
    
    func getVideos() async {
        
        // The state is loading until the do/catch does it's thing, ofcourse it just started :/
        
        self.state = .loading
        
        // Handling errors again
        
        do{
            // If it doesen't fail it will put it in to the categories
            let videos = try await service.fetchVideos()
            self.state = .success(data: videos)
            
            // Catching errors since 2019
            
        } catch {
            self.state = .failed(error: error)
        }
        
    }
}
