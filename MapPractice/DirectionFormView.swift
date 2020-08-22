//
//  DirectionFormView.swift
//  MapPractice
//
//  Created by Manish on 06/07/20.
//  Copyright © 2020 Manish. All rights reserved.
//

import SwiftUI
import MapKit

struct DirectionFormView: View {
    
    @State private var sourceLocation = ""
    @State private var destinationLocation = ""
    
    @State private var sourceSearchResults = [MKMapItem]()
    @State private var destinationSearchResults = [MKMapItem]()
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 10) {
                VStack {
                    TextField("Source", text: $sourceLocation, onCommit: {
                        self.search(for: self.sourceLocation) { (response) in
                            self.sourceSearchResults = response
                        }
                    })
                    
                    // Dropdown
                    ForEach(sourceSearchResults, id: \.name) { item in
                        HStack {
                            Text(item.name ?? "")
                            Spacer()
                        }
                        .background(Color.gray.opacity(0.5))
                        .onTapGesture {
                            self.sourceLocation = item.name ?? ""
                        }
                    }
                }
                
                Divider()
                
                VStack {
                    TextField("Destination", text: $destinationLocation)
                    
                    // Dropdown
                    ForEach(destinationSearchResults, id: \.name) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                self.destinationLocation = item.name ?? ""
                            }
                    }
                }
                
                
            }
            
            Button(action: {
                print("Search tapped")
            }, label: {
                Text("Search")
            })
        }
        .padding()
    }
    
    func search(for locationStr: String,
                onResponse: @escaping ([MKMapItem]) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = locationStr.lowercased()
        
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            
            onResponse(response.mapItems)
        }
    }
    
}

struct DirectionFormView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionFormView()
    }
}
