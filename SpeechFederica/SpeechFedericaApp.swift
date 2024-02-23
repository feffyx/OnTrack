//
//  SpeechFedericaApp.swift
//  SpeechFederica
//
//  Created by Federica Ziaco on 19/02/24.
//

import SwiftUI

@main
struct SpeechFedericaApp: App {
    let speechViewModel = SpeechViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(speechViewModel)
        }
    }
}
