//
//  TomatoTimeModel.swift
//  TomatoTime
//
//  Created by Javier Gutierrez on 28/9/23.
//

import Foundation
import Combine

class TomatoTimeModel : ObservableObject {
    
    @Published var timeRemaining : TimeInterval = 1500 //1500 = 25 min  300 = 5min
    @Published var isRunning : Bool = false
    @Published var hasBegun : Bool = false
    @Published var tomatoesCompleted: [Double] = []


    
    var timer : Timer?
    var timeSelected : Double = 0
    func stopTimer() {
        timer?.invalidate() // Detiene el temporizador si está en funcionamiento
        timer = nil // Establece el temporizador en nil para indicar que no está en funcionamiento
        isRunning = false // Establece isRunning en false para indicar que el temporizador se detuvo
//        if timeSelected > 0 && timeSelected < timeRemaining {
//            timeRemaining = timeSelected
//        }
    }
    
    func startTimer(){
        if hasBegun == false {hasBegun.toggle()}
        
        //Si el temporizador esta corriendo no ejecuta lo que hay debajo
        guard !isRunning else {return}
        
        if timeRemaining < 0 {timeRemaining = 0}
        
        isRunning = true
        //Si el valor maximo es menor que el tiempo que queda significa que es el valor maximo
        if(timeSelected < timeRemaining){
            timeSelected = timeRemaining
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {  _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }else{
                //para el temporizador
                self.stopTimer()
                //añade el tiempo que ha sido completado al array
                self.tomatoesCompleted.append(self.timeSelected)
                //resetea el temporizador
                self.resetTimer()
                if(self.tomatoesCompleted.count >= 4){
                    self.takeRest()
                }
            }
        })
    }
    
    func takeRest(){
        resetTimer()
        timeRemaining = 600
        timeSelected = timeRemaining
            
    }
    
    
    func pauseTimer(){
        guard isRunning else {return}
        isRunning = false
        timer?.invalidate()
    }
    
    
    func resetTimer(){
        hasBegun = false
        if isRunning{
            pauseTimer()
            timeRemaining = timeSelected
        }else{
            timeRemaining = timeSelected

        }
        
    }
    
    func timeRemainingString() -> String{
        let minutes = Int(timeRemaining)/60
        let seconds = Int (timeRemaining)%60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
    
}
