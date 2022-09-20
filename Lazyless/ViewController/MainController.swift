//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit
import Lottie

class MainController: UIViewController {
    private var tableView: CustomTableViewController = CustomTableViewController()
    private let backgroundView: MainBackgroundView = MainBackgroundView()
    private var personaImage: UIImageView = UIImageView(image: UIImage(named: preguicaModel.personaImageName))
    private var imageHeart: HeartView = HeartView()
    //    private var circularProgressBar: CircularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 250, height: 250), lineWidth: 5, rounded: true)
    private let speakView: SpeakView = SpeakView()
  
    override func loadView() {
        super.loadView()
        //        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGR = UITapGestureRecognizer(
            target: self,
            action: #selector(imageTapped)
        )
        personaImage.addGestureRecognizer(tapGR)
        personaImage.isUserInteractionEnabled = true
        // MARK: -Barra de progresso circular config
        //        circularProgressBar.progressColor = .blue
        //        circularProgressBar.trackColor = .lightGray
        //        circularProgressBar.progress = 0.98
        // MARK: -----------------------------------------------
        
        buildLayout()
    }
}

extension MainController: ViewCoding {


    func setupHierarchy() {
        print(#function)
        self.addChild(tableView)
        self.view.addSubview(tableView.view!)
        self.view.addSubview(speakView)
        self.view.addSubview(personaImage)
        self.view.addSubview(imageHeart)


    }

    func setupContrainsts() {
        print(#function)
        personaImage.translatesAutoresizingMaskIntoConstraints = false
        imageHeart.translatesAutoresizingMaskIntoConstraints = false
        speakView.translatesAutoresizingMaskIntoConstraints = false
        tableView.view.translatesAutoresizingMaskIntoConstraints = false

        imageHeart.contentMode = .scaleAspectFit
        personaImage.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            personaImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            personaImage.centerYAnchor.constraint(equalTo: self.backgroundView.rectBar.bottomAnchor, constant: -25),
            personaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.60),
            personaImage.heightAnchor.constraint(equalTo: self.personaImage.widthAnchor),

            imageHeart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageHeart.centerYAnchor.constraint(equalTo: self.personaImage.bottomAnchor),
            imageHeart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            imageHeart.heightAnchor.constraint(equalTo: self.imageHeart.widthAnchor),

            speakView.topAnchor.constraint(equalTo: imageHeart.bottomAnchor),
            speakView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            speakView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.view.topAnchor.constraint(equalTo: speakView.bottomAnchor),
            tableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    func setupView() {
        print(#function)
        self.view = backgroundView
    }
    //  MARK: -objc funcs
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }

}
