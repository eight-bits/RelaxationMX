//
//  ModelPlayer.swift
//  RelaxationMX
//
//  Created by Andrey Kudryavtsev on 28.12.2020.
//

import Foundation
import AVFoundation


class PlayerViewModel: ObservableObject {
    
    // Статус проигрывателя
    @Published public var statusPlay = false
    
    // Количество циклов проигрывания дорожки
    @Published public var playerCycles = 0
    
    // Сессия для получения громкости 
    var session = AVAudioSession.sharedInstance()
    
    private var player: AVAudioPlayer?
    
    public func play() {
        do {
            try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        player?.numberOfLoops = playerCycles
        player?.play()
        self.statusPlay = true
    }
    
    public func stop() {
        player?.stop()
        self.statusPlay = false
    }
    
    public func setTimeForfard15() {
        if self.statusPlay {
            player?.currentTime = player!.currentTime + 15
        }
    }
    
    public func setTimeBack15() {
        if self.statusPlay {
            player?.currentTime = player!.currentTime - 15
        }
    }
    
    func initMedia(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "m4a") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getVolume()-> Float {
        if ((try? session.setActive(true)) != nil) {
            return session.outputVolume
        } else {
            return 0
        }
    }
    
    func setVolume(vl: Float) {
        player?.volume = vl
    }
}
