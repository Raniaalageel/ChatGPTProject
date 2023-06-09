//
//  LoginViewController.swift
//  ChatGPT
//
//  Created by Rania Alageel on 25/08/1444 AH.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CoreMedia


class LoginViewController: UIViewController {



    @IBOutlet weak var emailTextfiled1: UITextField!
    @IBOutlet weak var passwordTextfiled1: UITextField!
    @IBOutlet weak var validationMessegepass1: UILabel!
    @IBOutlet weak var buttonlogin1: UIButton!



    let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 34),
          .foregroundColor: UIColor.gray,
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]

    override func viewDidLoad() {
        super.viewDidLoad()

        func viewWillDisappear(_ animated: Bool) {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action:nil)

        }

        validationMessegepass1.isHidden = true
//        self.emailTextfiled1.delegate = self
//        self.passwordTextfiled1.delegate = self
        self.tabBarController?.tabBar.isHidden = true


        // Do any additional setup after loading the view.

      //    self.emailTextfiled.text = " 1232@lecture.ksu.edu.sa"
     //   self.passwordTextfiled.text = "12345678"



    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action:nil)

    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.resignFirstResponder()
        return(true)
    }
    //touch out
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //return key


    func isValid() -> (Bool, String, String) {

        validationMessegepass1.isHidden = true

        guard let email = emailTextfiled1.text?.trimmingCharacters(in: .whitespaces).lowercased() , !email.isEmpty
        else {
            //H
          //     validationMessegepass1.isHidden = false
            validationMessegepass1.text = "الرجاء ادخال البريد  الالكتروني"
            return (false, "", "")
        }
        guard let password = passwordTextfiled1.text, !password.isEmpty else {
            //H
          //   validationMessegepass1.isHidden = false
            validationMessegepass1.text = "الرجاء ادخال كلمة  المرور"
            return (false, "", "")
        }
        if !isValidEmail(emailID: email) {
            //H
          //   validationMessegepass1.isHidden = false
            validationMessegepass1.text = "الرجاء ادخال بريد صحيح"
            return (false, "", "")
        }

        return (true, email, password)
    }


@IBAction func loginpressed(_ sender: Any) {

//            let validationResult = isValid()
//            if validationResult.0 == false { return }
//
//            let email = validationResult.1
//            let password = validationResult.2
//
//
//                if (email != "m@gmail.com" || password != "123"){   //if no connect with firebase
//                    print(email)
//                    print("Wrong email or password !!!")
//                    let alert = UIAlertController(title: "تنبيه", message: "البريد الالكتروني او كلمةالمرور غير صحيح", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true, completion: nil)
//
//                }else{   //user Auth in firebase
//                    print("sucssesYES")
//                    self.performSegue(withIdentifier: "go", sender: self)
//
//                }//end elsee
//
//    } //end func

    let validationResult = isValid()
    if validationResult.0 == false {return}

    let email = validationResult.1
    let password = validationResult.2
    Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
        if let e=error{   //if no connect with firebase

            print(email)
            Global.shared.useremailshare = email
            print("Global.shared.useremailshare",Global.shared.useremailshare)
            print(password)
            print("failed 11111")
            let alert = UIAlertController(title: "تنبيه", message: "البريد الالكتروني او كلمةالمرور غير صحيح", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }else{   //user Auth in firebase
            print("sucssesYES")
            Global.shared.useremailshare = email
            print("Global.shared.useremailshare",Global.shared.useremailshare)
            Task {
                let db = Firestore.firestore()
                if await self.checkEmailExist(email: email, collection: "User", field: "email") {
                    print("child exists")
                    self.performSegue(withIdentifier: "go", sender: self)}
                else {
                    print("does not exist")
                    let alert = UIAlertController(title: "تنبيه", message: "البريد الالكتروني او كلمةالمرور غير صحيح", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)

                } //end else
            }  //end tak
        } //end elsee
    } //end sign in
}//end loginpressed



    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[0-9A-Za-z.]{1,30}+@[A-Za-z]{1,10}+\\.[A-Za-z]{1,5}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }



    func checkEmailExist(email: String, collection: String, field: String) async -> Bool {
       // print("what??")
        let db = Firestore.firestore()
        do {
            let snapshot = try await db.collection(collection).whereField(field, isEqualTo: email).getDocuments()
            print("COUNT ", snapshot.count)
            print("not added")
            return snapshot.count != 0
        } catch {
            print(error.localizedDescription)
            print("added")
            return false
        }
    }


//    @@@@ Store use data in the firebase @@@@

    func storeUserInformation(collection: String, data: [String: Any]) async {
        //  var ref: DocumentReference? = nil
        // guard let uid=Auth.auth().currentUser?.uid else {return }
        let db = Firestore.firestore()
        do {
            try await db.collection(collection).document().setData(data)
        } catch {
            print(error.localizedDescription)
        }
    }  //end func


}
