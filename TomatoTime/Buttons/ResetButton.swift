//
//  ResetButton.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 28/9/23.
//

import SwiftUI

struct ResetButton: View {
    @ObservedObject var tomatoTimeModel : TomatoTimeModel

    var body: some View {
        HStack{
        
            Spacer()
            
            Button {
                
                tomatoTimeModel.resetTimer()
            } label: {
                
                Image(systemName: "gobackward")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(.foreground)
                    .frame(width: 30, height: 30)
                
            }
        }
    }
}

#Preview {
    ResetButton(tomatoTimeModel: TomatoTimeModel())
}
