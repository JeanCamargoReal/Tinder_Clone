//
//  CombineVC.swift
//  Tinder Clone
//
//  Created by Jean Camargo on 19/04/21.
//

import UIKit

class CombineVC: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        redView.center = view.center
        
        // Observador para quando o usuário clicar no card e arrastar.
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlerCard))
        
        redView.addGestureRecognizer(gesture)
        
        view.addSubview(redView)
    }
}

extension CombineVC {
    
    @objc func handlerCard(_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view {
            // pega a posição que o usuário está arrastando
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            // retorna o card para posição central
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                }
                
                
            }
        }
    }
}
