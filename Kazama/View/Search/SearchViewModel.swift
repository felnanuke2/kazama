//
//  SearchViewModel.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import Foundation
import SwiftUI
import CoreLocation

class SearchViewModel : ObservableObject{
    @AppStorage("lastQuery") private var lastQuery = ""
    @Published var searchText : String = ""
    @Published var results : SearchResults = []
    @Published var loadingResults: Bool = false
    @AppStorage("currentLat") var currentLat : Double = 0.0
    @AppStorage("currentLng") var currentLng : Double = 0.0
    @AppStorage("currentLocationName") var currentLocationName: String = ""
    
    init(){
        searchText = lastQuery
        if(!lastQuery.isEmpty){
            Task{
                await getAutoComplets()
            }
        }
    }

    let locationManager  = CLLocationManager()
   

    var timer : Timer?
    
    let weatherApi = WeatherApi(options: .dev)
    
 
    
    
    
    func onTextChanged(value: String){
        timer?.invalidate()
        timer =  Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: onTextChangedTimerTicker )
    }
    
    private func onTextChangedTimerTicker(timer: Timer) {
        timer.invalidate()
        self.timer = nil
        lastQuery = searchText
        Task{
           await getAutoComplets()
        }
      
       
        
    }
    
    @MainActor
    private func getAutoComplets()async -> Void{
       
        if(searchText.count < 3){
            return
        }
        loadingResults = true
        do{
            let result = try await  weatherApi.getAutoComplet(value: searchText)
            results = result
            print("get \(result.count) auto complets")
        }catch let error {
            print("error at get autocomplets \(error)")
        }
     
        loadingResults = false
    }
    
    func selectLocal(result : SearchResult){
        currentLat = result.lat
        currentLng = result.lon
        currentLocationName = result.name
        lastQuery = currentLocationName
     
    }
    
    func selectCurrentLocationo() -> Bool {
        locationManager.requestWhenInUseAuthorization()
     
        switch locationManager.authorizationStatus{
        case .denied:
              return false
        case .notDetermined:
           return false
        case.restricted:
            return false
        default:
            break
            
        }
        
        let lat =  locationManager.location?.coordinate.latitude
        let lng = locationManager.location?.coordinate.longitude
        currentLat = lat ?? 0
        currentLng = lng ?? 0
        return true
        
    }
    
    
}
