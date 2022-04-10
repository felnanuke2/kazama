//
//  HomeViewModel.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 07/04/22.
//

import Foundation
import UIKit


class HomeViewController : ObservableObject{
    
    @Published var currentWeater : Weather?;
    
    @Published var isLoadingWeather : Bool = false;
    
    @Published var weatherSchema:  WeatherStyleSchema = .clearDay
    
    
    
    let weatherApi : WeatherApi = WeatherApi(options: .dev)
    
    @MainActor
    func getCurrentWeather() async{
        
        currentWeater  = try! await weatherApi.getCurrentWeather(lat:-23.550520, lng:  -46.633308)
    setWeatherStyleSchema()
        
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
