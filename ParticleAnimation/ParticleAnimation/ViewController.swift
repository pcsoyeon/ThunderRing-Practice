//
//  ViewController.swift
//  ParticleAnimation
//
//  Created by soyeon on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    private let emitterLayer = CAEmitterLayer()
    
    private let dimension = 3
    private var imagesNames = ["particle1", "particle2", "particle3"]
    private var velocities = [50, 100, 150, 200]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpEmitterLayer()
        setUpTapGestureRecognizer()
    }
    
    private func setUpEmitterLayer() {
        emitterLayer.emitterCells = generateConfettiEmitterCells()
    }
    
    private func generateConfettiEmitterCells() -> [CAEmitterCell]  {
        var cells = [CAEmitterCell]()
        
        for index in 0..<10 {
            let cell = CAEmitterCell()
            cell.contents = nextImage(i: index)
            
            cell.lifetime = 3
            cell.birthRate = 100
            
            cell.scale = 0.15
            cell.scaleRange = 0.05
            
            cell.spin = 5
            cell.spinRange = 10
            
            cell.emissionRange = CGFloat.pi * 2
            
            cell.velocity = 700
            cell.velocityRange = 50
            
            cell.yAcceleration = 1200
            
            cells.append(cell)
        }
        
        return cells
    }
    
    var randomNumber: Int {
        return Int(arc4random_uniform(UInt32(dimension)))
    }
    
    var randomVelocity: Int {
        return velocities[randomNumber]
    }
    
    private func nextImage(i: Int) -> CGImage? {
        let image = UIImage(named: imagesNames[i % dimension])
        return image?.cgImage
    }
    
    private func setUpTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let x = sender.location(in: view).x
        let y = sender.location(in: view).y
        
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        
        emitterLayer.birthRate = 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            self?.emitterLayer.birthRate = 0
        }
        
        view.layer.addSublayer(emitterLayer)
    }
}
