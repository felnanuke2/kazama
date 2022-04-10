//
//  SearchViewModel.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import Foundation

class SearchViewModel : ObservableObject{
    @Published var searchText : String = ""
    @Published var results : SearchResults = []
    @Published var loadingResults: Bool = false

    var timer : Timer?
    
    let weatherApi : WeatherApi
    
    init(weatherApi : WeatherApi){
        self.weatherApi = weatherApi
        
    }
    
    
    
    func onTextChanged(value: String){
        timer?.invalidate()
        timer =  Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: onTextChangedTimerTicker )
    }
    
    private func onTextChangedTimerTicker(timer: Timer) {
        timer.invalidate()
        self.timer = nil
        Task{
           await getAutoComplets()
        }
      
       
        
    }
    
    @MainActor
    private func getAutoComplets()async -> Void{
        loadingResults = true
        if(searchText.count < 2){
            return
        }
        do{
            let result = try await  weatherApi.getAutoComplet(value: searchText)
            results = result
            print("get \(result.count) auto complets")
        }catch let error {
            print("error at get autocomplets \(error)")
        }
     
        loadingResults = false
    }
    
    
    
}
