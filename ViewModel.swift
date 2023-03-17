//
//  ViewModel.swift
//  ChatGPT
//
//  Created by Sara Alsaleh on 25/08/1444 AH.
//

import UIKit
import AVKit
import Foundation


import MobileCoreServices
import UniformTypeIdentifiers
import FirebaseFirestore
import FirebaseStorage
import PDFKit

var my = false
var x = ""

var textCV = ""



class ViewModel: UIViewController,ObservableObject, UITextFieldDelegate , UITextViewDelegate , UIDocumentPickerDelegate {
    
    
    
    @IBOutlet weak var fileds: UITextView!
    
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var sentButton: UIButton!
    
    var isInteractingWithChatGPT:Bool = false
    // var MessageRow = ""
    var messages = ""
    //[MessageRow] = []
    var inputMessage: String = ""
    
    var api: ChatGPTAPI = ChatGPTAPI(apiKey: "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")
    
    @IBOutlet weak var resonceLabel: UITextView!
    
    var msg = " Correct this text: TopCodes are from an opensource computer vision library that is designed to identify and track tangible objects on a flat surface quickly and easily.A database is an organized collection of structured information,The data can then be easily accessed, managed, modified, updated, controlled, and organized. Kawakeb uses a database to store and retrieve the data needed for the application to implement the features fully.Kawakeb was be implemented using NoSQL. NoSQL databases database because it has great performance, so it is designed to be able to handle large amounts of data and traffic. loss is a number indicating how bad the model's prediction"
    
    let sendImage: String = ""
    let sendText: String = ""
    let responseImage: String = ""
    var responseText: String?
    var responseError: String?

    
    
    @IBOutlet weak var imp: UIButton!
    @IBOutlet weak var cnacelBtn: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet weak var SendBtn: UIButton!
    var Takesection: String = ""
    var   datePreesed: String = ""
    var fileURL: URL?
    
    
    let db = Firestore.firestore()
    var   fileRetrive:String!
    
    
    
    
    var urll :URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("helloo")
        
