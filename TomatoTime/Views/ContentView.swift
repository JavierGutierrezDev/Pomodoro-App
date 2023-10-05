//
//  ContentView.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 26/9/23.
//


import SwiftUI

struct ContentView: View {
    @StateObject var tomatoTimeModel = TomatoTimeModel()

    var body: some View {
        NavigationStack{
            VStack {
                ResetButton(tomatoTimeModel: tomatoTimeModel)
                Spacer()
                StopwatchView(tomatoTimeModel: tomatoTimeModel,
                              timeRemaining: tomatoTimeModel.timeRemainingString())
                
                tomatoCompletedStack(tomatoTimeModel: tomatoTimeModel)
                StartStopButton(tomatoTimeModel: tomatoTimeModel)
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
