//
//  VideoModel.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

import Foundation



// MARK: - VideoResponse
struct VideoServiceResult: Codable {
    let name: String
    let videos: [Video]
}

// MARK: - Video
struct Video: Codable, Identifiable {
    let id = UUID()
    let videoDescription: String
    let sources: [String]
    let subtitle: Subtitle
    let thumb, title: String

    enum CodingKeys: String, CodingKey {
        case videoDescription = "description"
        case sources, subtitle, thumb, title
    }
}

enum Subtitle: String, Codable {
    case byBlenderFoundation = "By Blender Foundation"
    case byGarage419 = "By Garage419"
    case byGoogle = "By Google"
}
