//
//  tomatoCompletedBubble.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 1/10/23.
//

import SwiftUI

struct tomatoCompletedBubble: View {
    var timeExpended : Double
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    var body: some View {
        
        ZStack {
                    Circle() // Crea el círculo
                        .stroke(Color.blue, lineWidth: 2) // Color y grosor del borde
                    
            Text("\(timeExpendedString(timeExpended))") // Texto en el interior del círculo
                    .font(.callout) // Tamaño de fuente
                    .minimumScaleFactor(0.5)
                }
                .frame(width: 60, height: 60) // Tamaño del círculo
    }
}

#Preview {
    tomatoCompletedBubble(timeExpended: 0, tomatoTimeModel: TomatoTimeModel())
}
//función para transformar el tiempo de cada pomodoro hecho a String
func timeExpendedString(_ timeExpended : Double) -> String {
    let minutes = Int(timeExpended)/60
    let seconds = Int (timeExpended)%60
    
    return String(format: "%02d:%02d", minutes, seconds)
}

