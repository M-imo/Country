//
//  CountryViewModel.swift
//  Country
//
//  Created by Miriam Moe on 10/11/2023.
//

import Foundation


class CountryViewModel: ObservableObject {
    @Published var countryName: String = ""
    @Published var countryCapital: String = ""
    @Published var altSpellingsCount: Int = 0

    func fetchData(for countryName: String) {
        if let url = URL(string: "https://restcountries.com/v2/name/\(countryName)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let countryInfo = try? JSONDecoder().decode([Country].self, from: data).first {
                        DispatchQueue.main.async {
                            self.countryName = countryInfo.name
                            self.countryCapital = countryInfo.capital
                            self.altSpellingsCount = countryInfo.altSpellings.count
                        }
                    }
                }
            }.resume()
        }
    }
}

