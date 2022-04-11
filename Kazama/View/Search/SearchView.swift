//
//  SearchView.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
     
    
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
                              }.padding(.vertical,4).onTapGesture {
                             let result =      viewModel.selectCurrentLocationo()
                                  if(result){
                                      presentationMode.wrappedValue.dismiss()
                                  }
                              }
                            Spacer(minLength: 16)
                              
                              
                              
                              ForEach(viewModel.results,id: \.id){
                                     result in
                               HStack {
                                          Text("\(result.name) - \(result.region) - \(result.country)").font(.callout.weight(.light)).frame(alignment: .leading)
                                          Spacer()
                               }.onTapGesture {
                                   viewModel.selectLocal(result: result)
                                   print("tap: \(result.name)")
                                   presentationMode.wrappedValue.dismiss()
                                   
                               }
                                        
                                      }.padding(.vertical,4)
                                  }
                                  
                             
                          }.padding(.horizontal)
            }
            .navigationBarHidden(true).padding(.top,8)
        }
       
    
             
              
}
    


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel( )).preferredColorScheme(.dark)
            
    }
}

struct SearchTextField: View {
   @ObservedObject var viewModel: SearchViewModel

    enum FocusField: Hashable{
        case main
        
    }
    
    
    @FocusState  private var focustState: FocusField?
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var isCancelVisible : Bool = false
    var body: some View {
        HStack {
            ZStack {
                Color.primary.opacity(0.4)
                    .opacity(0.8).cornerRadius(10)
                HStack{
                    Image(systemName: "magnifyingglass.circle").foregroundColor(.secondary)
                    
                    TextField(.searchFielTitle,text:$viewModel.searchText).onChange(of: viewModel.searchText, perform: viewModel.onTextChanged).focused($focustState, equals: .main)
                    if(viewModel.loadingResults){
                        
                    
                    ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(1)
                    }
                }.padding()
            }.frame( height: 30).padding()
            if(isCancelVisible){
                Text("Cancelar").onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
          
            }
        }.onAppear{
            isCancelVisible = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {  /// Anything over 0.5 seems to work
                focustState = .main
                  }
          
        }.animation(.default.delay(0.1), value: isCancelVisible)
       
    }
}
