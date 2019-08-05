//
//  RegisterPage.swift
//  Login_Reg_Cordta
//
//  Created by JIJO G OOMMEN on 03/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import CoreData

class RegisterPage: UITableViewController {
    
    @IBOutlet var name_reg: UITextField!
    @IBOutlet var emil_reg: UITextField!
    @IBOutlet var phone_reg: UITextField!
    @IBOutlet var password_reg: UITextField!
    
    
    var errormsg = "Enter all Fields"
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func resEtbtn(_ sender: Any) {
        
        name_reg.text! = ""
        emil_reg.text! = ""
        phone_reg.text! = ""
        password_reg.text = ""
        
        
    }
    
    @IBAction func suBmitaCtion(_ sender: Any) {
        
        if name_reg.hasText && emil_reg.hasText && phone_reg.hasText && password_reg.hasText {
            
            if name_reg.text!.count < 3 {
                popaletr(for: "Invalid Name")
                
            }
            else if phone_reg.text!.count < 10 {
                popaletr(for: "Enter Valid Number")
            }
            else {
                checkemail()
                savedata()
                
                
            }
            
       let alertq = UIAlertController(title: "Success", message: "Registeration Complete", preferredStyle: .alert)
            
            alertq.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
                
                let bc = self.storyboard?.instantiateViewController(withIdentifier: "LoginPageid") as! LoginPage
                
                self.navigationController?.popViewController(animated: true)
            }))
            
            self.present(alertq,animated: true,completion: nil)
            
            
        }
        
        else {
            popaletr(for: "Fields Empty")
        }
        
        
        
        
        
        
    }
    
    func checkemail() {
        let emailvalidity = emailValidator(testStr: emil_reg.text!)
        if emailvalidity == false {
            
            
            popaletr(for: "Enter Valid email")
        }
    }
    
    
    func emailValidator(testStr : String)  -> Bool {
        let regExpForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailToTest = NSPredicate(format:"SELF MATCHES %@", regExpForEmail)
        return emailToTest.evaluate(with: testStr)
        
    }
    
    
    func savedata() {
        
     let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
     let newUser = NSManagedObject(entity: entity!, insertInto: context)
       
     newUser.setValue(name_reg.text, forKey: "name")
     newUser.setValue(emil_reg.text, forKey: "email")
     newUser.setValue(phone_reg.text, forKey: "phonenumber")
     newUser.setValue(password_reg.text, forKey: "password")
        
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Failed saving")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //-------function for alert------------//
    
    func popaletr(for errormsg : String){
        
   let alert = UIAlertController(title: "Alert", message: errormsg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
   

}
