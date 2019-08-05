//
//  LoginPage.swift
//  Login_Reg_Cordta
//
//  Created by JIJO G OOMMEN on 03/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import CoreData

class LoginPage: UITableViewController {

    @IBOutlet var username_login: UITextField!
    @IBOutlet var password_login: UITextField!
    
    
    var errormsg = "Alert"
    
    var us_name : String!
    var us_email : String!
    var us_phone : String!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
    }

    @IBAction func regsteraCtion(_ sender: Any) {
        
   let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPageid")as! RegisterPage
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
        
    }
    
    @IBAction func lOginaCtion(_ sender: Any) {
        
      checkvalidity()
        
//        username_login.text = ""
//        password_login.text = ""
        
    }
    
    
    func checkvalidity() {
        
        if username_login.hasText && password_login.hasText {
          
            let fetchrequest: NSFetchRequest<User> = User.fetchRequest()
            
            do {
                
                let result = try context.fetch(fetchrequest)
                
                for nam in result {
                    if nam.value(forKey: "name")as? String == username_login.text &&  nam.value(forKey: "password")as? String == password_login.text {
                        
                        print(result)
                        
 //-----------------------------------b-----------------------------------//
                        
                       us_name = nam.value(forKey: "name")as! String
                        print(us_name)
                        us_email = nam.value(forKey: "email") as! String
                        print(us_email)
                        us_phone = nam.value(forKey: "phonenumber")as! String
                        print(us_phone)

//-------------------------------------------------------------------------//
                        
                        let alertw = UIAlertController(title: "Success", message: "Log-in Success", preferredStyle: .alert)
                        alertw.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (_) in
                            let af = self.storyboard?.instantiateViewController(withIdentifier: "ProfilePageid")as! ProfilePage
                            
                            
                            //af.user_pass = pass
                            
                            
//---------------------------------b-----------------------------//
                            
                            af.user_nam = self.us_name as! String
                            af.user_emai = self.us_email as! String
                            af.user_phon = self.us_phone as! String
                            
//----------------------------------------------------------------//
                            
                            self.navigationController?.pushViewController(af, animated: true)
                        }))
                        
                        self.present(alertw,animated: true,completion: nil)
                        
                    }
                    else {
                       print("log-in failed")
                    }
                    
                }
            }
            catch{
                print("failure")
            }
            
            
        
    }
        else {
            popaletr(for: "Empty Field")
            
        }
    
    
    
}
    
    func popaletr(for errormsg : String){
        
        let alert = UIAlertController(title: "Alert", message: errormsg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true,completion: nil)
    }
    
    
    
}
