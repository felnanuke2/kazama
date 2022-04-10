//
//  KazamaApp.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/04/22.
//

import SwiftUI

@main
struct KazamaApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(weatherApi: WeatherApi(options: .dev)))
        }
    }
}
