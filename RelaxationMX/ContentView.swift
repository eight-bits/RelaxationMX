//
//  ContentView.swift
//  RelaxationMX
//
//  Created by Andrey Kudryavtsev on 28.12.2020.
//

import SwiftUI
import Combine

struct Home: View {
    
    // Модель player
    @ObservedObject var viewModel = PlayerViewModel()
    
    // Массив количества повторов трека, 0 - никогда...10 - бесконечно
    let arrayCount = ["Never", "1 - cycle", "2 - cycle", "3 - cycle", "4 - cycle", "5 - cycle", "6 - cycle", "7 - cycle", "8 - cycle", "9 - cycle", "Looped",]
    // Количество повторений трека...
    @State private var selectCount = 0
    
    // Массив треков...
    let arrayTreckName = ["Rain", "Fire", "Snowstorm", "Nightingale", "Stream",]
    // Выбранный трек...
    @State private var selectTrack = 0
    
    // Вкл/Выкл темная тема
    @State private var darkMode = false
    
    // Позиция громкости
    @State private var positionVolume: Float = 0.5
    
    // Отобразить view about
    @State private var showAbout = false
    
    var body: some View {
        NavigationView {
        VStack {
            HStack {
            Text("RelaxationMX")
                .font(.title)
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .padding()
                .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 5.5, x: 0, y: 0)
                Spacer()
                NavigationLink(destination: About(),
                               label: {
                                Image(systemName: "bookmark.fill")
                                    .font(.title)
                                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                                    .padding()
                                    .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 5.5, x: 0, y: 0)
                               })
            }
            Form{
                Section(header: Text("Select track")){
                    HStack{
                        switch selectTrack {
                            case 0: Image(systemName: "cloud.rain")
                            case 1: Image(systemName: "flame")
                            case 2: Image(systemName: "wind.snow")
                            case 3: Image(systemName: "swift")
                            case 4: Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                            default: Image(systemName: "aqi.medium")
                        }
                        Picker("Track", selection: $selectTrack, content: {
                            ForEach(0..<self.arrayTreckName.count) { index in
                                Text(self.arrayTreckName[index])
                            }
                        }).onChange(of: selectTrack, perform: { _ in
                            self.viewModel.stop()
                        })
                    }
                }
                Section(header: Text("Settings")){
                    HStack{
                        Image(systemName: "timer")
                        Picker("Count cycle", selection: $selectCount, content: {
                            ForEach(0..<self.arrayCount.count) { index in
                                Text(self.arrayCount[index])
                            }
                        }).onChange(of: selectCount, perform: { _ in
                            self.viewModel.playerCycles = selectCount
                            if self.viewModel.playerCycles > 9 {
                                self.viewModel.playerCycles.negate()
                            }
                            self.viewModel.stop()
                            
                        })
                    }
                    HStack{
                        Image(systemName: "moon")
                        Toggle(isOn: $darkMode, label: {
                            Text("Dark theme")
                        })
                    }
                }
            }
            HStack{
                Button(action: {
                    self.viewModel.setTimeBack15()
                }, label: {
                    Image(systemName: "gobackward.15")
                        .font(.system(size: 32))
                        .padding(.leading, 15)
                })
                Button(action: {
                        self.viewModel.initMedia(name: self.arrayTreckName[self.selectTrack])
                        self.viewModel.play()
                }, label: {
                    Image(systemName: "play.circle")
                        .font(.system(size: 54))
                        .padding(.horizontal, 5)
                })
                Button(action: {
                        self.viewModel.stop()
                }, label: {
                    Image(systemName: "stop.circle")
                        .font(.system(size: 32))
                        .padding(.horizontal, 5)
                })
            Button(action: {
                self.viewModel.setTimeForfard15()
                }, label: {
                    Image(systemName: "goforward.15")
                        .font(.system(size: 32))
                        .padding(.trailing, 15)
                })
            }
            HStack{
                Image(systemName: "speaker.fill")
                    .padding()
                    .font(.system(size: 22))
                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                Slider(value: $positionVolume, in: 0.0...1.0, step: 0.01)
                    .onChange(of: self.positionVolume, perform: { _ in self.viewModel.setVolume(vl: self.positionVolume)
                    })
                    .padding(.vertical)
                    .accentColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                Image(systemName: "speaker.wave.2.fill")
                    .padding()
                    .font(.system(size: 22))
                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
            }
        }
        .navigationBarHidden(true)
        }
        .accentColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
        .colorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
