//
//  ViewController.swift
//  ARKitSample
//
//  Created by SIN on 2017/08/15.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.scene = SCNScene() // ビューのsceneプロパティに空のシーンを生成する
        
        let node = SCNNode() // ノードを生成
        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0) // ノードの形状を一辺が20cmの立方体とする
        let material = SCNMaterial() // マテリアル（表面）を生成する
        material.diffuse.contents = UIImage(named: "brick") // 表面は、レンガ（テクスチャ）
        node.geometry?.materials = [material] // 表面の情報をノードに適用
        node.position = SCNVector3(0, 0, -0.5) // ノードの位置は、カメラを原点として左右：0m 上下：0m　奥に50cm
        
        sceneView.scene.rootNode.addChildNode(node) // 生成したノードをシーンに追加する
        
//        sceneView.scene = SCNScene()
//        let node = SCNNode()
//        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "brick")
//        node.geometry?.materials = [material]
//        node.position = SCNVector3(0, 0, -0.5)
//
//        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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
