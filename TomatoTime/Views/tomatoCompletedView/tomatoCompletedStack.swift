//
//  tomatoCompletedStack.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 1/10/23.
//

import SwiftUI

struct tomatoCompletedStack: View {
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    var body: some View {
        
        LazyHGrid(rows: [GridItem()]){
            
            ForEach(0..<tomatoTimeModel.tomatoesCompleted.count){ index in
                tomatoCompletedBubble(timeExpended: tomatoTimeModel.tomatoesCompleted[index],
                                      tomatoTimeModel: tomatoTimeModel)
                    .padding(.horizontal,8)
                
            }

        }
    }
}

#Preview {
    tomatoCompletedStack(tomatoTimeModel: TomatoTimeModel())
}
