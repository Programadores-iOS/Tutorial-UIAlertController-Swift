//
//  ViewController.swift
//  Tutorial-UIAlertController-Swift
//
//  Created by Fernando Medina on 8/22/14.
//  Copyright (c) 2014 Programadores-iOS.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Do any additional setup after loading the view, typically from a nib.
    }

                            
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        //Comenta y remueve esta linea si deseas limpiar el valor de la llave noMolestar
       // NSUserDefaults.standardUserDefaults().removeObjectForKey("noMolestar")

        
        var noMolestar = NSUserDefaults.standardUserDefaults().boolForKey("noMolestar")
        
        if (!noMolestar)
        {
            mostrarAlerta()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func mostrarAlerta() {
        var alerta = UIAlertController(title: "Programadores-iOS.net", message: "Califica nuestra app!", preferredStyle: UIAlertControllerStyle.Alert)
           alerta.addAction(UIAlertAction(title: "Califica esta app", style: UIAlertActionStyle.Default, handler: { alertAction in
            UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/us/app/pages/id333903271?mt=8&uo=4"))
            alerta.dismissViewControllerAnimated(true, completion: nil)
        }))
        alerta.addAction(UIAlertAction(title: "No Gracias", style: UIAlertActionStyle.Default, handler: { alertAction in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "noMolestar")
            alerta.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        alerta.addAction(UIAlertAction(title: "Más tarde", style: UIAlertActionStyle.Default, handler: { alertAction in
            alerta.dismissViewControllerAnimated(true, completion: nil)
        }))
     
        self.presentViewController(alerta, animated: true, completion: nil)
    }
    
}

