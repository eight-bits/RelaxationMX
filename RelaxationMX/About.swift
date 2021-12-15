//
//  About.swift
//  RelaxationMX
//
//  Created by Andrey Kudryavtsev on 28.12.2020.
//

import SwiftUI

struct HomeAbout: View {
    var body: some View {
        VStack {
            Image(systemName: "leaf.fill")
                .font(.system(size: 58))
                .foregroundColor(.green)
                .padding(.all, 40)
                .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                .clipShape(Circle())
                .padding(.all, 4)
                .background(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                .clipShape(Circle())
            Text("RelaxationMX - Version 1.0.0\nXcode - Version 13.2 (13C90)\nSwift - 5.5\nFramework - SwiftUI\nCopyright © 2021 Andrey Kudryavtsev")
                .foregroundColor(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                .font(.system(size: 18))
                .padding(.top, 50)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct About: View {
    var body: some View {
        HomeAbout()
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
