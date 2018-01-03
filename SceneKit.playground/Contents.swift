//: Playground - noun: a place where people can play

import UIKit
import SceneKit
import PlaygroundSupport

// Set up the scene view
let frame = CGRect(
    x: 0,
    y: 0,
    width: 500,
    height: 300)
let sceneView = SCNView(frame: frame)
sceneView.showsStatistics = true
sceneView.autoenablesDefaultLighting = true
sceneView.scene = SCNScene()

// Setup our view into the scene
let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
sceneView.scene!.rootNode.addChildNode(cameraNode)

// Add a ring to the scene
let torus = SCNTorus(ringRadius: 1, pipeRadius: 0.25)
let torusNode = SCNNode(geometry: torus)
sceneView.scene!.rootNode.addChildNode(torusNode)

let torusMaterial = torus.firstMaterial!
torusMaterial.diffuse.contents  = UIColor.red
torusMaterial.specular.contents = UIColor.white

// Add a box to the scene
let boxHeight: CGFloat = 0.5
let box = SCNBox(
    width: 0.5,
    height: 0.5,
    length: 0.5,
    chamferRadius: 0.0)
let boxNode = SCNNode(geometry: box)
boxNode.transform = SCNMatrix4MakeRotation(0.5, 0.5, 0.5, 0.5)
sceneView.scene!.rootNode.addChildNode(boxNode)

let boxMaterial = box.firstMaterial!
boxMaterial.diffuse.contents = UIColor.green
boxMaterial.specular.contents = UIColor.white

// Set up animations

// Rotate the torus
torusNode.rotation = SCNVector4(x: 1.0, y: 1.0, z: 0.0, w: 0.0)
let rotate = CABasicAnimation(keyPath: "rotation.w")
rotate.toValue = 2 * Double.pi
rotate.duration = 5  // seconds
rotate.repeatCount = Float.infinity  // spin forever
torusNode.addAnimation(rotate, forKey: "rotate")

// Translate the cube
let transform = CABasicAnimation(keyPath: "transform.translation.x")
transform.fromValue = 2.5
transform.toValue = -2.5
transform.autoreverses = true
transform.duration = 5  // seconds
transform.repeatCount = Float.infinity
boxNode.addAnimation(transform, forKey: "transform")

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

