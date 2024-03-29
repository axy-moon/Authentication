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
    var userProjects = ProjectManager()
    
    var projects : [String] = []
    
    var user = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        Task {
            let res = try await userProjects.getProjects()
            for i in res.result {
                projects.append(i.name)
            }
            ProjectTableView.reloadData()
        }
        ProjectTableView.dataSource = self
        
        
//        print(UserDefaults.standard.string(forKey: "token")!)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ProjectTableView: UITableView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectsCell", for: indexPath)
        cell.textLabel?.text = projects[indexPath.row]
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(projects[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
