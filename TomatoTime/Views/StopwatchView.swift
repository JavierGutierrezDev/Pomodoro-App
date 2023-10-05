//
//  StopwatchView.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 26/9/23.
//

import SwiftUI




struct StopwatchView: View {
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    var timeRemaining : String {
        didSet{
            //self.timeRemaining = tomatoTimeModel.timeRemainingString()
            self.timeRemaining = "\(tomatoTimeModel.isRunning)"
        }
    }
    
    
    var body: some View {
        VStack{
            ZStack{
                
                //Gray circle
                Circle()
                    .stroke(lineWidth: 8.0)
                    .opacity(0.3)
                //Progress circle
                Circle()
                    .trim(from: 0, to: tomatoTimeModel.timeRemaining / tomatoTimeModel.timeSelected )
                    .stroke(Color.blue , lineWidth : 15)
                // Ensures the animation starts from 12 o'clock
                    .rotationEffect(Angle(degrees: 270))
                    
                
                HStack{
                    ArrowButton(tomatoTimeModel: tomatoTimeModel, arrowDirection: .left)
                        
                    Text(timeRemaining)
                            .bold()
                            .font(Font.custom("San Francisco", size: 80))
                            .minimumScaleFactor(0.5) // Escala mínima (50%)
                            .lineLimit(1) // Limita el texto a una línea
                    
                    ArrowButton(tomatoTimeModel: tomatoTimeModel, arrowDirection: .right)
                    
                    }
                    
                
                
            }
            
            
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    StopwatchView(tomatoTimeModel: TomatoTimeModel(), timeRemaining: "25:00")
}
