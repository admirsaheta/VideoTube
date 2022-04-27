//
//  VideoService.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

import Foundation

struct VideoService {
    
    // MARK: Error Handler
    
    enum VideoServiceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    
    func fetchVideos() async throws -> [Video] {
        
    // Defining the url
    let url = URL(string: "https://admirsaheta.com/movies")!
    let (data, response) = try await URLSession.shared.data(from: url)
        
    // Error handling if server returns invalid status code || Hope ya'll know 200 is ok everything else I don't want to see :D
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw VideoServiceError.invalidStatusCode
              }
        
    // Don't mind me decoding the JSON u sent over
        
    let decodedData = try JSONDecoder().decode(VideoServiceResult.self, from: data)
        
    return decodedData.videos
    // Returning JSON data , duuhhh
        
    
    }
    
}
