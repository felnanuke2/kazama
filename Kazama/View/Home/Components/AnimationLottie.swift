//
//  AnimationLottie.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 09/04/22.
//

import SwiftUI
import Lottie



struct AnimationLottie : UIViewRepresentable{
    let name : String
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> AnimationView {
     
        
       let view =  AnimationView(name: name )
        view.play( toFrame: AnimationFrameTime.infinity, loopMode: LottieLoopMode.repeat(200), completion: nil)
        view.layer.speed = 0.4
        return view
        
       
    }

 
    
}
