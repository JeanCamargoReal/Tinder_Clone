//
//  CombineVC.swift
//  Tinder Clone
//
//  Created by Jean Camargo on 19/04/21.
//

import UIKit

class CombineVC: UIViewController {
    
    var usuarios: [Usuario] = []
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        self.buscaUsuarios()
    }
    
    func buscaUsuarios() {
        self.usuarios = UsuarioService.shared.buscaUsuarios()
        self.adicionarCards()
    }
}


extension CombineVC {
    
    func adicionarCards() {
        
        for usuario in usuarios {
            
            let card = CombineCardView()
            
            card.frame = CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width - 32,
                height: view.bounds.height * 0.7
            )
            
            card.center = view.center
            card.usuario = usuario
            card.tag = usuario.id
            
            // Observador para quando o usuário clicar no card e arrastar.
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            
            card.addGestureRecognizer(gesture)
            
            view.insertSubview(card, at: 0)
        }
    }
}

extension CombineVC {
    
    @objc func handlerCard(_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view as? CombineCardView {
            // Pega a posição que o usuário está arrastando
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            // Rotação do card
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            // Animação like e deslike
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.deslikeImageView.alpha = 0
            } else {
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotationAngle * 5 * -1
            }
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            // Retorna o card para posição central
            if gesture.state == .ended {
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0
                }
            }
        }
    }
}
