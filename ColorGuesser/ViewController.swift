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
    let colors = [["F18200","Gold Drop"],["F19BAB","Wewak"],["FF6037","Outrageous Orange"],["FF6600","Blaze Orange"],["FF66FF","Pink Flamingo"],["FF681F","Orange"],["FF69B4","Hot Pink"],["FF6B53","Persimmon"],["FF6FFF","Blush Pink"],["FF7034","Burning Orange"],["FF7518","Pumpkin"],["FF7D07","Flamenco"],["FF7F00","Flush Orange"],["FF7F50","Coral"],["FF8C69","Salmon"],["FF9000","Pizazz"],["FF910F","West Side"],["FF91A4","Pink Salmon"],["FFEAD4","Karry"],["FFEC13","Broom"],["FFEDBC","Colonial White"],["FFEED8","Derby"],["FFEFA1","Vis Vis"],["FFEFC1","Egg White"],["FFEFD5","Papaya Whip"],["FFEFEC","Fair Pink"],["FFF0DB","Peach Cream"],["FFF0F5","Lavender blush"],["FFF14F","Gorse"],["FFF1B5","Buttermilk"],["FFF1D8","Pink Lady"],["FFF1EE","Forget Me Not"],["FFF1F9","Tutu"],["FFF39D","Picasso"],["FFF3F1","Chardon"],["FFF46E","Paris Daisy"],["FFF4CE","Barley White"],["FFF4DD","Egg Sour"],["FFF4E0","Sazerac"],["FFF4E8","Serenade"],["FFF4F3","Chablis"],["FFF5EE","Seashell Peach"],["FFF5F3","Sauvignon"],["FFF6D4","Milk Punch"], ["000000", "Black"],
                  ["000080", "Navy Blue"],
                  ["0000C8", "Dark Blue"],
                  ["0000FF", "Blue"],
                  ["000741", "Stratos"],
                  ["001B1C", "Swamp"],
                  ["016162", "Blue Stone"],
                  ["016D39", "Fun Green"],
                  ["01796F", "Pine Green"],
                  ["120A8F", "Ultramarine"],
                  ["123447", "Elephant"],
                  ["126B40", "Jewel"],
                  ["130000", "Diesel"],
                  ["20208D", "Jacksons Purple"],
                  ["202E54", "Cloud Burst"],
                  ["204852", "Blue Dianne"],
                  ["211A0E", "Eternity"],
                  ["25311C", "Green Kelp"],
                  ["2596D1", "Curious Blue"],
                  ["260368", "Paua"],
                  ["2F3CB3", "Governor Bay"],
                  ["2F519E", "Sapphire"],
                  ["2F5A57", "Spectra"],
                  ["2F6168", "Casal"],
                  ["363050", "Martinique"],
                  ["363534", "Tuatara"],
                  ["363C0D", "Waiouru"],
                  ["36747D", "Ming"],
                  ["3FC1AA", "Puerto Rico"],
                  ["3FFF00", "Harlequin"],
                  ["401801", "Brown Pod"],
                  ["4EABD1", "Shakespeare"],
                  ["4F1C70", "Honey Flower"],
                  ["4F2398", "Daisy Bush"],
                  ["4F69C6", "Indigo"],
                  ["615D30", "Costa Del Sol"],
                  ["61845F", "Glade Green"],
                  ["622F30", "Buccaneer"],
                  ["6E1D14", "Moccaccino"],
                  ["6E4826", "Pickled Bean"],
                  ["736D58", "Crocodile"],
                  ["737829", "Crete"],
                  ["7A58C1", "Fuchsia Blue"],
                  ["7A7A7A", "Boulder"],
                  ["84A0A0", "Granny Smith"],
                  ["8581D9", "Chetwode Blue"],
                  ["9DE093", "Granny Smith Apple"],
                  ["9DE5FF", "Anakiwa"],
                  ["AB917A", "Sandrift"],
                  ["ABA0D9", "Cold Purple"],
                  ["AF9F1C", "Lucky"],
                  ["AFA09E", "Martini"],
                  ["BF5500", "Rose of Sharon"],
                  ["BFB8B0", "Tide"],
                  ["C8A528", "Hokey Pokey"],
                  ["C8AABF", "Lily"],
                  ["D6D6D1", "Quill Gray"],
                  ["D6FFDB", "Snowy Mint"],
                  ["DAFAFF", "Oyster Bay"],
                  ["DB5079", "Cranberry"],
                  ["E16865", "Sunglo"],
                  ["E1BC64", "Equator"],
                  ["EAF6FF", "Solitude"],
                  ["EAF9F5", "Aqua Spring"],
                  ["EEDEDA", "Bizarre"],
                  ["EEE3AD", "Double Colonial White"],
                  ["F77703", "Chilean Fire"],
                  ["F77FBE", "Persian Pink"],
                  ["FBBEDA", "Cupid"],
                  ["FBCCE7", "Classic Rose"],]
    
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
    
    func randomizeEveryButtonLabel () {
        firstButton.setTitle(getRandomColorFunc()[1], for: .normal)
        secondButton.setTitle(getRandomColorFunc()[1], for: .normal)
        thirdButton.setTitle(getRandomColorFunc()[1], for: .normal)
        fourthButton.setTitle(getRandomColorFunc()[1], for: .normal)
    }
    
    @IBAction func changeColorButton() {
        // discusted by this terrible hack, will definitely refactor later
        // 1. randomize everything
        randomizeEveryButtonLabel()
        let getRandomColorAsRightAnswer = getRandomColorFunc()
        view.backgroundColor = hexStringToUIColor(getRandomColorAsRightAnswer[0])
        
        let nameOfCorrectLabel = getRandomColorAsRightAnswer[1]
        print("\n>>>>>>pressed: name \( nameOfCorrectLabel )")
    
        // 2. making sure the label corresponds to the right color
        if buttonControllers[0] {
            firstButton.setTitle(nameOfCorrectLabel, for: .normal)
        } else if buttonControllers[1] {
            secondButton.setTitle(nameOfCorrectLabel, for: .normal)
        } else if buttonControllers[2] {
            thirdButton.setTitle(nameOfCorrectLabel, for: .normal)
        } else if buttonControllers[3] {
            fourthButton.setTitle(nameOfCorrectLabel, for: .normal)
        }
        
        buttonControllers = [false, false, false, false]
        // at a random index set boolean to true > will be the right answer at next scene
        // "4" represents the number of buttons
        buttonControllers[ Int(arc4random_uniform( UInt32(4))) ] = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstButton.layer.cornerRadius = 8
        secondButton.layer.cornerRadius = 8
        thirdButton.layer.cornerRadius = 8
        fourthButton.layer.cornerRadius = 8
    }
    
    private func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.characters.count) != 6 {
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
