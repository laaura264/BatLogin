//
//  ViewController.swift
//  BatLogin
//
//  Created by Laura Arranz on 31/01/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var lblInstructions: UILabel!
    
    var viewAnimator : UIViewPropertyAnimator! //'!' porque se va a tener creado en el momento que arranque la aplicación
    //Crear la animación que reconozca que se despliza la pantalla hacia arriba
    private let unlockGesture = UIPanGestureRecognizer()
    //Ocultar la status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Añadir un target para decirle lo que tiene que ejecutar cuando detecte el 'Pan'
        unlockGesture.addTarget(self, action: #selector(handle(pan:)))
        //Añadir el gestureRecognicer a la vista
        self.view.addGestureRecognizer(unlockGesture)
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.lblInstructions.layer.opacity = 0 //Opacidad para que cuando se acabe la animacion, la etiqueta no se vea
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
        //viewAnimator.startAnimation()
    }
    
    @objc func handle(pan:UIPanGestureRecognizer){
        let speed : CGFloat = 2.0
        switch pan.state {
        case .began: //Que la animación pase a un estado activo pero que no se mueva
            viewAnimator.pauseAnimation()
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            viewAnimator.fractionComplete = translation / 100 //Cantidad de animación que lleva transcurrida (0-1)
            if viewAnimator.fractionComplete >= 0.99 {
               buildAnimation()
            }
        default:
            break
        }
    }
    
    func buildAnimation(){
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            self.imgLogoBatman.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    func beginApp(){
        //Crear instancia del viewController que se ha creado en el storyboard
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
    }
}
