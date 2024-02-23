//
//  ContentView.swift
//  SpeechFederica
//
//  Created by Federica Ziaco on 19/02/24.
//


import SwiftUI
import Speech


struct ContentView: View {
    @EnvironmentObject var speechViewModel: SpeechViewModel
    
    @State private var recognizedText: String = ""
    
    @State private var navigateToNextView = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 15.0) {
                if speechViewModel.isRecording {
                    Text("Listening...")
                        .accessibilityLabel("Listening")
                        .onTapGesture {
                            speechViewModel.stopRecording()
                            recognizedText = speechViewModel.transcription
                            navigateToNextView = true
                        }
                } else {
                    
                    Image(systemName: "mic.circle.fill")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.yellow)
                        .font(.title)
                        .bold()
                        .onTapGesture {
                            speechViewModel.startRecording()
                        }
                }
            }
            .padding()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack(alignment: .leading) {
                        Text("Hello, where do you").font(.title)
                            .foregroundStyle(Color.yellow)
                            .bold()
                            .padding(.top, 100)
                        Text("want to go?").font(.title)
                            .foregroundStyle(Color.yellow)
                            .bold()
                    }
                }
            }
            .onAppear {
                speechViewModel.recognitionRequest
            }
            .background(
                NavigationLink(
                    destination: ConfirmView(recognizedText: $recognizedText, navigateToNextView: $navigateToNextView), // Sostituisci NextView() con la vista di destinazione desiderata
                    isActive: $navigateToNextView,
                    label: {
                        EmptyView()
                    })
                
            )
            .accessibilityLabel("microphone button")
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(SpeechViewModel())
}
