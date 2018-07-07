//
//  ViewController.swift
//  RealDatabase
//
//  Created by Higher Visibility on 07/07/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var txt_name: UITextField!
    
    @IBOutlet weak var txt_jobname: UITextField!
    var ref: DatabaseReference!
    
   
    @IBAction func save_user(_ sender: UIButton) {
        
        self.ref.child("Person").child(self.txt_name.text!).setValue(self.txt_jobname.text!)
        
    }
    @IBAction func update_user(_ sender: UIButton) {
        
        
        self.ref.child("Person").child(self.txt_name.text!).setValue(self.txt_jobname.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Database.database().reference()
   
        ref.child("Person").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print(value)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

}

