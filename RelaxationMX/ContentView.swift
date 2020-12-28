//
//  ContentView.swift
//  RelaxationMX
//
//  Created by Andrey Kudryavtsev on 28.12.2020.
//

import SwiftUI

struct Home: View {
    
    // Массив количества повторов трека, 0 - постоянно...
    let arrayCount = ["Infinitely", "1 - cycle", "2 - cycle", "3 - cycle", "4 - cycle", "5 - cycle", "6 - cycle", "7 - cycle", "8 - cycle", "9 - cycle",]
    // Количество повторений трека...
    @State private var selectCount = 1
    // Вкл/Выкл повторений треков...
    @State private var isCount = false
    
    // Массив треков...
    let arrayTreckName = ["Rain", "Fire", "Stormsnow",]
    // Выбранный трек...
    @State private var selectTrack = 0
    
    // Вкл/Выкл темная тема
    @State private var darkMode = false
    
    // Позиция трека
    @State private var positionTrack = 0.0
    
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
                            default: Image(systemName: "aqi.medium")
                        }
                        Picker("Track", selection: $selectTrack, content: {
                            ForEach(0..<self.arrayTreckName.count) { index in
                                Text(self.arrayTreckName[index])
                            }
                        })
                    }
                }
                Section(header: Text("Settings")){
                    HStack{
                        Image(systemName: "repeat.circle")
                        Toggle(isOn: $isCount, label: {
                            Text("Turn on turn off repetitions")
                        })
                    }
                    HStack{
                        Image(systemName: "timer")
                        Picker("Count cycle", selection: $selectCount, content: {
                            ForEach(0..<self.arrayCount.count) { index in
                                Text(self.arrayCount[index])
                            }
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
                    print("back")
                }, label: {
                    Image(systemName: "gobackward.15")
                        .font(.system(size: 32))
                        .padding(.leading, 15)
                })
            Button(action: {
                if self.isCount {
                    print("true")
                } else {
                    print("false")
                }
            }, label: {
                Image(systemName: "play.circle")
                    .font(.system(size: 54))
                    .padding(.horizontal, 5)
            })
            Button(action: {
                    print("next")
                }, label: {
                    Image(systemName: "goforward.15")
                        .font(.system(size: 32))
                        .padding(.trailing, 15)
                })
            Spacer()
            Text("00:00")
                .font(.system(size: 54))
                .padding(.horizontal)
                .foregroundColor(.orange)
            }
            Slider(value: $positionTrack, in: 0...100)
                .padding()
            Spacer()
            Text("2020")
                .font(.system(size: 12))
                .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
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
