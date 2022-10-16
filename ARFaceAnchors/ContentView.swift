//
//  ContentView.swift
//  ARFaceAnchors
//
//  Created by Zaid Neurothrone on 2022-10-16.
//

import ARKit
import RealityKit
import SwiftUI

struct ContentView : View {
  var body: some View {
    ARViewContainer().edgesIgnoringSafeArea(.all)
  }
}

struct ARViewContainer: UIViewRepresentable {
  func makeUIView(context: Context) -> ARView {
    let arView = ARView(frame: .zero)
    
    guard ARFaceTrackingConfiguration.isSupported else {
      fatalError("❌ -> Your device does not support face anchors")
    }
    
    let configuration = ARFaceTrackingConfiguration()
    arView.session.run(configuration)
    
    let faceAnchor = try! Experience.loadFaceScene()
    arView.scene.addAnchor(faceAnchor)
    
    return arView
  }
  
  func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
