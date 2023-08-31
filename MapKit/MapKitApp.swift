//
//  MapKitApp.swift
//  MapKit
//
//  Created by Apple1 on 20/03/2023.
//

import SwiftUI

@main
struct MapKitApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
          LocationView()
                .environmentObject(vm)
        }
    }
}
