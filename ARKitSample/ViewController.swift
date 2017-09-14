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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
}
