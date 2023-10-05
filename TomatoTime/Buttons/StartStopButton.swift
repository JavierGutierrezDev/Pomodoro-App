//
//  TimeButtonModifier.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 28/9/23.
//

import SwiftUI

struct StartStopButton: View {
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    var body: some View {
        Button {
            if(tomatoTimeModel.isRunning){
                
                tomatoTimeModel.stopTimer()
            }else{
                tomatoTimeModel.startTimer()

            }
        } label: {
            if(tomatoTimeModel.isRunning){
                Text("Stop")
                    .font(.title2)
                    .bold()
                    .frame(width: 200, height: 50)
                    .foregroundStyle(.foreground)
                    .background(.red)
                    .cornerRadius(12)
                    
            }else{
                Text("Start")
                    .font(.title2)
                    .bold()
                    .frame(width: 200, height: 50)
                    .foregroundStyle(.foreground)
                    .background(.green)
                    .cornerRadius(12)
                    
            }
            
            
        }
         
    }
}

#Preview {
    StartStopButton(tomatoTimeModel: TomatoTimeModel())
}
