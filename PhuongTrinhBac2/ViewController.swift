//
//  ViewController.swift
//  PhuongTrinhBac2
//
//  Created by Kiet Nguyen on 4/9/17.
//  Copyright © 2017 Group9_iOSUTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtA: UITextField!
    
    
    @IBOutlet weak var txtB: UITextField!
    
    
    @IBOutlet weak var txtC: UITextField!
    
    
    
    @IBOutlet weak var buttonGiaiPT: UIButton!
    
    
    @IBOutlet weak var labelKQ1: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        labelKQ1.isHidden = true //an label ket qua khi chua nhap gia tri
        
        txtA.delegate = self
        txtB.delegate = self
        txtC.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func GiaiPT(_ sender: Any) {
        
        labelKQ1.isHidden = false
        if ((txtA.text?.isEmpty)! || (txtB.text?.isEmpty)! || (txtC.text?.isEmpty)!){
            labelKQ1.text = "Vui lòng nhập vào giá trị"
        }
            
            
            
        else{
            let a:Float = (Float)(txtA.text!)!
            let b:Float = (Float)(txtB.text!)!
            let c:Float = (Float)(txtC.text!)!
            
            var Delta:Float
            var Nghiem1:Float
            var Nghiem2:Float
            
            
            
            if(a==0 && b==0 && c==0)
            {
                labelKQ1.text = "Phương trình vô so nghiệm"
            }
                
                
            else if( a==0 ){
                labelKQ1.text = "Phương trình có nghiệm x = \(-c/b)"
            }
                
            else{
                Delta = b*b - 4*a*c
                if(Delta < 0){
                    labelKQ1.text = "Phương trình vô nghiệm"
                }
                else if (Delta==0){
                    labelKQ1.text = "Phương trình có nghiệm kép x = \(-b/(2*a))"
                }
                else{
                    Nghiem1 = (-b + (sqrt(Delta)))/2*a
                    Nghiem2 = (-b - (sqrt(Delta)))/2*a
                    labelKQ1.text = "Phương trình có 2 nghiệm phân biệt \n x1 = \(Nghiem1) và x2 = \(Nghiem2)"
                }
            }
        }
    }
    
    //tao validation 
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            
            return true
        } else {
            if string == "." { // ao thap phan
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                } else{
                    if countdots > 0 && string == "." {
                        return false
                        
                    } else {
                        return true
                        
                    }
                }
                
            } else {
                
                if string == "-" { // so am
                    
                    if (textField.text!.isEmpty == true) {
                        
                        return true
                        
                    }
                        
                    else {
                        
                        return false
                    }
                } else {
                    
                    return false
                    
                }
            }
            
        }
        

    }
    
}

