//
//  CardGameMainVC.swift
//  CardWorkout_Programmatic_UI
//
//  Created by param  on 2023-05-18.
//

import UIKit

class CardGameMainVC: UIViewController {
    
    var cardImageView: UIImageView!
    
    // I have used different declaration just for experimentation purpose
    var stopBtn: CGMButton?
    var resetBtn: CGMButton = CGMButton()
    var rulesBtn: CGMButton!
    
    var timer: Timer!
    var cardsImageNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // populating image name array
        cardsImageNames = CardsDeckUtility.getCardsNameList()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
        
        startTimer()
        
        rulesBtn.addTarget(self, action: #selector(showRulesView), for: UIControl.Event.touchUpInside)
        
        stopBtn?.addTarget(self, action: #selector(stopBtnPressed), for: .touchUpInside)
        
        resetBtn.addTarget(self, action: #selector(resetBtnPressed), for: .touchUpInside)
        
    }
    
    @objc func showRulesView(){
        
        // Change your modal presentation view size this way!
//        let vc = RulesVC()
//        vc.modalPresentationStyle = .fullScreen
        
        // This will only present the empty Rules View - As this represents the view created programatically from the view controller and not the Storyboard that we have used down below
//        present(RulesVC(), animated: true)
        
        // Instantiating the storyboard by using its name
        let storyboard = UIStoryboard(name: "RulesVC_StoryBoard", bundle: nil)
        
        // Instantiating the view controller linked with the story board by using the storyboard ID = "rulesSBID"
        let storyboardRulesVC = storyboard.instantiateViewController(withIdentifier: "rulesSBID")
        
        // Two different methods with the same result - presenting the Rules View Modally
        showDetailViewController(storyboardRulesVC, sender: nil)
        // OR
//        present(storyboardRulesVC, animated: true)
        
    }
    
    @objc func stopBtnPressed(){
        timer.invalidate()
    }
    
    @objc func resetBtnPressed(){
        timer.invalidate()
        startTimer()
    }
    
    
    
    // Timer functionality
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeCardImageView), userInfo: nil, repeats: true)
    }
    
    // function to change the card image view dynamically
    @objc func changeCardImageView(){
        if cardsImageNames.count > 0{
            // Unwrapping the optional safely, for any case where there is no image rendered the function will simply skip that iteration of Timer - calling the function
            guard let image = UIImage(named: "Images/\(cardsImageNames[Int.random(in: 0..<cardsImageNames.count)])")
            else{
                return
            }
            cardImageView.image = image
        }
    }
    
    
    // UI Configuration
    func configureUI()
    {
        setUpCardImageView()
        setUpStopBtn()
        setUpResetBtn()
        setUpRulesBtn()
    }
    
    func setUpCardImageView(){
        guard let image = UIImage(named: "Images/2C") else{
            return
        }
        cardImageView = UIImageView(image: image)
        
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -84),
            cardImageView.heightAnchor.constraint(equalToConstant: 400),
            cardImageView.widthAnchor.constraint(equalToConstant: 280)
        ])
        
        
    }
 
    func setUpStopBtn(){
        stopBtn = CGMButton(color: .systemRed, text: "Stop!", imageSysName: "stop.circle")
        
        // Alternate Method if not using init method to instantiate a custom object
        // Not so convinient as does not create an instance of the custom class "CGMButton" instead returns an instance of "UIButton"
//        stopBtn = CGMButton.createButtonUsingAppleConfigurationAlt(color: .red, text: "Stop!", imageSysName: "stop.circle")
        // This is required statement as this custom property couldn't be applied in the method above
//        stopBtn.translatesAutoresizingMaskIntoConstraints = false
        
        guard let stopBtn = stopBtn else{
            return
        }
        
        view.addSubview(stopBtn)

        NSLayoutConstraint.activate([
            stopBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopBtn.widthAnchor.constraint(equalToConstant: 280),
            stopBtn.heightAnchor.constraint(equalToConstant: 50),
            stopBtn.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 25)
        ])
        
    }
    
    func setUpResetBtn(){
        resetBtn = CGMButton(color: .systemGreen, text: "Reset", imageSysName: "arrow.clockwise")
        
        view.addSubview(resetBtn)

        // Note I used stopBtn! (Implicitly Unwrapped the optional just for example purpose) - Not recommended
        NSLayoutConstraint.activate([
            resetBtn.leadingAnchor.constraint(equalTo: stopBtn!.leadingAnchor),
            resetBtn.widthAnchor.constraint(equalToConstant: 135),
            resetBtn.heightAnchor.constraint(equalToConstant: 50),
            resetBtn.topAnchor.constraint(equalTo: stopBtn!.bottomAnchor, constant: 15)
        ])
        
    }

    // Rules Btn Configuration
    
    func setUpRulesBtn(){
        rulesBtn = CGMButton(color: .systemCyan, text: "Rules", imageSysName: "list.star")
        
        view.addSubview(rulesBtn)

        // Note I used stopBtn! (Implicitly Unwrapped the optional just for example purpose) - Not recommended
        NSLayoutConstraint.activate([
            rulesBtn.trailingAnchor.constraint(equalTo: stopBtn!.trailingAnchor),
            rulesBtn.widthAnchor.constraint(equalToConstant: 135),
            rulesBtn.heightAnchor.constraint(equalToConstant: 50),
            rulesBtn.topAnchor.constraint(equalTo: stopBtn!.bottomAnchor, constant: 15)
        ])
    }
    
    
    
}
