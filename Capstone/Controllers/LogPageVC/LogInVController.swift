//
//  LogInVController.swift
//  Capstone
//
//  Created by Hind Alharbi on 12/9/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LogInVController: UIViewController {

    @IBOutlet weak var logInTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var studentGuideLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labeltext3()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func LogInToHome(_ sender: Any) {
        if let email = logInTextField.text, let password = passTextField.text{
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let e  = error{
                print(e)
            }else{
                self?.performSegue(withIdentifier: Constants.loginHome, sender: self)
            }
        }
    }
}
}
extension LogInVController{
    
    func labeltext3(){
        
        var charIndex3 = 0.0
        let titelText = "Student Gidue"
        for letter in titelText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex3, repeats: false) { (timer )in
                self.studentGuideLabel?.text?.append(letter)
            }
           charIndex3 += 1
        }
        
    }
    
    
    

}