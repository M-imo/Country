//
//  ContentView.swift
//  Country
//
//  Created by Miriam Moe on 10/11/2023.
//


import SwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    @StateObject private var viewModel = CountryViewModel()

    var body: some View {
        VStack {
            HStack {
    
                   TextField("Enter country name...", text: $searchTerm)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding(.leading)
                
                Spacer()
                
                   Button(action: { // Resets
                       searchTerm = ""
                       viewModel.countryName = ""
                        viewModel.countryCapital = ""
                        viewModel.altSpellingsCount = 0
                       
            
                   }) {
                       Text("Cancel")
                           .foregroundColor(.purple)
                           .padding(.trailing)
                           
                   }
    
               }
    
               .frame(maxWidth: .infinity)
    
            
            Button(action: { // Search
                viewModel.fetchData(for: searchTerm)
                
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .bold()
                
            
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(30)
            .frame(width: 100, height: 55)
            
            .padding()
            
                Text("Country Name: \(viewModel.countryName)")
                Text("Country Capital: \(viewModel.countryCapital)")
                Text("Spellings Count: \(viewModel.altSpellingsCount)")
            }

        .onAppear {
        
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
