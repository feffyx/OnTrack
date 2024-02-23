//
//  routeFootTextView.swift
//  SpeechFederica
//
//  Created by Federica Ziaco on 20/02/24.
//

import SwiftUI

struct routeTrainTextView: View {
    var trainText: String = "You're at Corso Vittorio Emanuele 288, 80135, Naples, Italy.\n\nTurn right and walk for 200 meters (around 4 minutes) to the funicular station.\n\nBe careful, there are trees on the left side of the pathwalk.\n\nYou will find the station's entrance on your right, walk in.\n\nOnce you entered beware of the ticket machines, go through them.\n\nOn your left there will be stairs going down to the platform, hold onto the railing which can be found on both sides.\n\nAt the platform wait for the funicular to arrive. It will take about 5 minutes.\n\nThe funicolar is here, once you hear the sound of the automatic door opening, enter the coach.\n\nThe next stop is where you have to get off.\n\nYou arrived, get off the funicolar.\n\nGo right once you're out of the coach and walk to the exit.\n\nOutisde the station you will find yourself in a pitch where there will be some trees and tables, walk slowly.\n\nOnce you passed the pitch turn right and walk to your destination for 500 meters (about 7 minutes).\n\nYou will pass through a roundabout, beware of the coffee tables and bars that are around.\n\nOnce you walked through the poles you will have arrived to your destination."
    
    
    @State var showingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack (alignment: .leading, spacing: 20.0) {
                    Text(trainText)
                        .font(.title2)
                        .accessibilityLabel(trainText)
//                        .padding(.top,20)
                } .padding()
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Show Alert")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("You have arrived"), dismissButton: .default(Text("Ok")))
                    
                }
            }
            
//            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Your track").font(.title)
                        .foregroundStyle(Color.yellow)
                        .bold()
//                        .padding(.top,30)
                }
            }
        }
        
        
    }
}


#Preview {
    routeTrainTextView()
}
