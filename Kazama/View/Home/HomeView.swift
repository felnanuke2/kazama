//
//  HomeView.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/04/22.
//

import SwiftUI
import UIImageColors

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var schema: UIImageColors? {
        
        viewModel.colorSchema
    }
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack {
                if( viewModel.backGroundImage != nil){
                    
                    Image(uiImage: viewModel.backGroundImage!).resizable()
                
                .ignoresSafeArea(.all)
                
                    
                }
                
                VStack{
                    if(schema != nil){
                 
                   
           
                        Text(viewModel.currentWeater?.localizedName(lng: "pt") ?? "").font(.system(size: 14).bold()).foregroundColor(schema!.primary.color)
                    
                        Text(String(format: "%.0f°", arguments:[viewModel.currentWeater?.current.tempC ?? 0])).font(.system(size: 50)).bold().shadow(color:.white.opacity(0.8), radius: 24, x: 1, y: 1).foregroundStyle(schema!.primary.color, .white).padding(.vertical,8)
                    
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
                    }.frame(width: 150).foregroundColor(schema!.primary.color)
                    
                    Spacer()
                    if(viewModel.currentWeater != nil){
                        ScrollView(.horizontal){
                            LazyHStack(spacing: 16){
                                
                                ForEach(viewModel.currentWeater!.forecast.forecastday[0].hour.filter{
                                    hour in
                                    hour.date.distance(to: .now) < 0
                                } , id: \.time){
                                    hour in
                                    HourCard(schema: schema!, tempC: hour.tempC, date: Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch)) ){
                                        VStack{
                                            AsyncImage(url: URL(string: hour.condition.iconUrl) ){
                                                image in
                                                image.resizable().scaledToFit()
                                            } placeholder: {
                                                ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(1)
                                            }
                                            Text(hour.localizedName(lng: "pt")).font(.caption).multilineTextAlignment(.center).foregroundColor(schema?.detail.color)
                                        }
                                    }
                                    
                                }
                            }  .padding(.top,16).padding(.horizontal,16)
                        }
                    
                }
                    }
                }
                
              
              
            }.task {
                await viewModel.getCurrentWeather()
            }.navigationBarHidden(true)
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

extension View {
// This function changes our View to UIView, then calls another function
// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
