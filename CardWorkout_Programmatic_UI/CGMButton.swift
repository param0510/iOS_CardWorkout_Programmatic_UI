//
//  CGMButton.swift
//  CardWorkout_Programmatic_UI
//
//  Created by param  on 2023-05-18.
//

import UIKit

class CGMButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Custom init - Just like parameterized constructor in Java
    init(color: UIColor, text: String, imageSysName: String) {
        super.init(frame: .zero)
    
        // Method 1 - Your own custom configuration
//        createButtonCustomMethod(color: color, text: text, imageSysName: imageSysName)
        // Method 2 - Apple Default Button Configuration
        createButtonUsingAppleConfiguration(color: color, text: text, imageSysName: imageSysName)

        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // Method 1: used for custom button creation
    func createButtonCustomMethod(color: UIColor, text: String, imageSysName: String){
        
        // If you need to update the attributes of the buttons without using apple's default scheme
        // You can make your custom button from scratch by updating the properties listed below
        backgroundColor = color
//        // OR
//        self.backgroundColor = color
//
        setTitleColor(UIColor.white, for: UIControl.State.normal)
        setTitle(text, for: .normal)
        setImage(UIImage(systemName: imageSysName), for: .normal)
//        inset

        tintColor = .white

        layer.cornerRadius = 8
    }
    
    
    // Method 2: for creating a button using apple's default formating
    func createButtonUsingAppleConfiguration(color: UIColor, text: String, imageSysName: String){
        configuration = .tinted()
        
        configuration?.cornerStyle = .medium
        configuration?.title = text
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.image = UIImage(systemName: imageSysName)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .trailing

    }
    
    // Alternate method for above task
    // This returns a UIButton instance only - Prefer to use the above method over this one (Not so convinient in terms of custom classes)
    static func createButtonUsingAppleConfigurationAlt(color: UIColor, text: String, imageSysName: String) -> UIButton{
        var tinted = UIButton.Configuration.tinted()
        
        tinted.cornerStyle = .medium
        tinted.title = text
        tinted.baseBackgroundColor = color
        tinted.baseForegroundColor = color
        tinted.image = UIImage(systemName: imageSysName)
        tinted.imagePadding = 5
        tinted.imagePlacement = .trailing
        
        return UIButton(configuration: tinted)

    }
    
    
}
