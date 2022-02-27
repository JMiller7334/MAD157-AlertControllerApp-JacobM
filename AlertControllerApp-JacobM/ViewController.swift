//
//  ViewController.swift
//  AlertControllerApp-JacobM
//
//  Created by student on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.numberOfLines = 0
    }
    // MARK: Functions
    func onDestroyed(){
        print("destroy action taken")
    }
    
    //MARK: Actions
    // Single option alert
    @IBAction func buttonTapped(_ sender: Any) {
        let alert = UIAlertController(title:"Warning", message: "Zombies on the loose", preferredStyle: .alert) //generate an instance of alert
        
        // Create the action buttons for the alert.
        let okayAction = UIAlertAction(title: "Agree", style: .default, handler: {action -> Void in}) //create an action to link to the alert.
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil) //show the alert to the user.
    }
    
    //multi action alert
    @IBAction func button2Tapped(_ sender: Any) {
        // note the different styles for each alert action.
        let alert2 = UIAlertController(title: "Warning", message: "Zombies are loose!", preferredStyle: .alert)
        
        let okayAction2 = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            self.myLabel.text = "Okay" //action taken with this choice
        })
        let cancelAction2 = UIAlertAction(title: "Cancel", style: .cancel, handler: {action -> Void in
            self.myLabel.text = "Cancel"
        })
        let destroyAction2 = UIAlertAction(title: "Destroy", style: .destructive, handler: {action -> Void in
            self.myLabel.text = "Destroy"
            self.onDestroyed()// best practice to call other functions from here if a complicated task is needed to be performed.
        })
        
        // setup alert properties
        alert2.addAction(okayAction2)
        alert2.addAction(cancelAction2)
        alert2.addAction(destroyAction2)
        self.present(alert2, animated: true, completion: nil)
    }
    
    //Text field alert
    @IBAction func button3Tapped(_ sender: Any) {
        let alert3 = UIAlertController(title: "Log In", message: "Enter Password Here", preferredStyle:.alert)
        
        alert3.addTextField(configurationHandler: {(textField) in
            // config the text feidl to be inserted
            textField.placeholder = "Password here"
            textField.isSecureTextEntry = true
        })
        
        //alert actions
        let okayAction3 = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            let savedText = alert3.textFields![0] as UITextField
            self.myLabel.text = savedText.text
        })
        alert3.addAction(okayAction3)
        self.present(alert3, animated: true, completion: nil)
    }
}

