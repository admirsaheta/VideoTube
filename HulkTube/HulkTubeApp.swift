//
//  HulkTubeApp.swift
//  HulkTube
//
//  Created by admin on 24.4.22..
//

import SwiftUI

@main
struct HulkTubeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                
        }
    }
}
