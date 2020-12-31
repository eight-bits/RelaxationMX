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
    
    // Длинна трека
    @Published public var maxDuration = 0.0
    
    // Количество циклов проигрывания дорожки
    @Published public var playerCycles = 0
    
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
        if (player?.isPlaying != nil) {
            player?.currentTime = player!.currentTime + 15
        }
    }
    
    public func setTimeBack15() {
        if (player?.isPlaying != nil) {
            player?.currentTime = player!.currentTime - 15
        }
    }
    
    func initMedia(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "m4a") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getVolume()-> Float {
        return player?.volume ?? 0.0
    }
    
    func setVolume(vl: Float) {
        player?.volume = vl
    }
}
