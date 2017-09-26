//
//  ViewController.swift
//  PlacingShip
//
//  Created by Christopher Webb-Orenstein on 8/30/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 0.5
        sceneView.scene.rootNode.childNodes[0].transform = SCNMatrix4Mult(sceneView.scene.rootNode.childNodes[0].transform, SCNMatrix4MakeRotation(Float(Double.pi) / 4, 1, 0, 0))
      //  SCNMatrix4MakeRotation(Float(Double.pi) / 2, 1, 0, 0))
        sceneView.scene.rootNode.childNodes[0].transform = SCNMatrix4Mult(sceneView.scene.rootNode.childNodes[0].transform, SCNMatrix4MakeTranslation(0, 0, -4))
        
       // SCNMatrix4MakeTranslation(0, 0, -2))
        SCNTransaction.commit()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
