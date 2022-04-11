//
//  HomeViewModel.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 07/04/22.
//

import Foundation
import UIKit
import SwiftUI


class HomeViewController : ObservableObject{
    
    @Published var currentWeater : Weather?;
    
    @Published var isLoadingWeather : Bool = false;
    
    @Published var weatherSchema:  WeatherStyleSchema = .clearDay
    
    @AppStorage("currentLat") var currentLat : Double = 0.0
    @AppStorage("currentLng") var currentLng : Double = 0.0
    @AppStorage("currentLocationName") var currentLocationName: String = ""
    
    
    let weatherApi : WeatherApi = WeatherApi(options: .dev)
    
    @MainActor
    func getCurrentWeather() async{
        if(currentLat == 0 && currentLng == 0){
            return
        }
        
        do{
            currentWeater  = try await weatherApi.getCurrentWeather(lat:currentLat, lng:  currentLng)
            setWeatherStyleSchema()
        }
        catch let error {
            print("error on result of request \(error)")
        }

        
    }
    
    @MainActor
    private func setWeatherStyleSchema(){
        
           if(currentWeater == nil){
          weatherSchema =  .clearDay
               
           }
           
        
        let isDay : Bool = currentWeater?.current.isDay == 1
        
        switch currentWeater!.current.condition.code{
               //clear
           case 1003:
               
               weatherSchema = isDay ? .partlyCloudyDay :  .partlyCloudyNight
               
               break
               //fog
           case 1135:
               weatherSchema =  isDay ? .fogDay : .fogNight
               break;
               //Patchy light rain
           case 1180:
               weatherSchema =  isDay ? .dayLightRain : .nightLightRain
               
           break
           default:
               weatherSchema = .clearDay
               break
           }
           
           
           
       
        
        
        
    }
    
    
}
