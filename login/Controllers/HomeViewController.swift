//
//  HomeViewController.swift
//  login
//
//  Created by Kiran Gutta on 12/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    var username = ""
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Hello \(username)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
