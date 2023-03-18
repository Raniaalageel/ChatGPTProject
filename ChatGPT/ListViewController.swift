//
//  ListViewController.swift
//  ChatGPT
//
//  Created by SHAMMA  on 25/08/1444 AH.
//


import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CoreMedia

class ListViewController: UIViewController





{
    
    
    @IBOutlet weak var bbtn: UIButton!
    
    @IBOutlet weak var engbtn: UIButton!
    
    @IBOutlet weak var helthbtn: UIButton!
    
    @IBOutlet weak var itbtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        bbtn.layer.shadowColor = UIColor.gray.cgColor
        bbtn.layer.shadowOpacity = 1.0
        bbtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        bbtn.layer.shadowRadius = 6

       // bbtn.translatesAutoresizingMaskIntoConstraints = false
        //
        engbtn.layer.shadowColor = UIColor.gray.cgColor
        engbtn.layer.shadowOpacity = 1.0
        //engbtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        engbtn.layer.shadowRadius = 6

      //  engbtn.translatesAutoresizingMaskIntoConstraints = false
        //
        helthbtn.layer.shadowColor = UIColor.gray.cgColor
        helthbtn.layer.shadowOpacity = 1.0
        helthbtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        helthbtn.layer.shadowRadius = 6

       // helthbtn.translatesAutoresizingMaskIntoConstraints = false
        //
        itbtn.layer.shadowColor = UIColor.gray.cgColor
        itbtn.layer.shadowOpacity = 1.0
        itbtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        itbtn.layer.shadowRadius = 6

        //itbtn.translatesAutoresizingMaskIntoConstraints = false

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
