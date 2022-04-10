//
//  HomeView.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/04/22.
//

import SwiftUI

struct HomeView: View {
   @ObservedObject var viewModel : HomeViewController
    var schema: WeatherStyleSchema  {
        
        viewModel.weatherSchema
    }
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            schema.gradient.edgesIgnoringSafeArea(.all)
        
            
            VStack{
                HomeHeader(localName: viewModel.currentWeater?.location.name ?? "" , colorSchema: schema)
                
                if(schema.lottie != nil){
                    
                    schema.lottie?.frame(height: screenHeight * 0.08).id(schema.lottie?.name).padding(.vertical,62)
                    
                }else{
                    
              schema.image!.resizable().scaledToFit().frame(height: screenHeight * 0.08).padding(.vertical,62).shadow(color: .black.opacity(0.4), radius:2, x: 2, y: 2)
                    
                }
                Text(viewModel.currentWeater?.localizedName(lng: "pt") ?? "").font(.system(size: 14).bold()).foregroundColor(schema.foregroundColorPrimary)
                
                Text("\(viewModel.currentWeater?.current.tempC ?? 0)°").font(.system(size: 50)).bold().shadow(color:.white.opacity(0.8), radius: 24, x: 1, y: 1).foregroundStyle(schema.foregroundColorPrimary, .white).padding(.vertical,8)
                
                HStack{
                    HStack{
                        Image(systemName: "wind")
                        Text( String(format: "%.1f km/h",viewModel.currentWeater?.current.windKph ?? 0)).font(.caption)
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "humidity.fill")
                        Text(String(format: "%.0f",viewModel.currentWeater?.current.humidity ?? 0 ).appending("%")).font(.caption)
                    }
                }.frame(width: 150).foregroundColor(schema.foregroundColorSecundary)
                
                Spacer()
               
                
                
            }
            
          
            .padding(.top,16)
        }.task {
            await viewModel.getCurrentWeather()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewController())
    }
}
