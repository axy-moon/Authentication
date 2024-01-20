import UIKit

class ProfileViewController: UIViewController {

    var username = ""
    @IBOutlet weak var box: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var user = UserManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box.layer.cornerRadius = 4
        box.layer.borderWidth = 2
        box.layer.borderColor = UIColor.systemOrange.cgColor
        
       
        Task {
            do {
                let res = try await user.getProfile()
                usernameLabel.text = res.result.fullName
                mailLabel.text = res.result.email
                genderLabel.text = res.result.gender
                let number = "\(res.result.contact.code) \(res.result.contact.number)"
                contactLabel.text = number
            } catch APIError.invalidResponse {
                print("API Error")
            } catch {
                print("Unexpected Error")
            }
        }
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    @IBAction func EditProfile(_ sender: UIButton) {
        let vc = EditProfileViewController()
        present(vc,animated : true,completion : nil)
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
