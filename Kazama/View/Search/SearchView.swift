//
//  SearchView.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel : SearchViewModel
    
    var body: some View {
         
              VStack {
                  SearchTextField(viewModel: viewModel)
                  ScrollView{
                      LazyVStack {
                          HStack {
                              Image(systemName: "location.fill") .resizable().renderingMode(.template)
                              
                                  .scaledToFit()
                                  .frame(height: 18).padding(.trailing,8)
                              Text(LocalizedStringKey.currentLocation).frame(alignment: .leading)
                              Spacer()
                          }.padding(.vertical,4)
                        Spacer(minLength: 16)
                          
                          
                          
                          ForEach(viewModel.results,id: \.id){
                                 result in
                           
                            
                              HStack {
                                  Text("\(result.name) - \(result.region) - \(result.country)").font(.callout.weight(.light)).frame(alignment: .leading)
                                  Spacer()
                              }
                                
                              }.padding(.vertical,4)
                              
                          
                               
                       
                           
                         
                      }.padding(.horizontal)
                  }
                  Spacer()
              }
             
              
          }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(weatherApi: WeatherApi(options: .dev))).preferredColorScheme(.dark)
            
    }
}

struct SearchTextField: View {
   @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        ZStack {
            Color.primary.opacity(0.4)
                .opacity(0.8).cornerRadius(10)
            HStack{
                Image(systemName: "magnifyingglass.circle").foregroundColor(.secondary)
                
                TextField(.searchFielTitle,text:$viewModel.searchText).onChange(of: viewModel.searchText, perform: viewModel.onTextChanged)
                if(viewModel.loadingResults){
                    
                
                ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(1)
                }
            }.padding()
        }.frame( height: 30).padding()
    }
}
