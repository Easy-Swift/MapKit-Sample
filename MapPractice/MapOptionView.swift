//
//  MapOptionView.swift
//  MapPractice
//
//  Created by Manish on 06/07/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import SwiftUI

struct MapOptionView: View {
    
    @State private var selectedOption = 0
    var options = ["Direction", "Hotels", "Parks"]
    
    var body: some View {
        
        VStack {
            Picker(selection: $selectedOption, label: Text("What is your favorite color?")) {
                ForEach(0..<options.count) { index in
                    Text(self.options[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            // Direction
            DirectionFormView()
            
        }
        .background(Color.white)
        
    }
    
}

struct MapOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MapOptionView()
    }
}
