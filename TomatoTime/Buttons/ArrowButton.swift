//
//  StopwatchArrowModifier.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 28/9/23.
//

import SwiftUI

struct ArrowButton: View {
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    
    enum ArrowDirection{
        case left
        case right
    }
    var arrowDirection : ArrowDirection
    
    
    var body: some View {
        if(!tomatoTimeModel.hasBegun){
            Button {
                
                if arrowDirection == .left {
                    if (tomatoTimeModel.timeRemaining >= 5){
                        tomatoTimeModel.timeRemaining -= 300
                        tomatoTimeModel.timeSelected = tomatoTimeModel.timeRemaining
                        
                    }
                }else{
                    tomatoTimeModel.timeRemaining += 300
                    tomatoTimeModel.timeSelected = tomatoTimeModel.timeRemaining

                }
                
                
            } label: {
                Image(systemName: "arrowtriangle.\(arrowDirection).fill")
                    .resizable()
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                    .frame(width: 30, height: 30)
                    .padding()
            }
        }
    }
}

#Preview {
    ArrowButton(tomatoTimeModel: TomatoTimeModel(), arrowDirection: .right)
}
