//
//  ProfilePage.swift
//  Login_Reg_Cordta
//
//  Created by JIJO G OOMMEN on 04/08/19.
//  Copyright © 2019 JIJO G OOMMEN. All rights reserved.
//

import UIKit
import CoreData

class ProfilePage: UITableViewController {
    
    
   // var user_pass : String!
    
    var user_nam : String!
    var user_emai : String!
    var user_phon : String!
    
    @IBOutlet var name_profile: UILabel!
    @IBOutlet var email_profile: UILabel!
    @IBOutlet var phone_profile: UILabel!
    
   var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

      getdata()
    }
    
    
    func getdata(){
        
        
       // print("PROFILE PAGE :\(user_name)")
        
//      let fetchrequest: NSFetchRequest<User> = User.fetchRequest()
//
//        do {
//            let userdata = try context.fetch(fetchrequest)
//            for data in userdata{
//                if data.value(forKey: "password")as? String == user_name {
//                    name_profile.text = data.value(forKey: "name") as! String
//                    email_profile.text = data.value(forKey: "email")as! String
//                    phone_profile.text = data.value(forKey: "phonenumber")as! String
//                }
//            }
//        }catch {
//            print("fetch data failed")
//        }
        
  //----------------------b------------------------------------------//
        name_profile.text = user_nam as! String
        email_profile.text = user_emai as! String
        phone_profile.text = user_phon as! String
        
   //-----------------------------------------------------------------//
    }

    @IBAction func eXitbtn(_ sender: Any) {
        
     //   user_pass = ""
        
     self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    

}
