//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Laura Arranz on 01/02/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgLogoBatman: UIImageView!
    @IBOutlet weak var imgBatLogin: UIImageView!
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    
    var headerAnimator : UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgLogoBatman.transform = CGAffineTransform(translationX: 0.0, y: -120.0)
        imgBatLogin.transform = CGAffineTransform(translationX: 0, y: -170.0)
        lblUsuario.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        lblPass.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        txtUsuario.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        txtPass.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        
    }
    
    //Ocultar la barra de estado
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //Poner bordes rebordeados en los cuadros de texto
    func configureViews(){
        txtUsuario.layer.cornerRadius = 3.0
        txtPass.layer.cornerRadius = 3.0
        btnEntrar.layer.cornerRadius = 3.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViews()
        buildAnimations()
    }
    
    func buildAnimations(){
        headerAnimator = UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgLogoBatman.transform = CGAffineTransform.identity
            self.imgBatLogin.transform = CGAffineTransform.identity
            self.lblUsuario.transform = CGAffineTransform.identity
            self.lblPass.transform = CGAffineTransform.identity
            self.txtUsuario.transform = CGAffineTransform.identity
            self.txtPass.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
    }
}
