//
//  SetGameApp.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import SwiftUI

@main
struct SetGameApp: App {
    var game = SetGame()
    var body: some Scene {
        WindowGroup {
            ContentView(game:game)
        }
    }
}
