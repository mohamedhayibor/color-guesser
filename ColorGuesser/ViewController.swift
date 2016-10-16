//
//  ViewController.swift
//  ColorGuesser
//
//  Created by Mohamed Hayibor on 10/14/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    
    // helper function for more UIColors
    let colors = [["F18200","Gold Drop"],["F19BAB","Wewak"],["FF6037","Outrageous Orange"],["FF6600","Blaze Orange"],["FF66FF","Pink Flamingo"],["FF681F","Orange"],["FF69B4","Hot Pink"],["FF6B53","Persimmon"],["FF6FFF","Blush Pink"],["FF7034","Burning Orange"],["FF7518","Pumpkin"],["FF7D07","Flamenco"],["FF7F00","Flush Orange"],["FF7F50","Coral"],["FF8C69","Salmon"],["FF9000","Pizazz"],["FF910F","West Side"],["FF91A4","Pink Salmon"],["FFEAD4","Karry"],["FFEC13","Broom"],["FFEDBC","Colonial White"],["FFEED8","Derby"],["FFEFA1","Vis Vis"],["FFEFC1","Egg White"],["FFEFD5","Papaya Whip"],["FFEFEC","Fair Pink"],["FFF0DB","Peach Cream"],["FFF0F5","Lavender blush"],["FFF14F","Gorse"],["FFF1B5","Buttermilk"],["FFF1D8","Pink Lady"],["FFF1EE","Forget Me Not"],["FFF1F9","Tutu"],["FFF39D","Picasso"],["FFF3F1","Chardon"],["FFF46E","Paris Daisy"],["FFF4CE","Barley White"],["FFF4DD","Egg Sour"],["FFF4E0","Sazerac"],["FFF4E8","Serenade"],["FFF4F3","Chablis"],["FFF5EE","Seashell Peach"],["FFF5F3","Sauvignon"],["FFF6D4","Milk Punch"]]
    
    // to apply randomness in the color buttons > only one will be true, the other will be false
    // then the array will be randomized at every successful guess (top down api design)
    var buttonControllers = [false, false, true, false]
    
    // setting action for every button (click -> action that gets triggered)
    // check first if
    
    func genericButtonAction(buttonPosition: Int) {
        if buttonControllers[buttonPosition] {
            changeColorButton()
        } else {
            print(">>>>>> try again")
        }
    }
    
    // Every button will check whether it is hitting the right color then execute
    // lanch the next scene
    @IBAction func firstButtonAction(_ sender: UIButton) {
        genericButtonAction(buttonPosition: 0)
    }
    
    @IBAction func secondButtonAction(_ sender: AnyObject) {
        genericButtonAction(buttonPosition: 1)
    }
    
    @IBAction func thirdButtonAction(_ sender: UIButton) {
        genericButtonAction(buttonPosition: 2)
    }
    
    @IBAction func fourthActionButton(_ sender: UIButton) {
        genericButtonAction(buttonPosition: 3)
    }
    
    func getRandomColorFunc() -> [String] {
        let colorsLength = colors.count
        return colors[ Int(arc4random_uniform( UInt32(colorsLength))) ]
    }
    
    func randomizeEverything () {
        firstButton.setTitle(getRandomColorFunc()[1], for: UIControlState.normal)
        secondButton.setTitle(getRandomColorFunc()[1], for: UIControlState.normal)
        thirdButton.setTitle(getRandomColorFunc()[1], for: UIControlState.normal)
        fourthButton.setTitle(getRandomColorFunc()[1], for: UIControlState.normal)
    }
    
    @IBAction func changeColorButton() {
        let getRandomColor = getRandomColorFunc()
        view.backgroundColor = hexStringToUIColor(getRandomColor[0])
        
        let nameOfColor = getRandomColor[1]
        print("\n>>>>>>pressed: name \( nameOfColor )")
        
        // discuted by this terrible hack, will definitely refactor later
        
        // 1. randomize everything
        randomizeEverything()
        
        // 2. making sure the label corresponds to the right color
        if buttonControllers[0] {
            firstButton.setTitle(nameOfColor, for: .normal)
        } else if buttonControllers[1] {
            secondButton.setTitle(nameOfColor, for: .normal)
        } else if buttonControllers[2] {
            thirdButton.setTitle(nameOfColor, for: .normal)
        } else {
            fourthButton.setTitle(nameOfColor, for: .normal)
        }
        
        buttonControllers = [false, false, false, false]
        // at a random index set boolean to true > will be the right answer at next scene
        // 4: represents the number of buttons
        buttonControllers[ Int(arc4random_uniform( UInt32(4))) ] = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // executes at new load 
        print("Lifecycle hook not needed yet")
    }
    
    func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


/** Series of junk code that didn't work:
 let jsonPath = Bundle.main.path(forResource: "colors", ofType: "json")
 do {
 let json = try JSONSerialization.data(withJSONObject: jsonPath)
 } catch {
 print(">>>>>>> Oops: ")
 }
 
 // print("json >>>>>>> \(json)")
 
 // let jsonData = NSData(contentsOfFile: jsonPath!)
 // let colors = NSJSONSerialization.JSONObjectWithData(jsonData)
 credits to stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
 
 Interesting answer: Ibrahima: c'est le combat de la vie
**/

