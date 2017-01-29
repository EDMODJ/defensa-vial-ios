//
//  PanicViewController.swift
//  DefensaVial
//
//  Created by EDSON MOISES CORTES MOLINA on 1/28/17.
//  Copyright © 2017 mecabotware. All rights reserved.
//

import UIKit

class PanicViewController: UIViewController{
    
    @IBOutlet weak var btnClose: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stopRecording(_ sender: UIBarButtonItem) {
    
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
