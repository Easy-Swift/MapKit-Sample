//
//  ContentView.swift
//  MapPractice
//
//  Created by Manish on 06/07/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack(alignment: .bottom) {
            MapView()
            
            MapOptionView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