        fileds.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        fileds.layer.borderWidth = 1.0
        fileds.layer.cornerRadius = 5
      fileds.tag = 2
        
        
        db.collection("User").whereField("email", isEqualTo: "rania@gmail.com").getDocuments{
            (snapshot, error) in
            if let error = error {
                print("FAIL")
            }
            else {
                print("SUCCESS??")
                
                self.fileRetrive = snapshot!.documents.first!.get("file") as! String
                print("??????FlowerPoints",self.fileRetrive!)
                
                self.urll = URL(string: self.fileRetrive)
                
        

    }
            
        }
        
    }
    
    
    @objc func doubleTapped(_ recognizer: UITapGestureRecognizer) {

            print(recognizer.view!.tag)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValid() -> (Bool, String?, String?) {
      
      
        if (my == false){
            label.text = "please choose a file!"
            label.textColor = #colorLiteral(red: 0.662745098, green: 0.1333333333, blue: 0.1176470588, alpha: 1)
           SendBtn.isEnabled = false
            return (false, "", "")
        }else{
        let file = fileURL?.absoluteString
        let c =  fileURL?.lastPathComponent
        print(c)
        var vb = file?.count
    
        return (true, "", "")
    }
}
    
  
    
    @IBAction func importFile(_ sender: Any) {
        
        print("before import")
        let documentPicker  = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf], asCopy: true)
        
        //change the type ^^^^
        documentPicker.delegate = self
        
        documentPicker.allowsMultipleSelection = false // ease of use.only one doc
        documentPicker.shouldShowFileExtensions = true
        print("after  import")
        present(documentPicker, animated: true, completion: nil)
        
       
        
    }
    
    @IBAction func sendPressed(_ sender: Any) {

        print("send is statrt")
        
    // SendBtn.isEnabled = false
       print("my",my)
        if (my == false){
                           label.text = "please choose a file!"
                           label.textColor = #colorLiteral(red: 0.662745098, green: 0.1333333333, blue: 0.1176470588, alpha: 1)
            SendBtn.isEnabled = false
                       }
        areYouSure()

        
    }
    
    
    func areYouSure () {
        var sure = false
            let res = self.isValid()
            if res.0 == false {
                print("what is ???? ")
                return
                
            }
            
                 //   code
                 let title = res.1
                 let reason = res.2
                 let db = Firestore.firestore()
             
                 Task {
                     let db = Firestore.firestore()
                     print("task1")
                     let url = await self.uploadPDF()
                     print("url" , url)
                         print("task2")
                 
                        
                     if (url == nil){
                         print("inside task with print url" , url)
                         return
                     }
//                     print("task3")
//                     guard let userDocID = try await db.collection("User").getDocuments().documents.first?.documentID else {
//                         return
//                     }
//
                     
                     print("task5")
                     db.collection("User").whereField("email", isEqualTo: "rania@gmail.com").getDocuments{
                         (snapshot,error) in
                         if let error = error {
                             print("fail")
                         }
                         else{
                             print("suus")
                         }
                         
                         let student_docID = snapshot!.documents.first!.documentID
                         
                     db.collection("User").document(student_docID).setData([
                            "file": url?.absoluteString
                        ],merge: true) { err in
                            if let err = err {
                                print("Error adding Lecturer  : \(err)")
                            }else {
                                
                                print("done")
                     }
                    
                   
                 } //task

                 }
     
                 }
            }
    
    
    func uploadPDF() async -> URL? {
       
        guard let fileURL = fileURL else {
           SendBtn.isEnabled = false
            print("fileURL",fileURL)
            label.text = "please choose a file!"
            label.textColor = #colorLiteral(red: 0.662745098, green: 0.1333333333, blue: 0.1176470588, alpha: 1)
            return nil }//here
        SendBtn.isEnabled = true
        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child("files/\(UUID().uuidString).pdf")
        do {
            let _ = try await fileRef.putFileAsync(from: fileURL, metadata: nil)
            print("uploaded")
            
                   
            let url = try await fileRef.downloadURL()
            print("url5555555", url)
            return url
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
        // Create a root reference
        print("inside doucoment ")
        fileURL = urls.first
        print("inside doucoment fileURL" , fileURL)
        imp.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        my = true
        SendBtn.isEnabled = true
        label.text = urls.first?.lastPathComponent
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        var dialogMessage = UIAlertController(title: "Message", message: "file uploaded successfuly", preferredStyle: .alert)
       
               // Create OK button with action handler
               let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                   print("Ok button tapped")
                })
       
               //Add OK button to a dialog message
               dialogMessage.addAction(ok)
               // Present Alert to
               self.present(dialogMessage, animated: true, completion: nil)
       
       
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        imp.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "please choose a file!"
        label.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.backBarButtonItem = UIKit.UIBarButtonItem(title: "", style: .plain, target: nil, action: nil )
      //  navigationItem.backBarButtonItem =
        
       
    }
    
    
    
    
    @IBAction func funcButton(_ sender: UIButton) {
        //صحح لي
       
        
        if let pdf = PDFDocument(url: urll!) {
            let pageCount = pdf.pageCount
            print(pageCount,"pageCount")
            
            let documentContent = NSMutableAttributedString()
         //   var textCV = ""
           // print ("documentContent 111111",documentContent)
            for i in 0 ..< pageCount {
                
                guard let page = pdf.page(at: i) else { continue }
               // print(page,"page")
                guard let pageContent = page.attributedString else { continue }
            //print("pageCount",pageContent)
           textCV = pageContent.string
              //  documentContent.append(pageContent.string)
              //  print(documentContent,"documentContent")
            }
            print("documentContent finall",textCV)

        }
        
        
        fileds.text = textCV
        
        Task{
          
            await send(text: fileds.text)
            print("the responce text is:",responseText)
          resonceLabel.text = responseText
            
        }
        
    }
    
    
    func send(text: String) async  {
        print("send")
        isInteractingWithChatGPT = true
        var streamText = ""
        
        //        var messageRow = MessageRow(
        //            isInteractingWithChatGPT: true,
        //            sendImage: "profile",
        //            sendText: text,
        //            responseImage: "openai",
        //            responseText: streamText,
        //            responseError: nil)
        
        //  var messageRow = text
        
        // self.messages.append(messageRow)
        
        do {
            let stream = try await api.sendMessageStream(text: text)
            // if let stream = try await api.sendMessageStream(text: text) {
            for try await text in stream {
                streamText += text
                responseText = streamText.trimmingCharacters(in: .whitespacesAndNewlines)
                //self.messages[self.messages.count - 1] = messageRow
            }
            // }
            
        } catch {
            responseError = error.localizedDescription
        }
        
        isInteractingWithChatGPT = false
        //  self.messages[self.messages.count - 1] = messageRow
        isInteractingWithChatGPT = false
        // speakLastResponse()
        
    }
    

    

}
