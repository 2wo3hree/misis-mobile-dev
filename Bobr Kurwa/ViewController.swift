//
//  ViewController.swift
//  Bobr Kurwa
//
//  Created by Константин Гончаров on 20.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var curTemp: UILabel!
    @IBOutlet var curSpeed: UILabel!
    @IBOutlet var curTime: UILabel!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
//        getData()
//        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
//    @objc func tapButton() {
//        getData()
////        print("jj")
//    }
    
    func getData() {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=55.7522&longitude=37.6156&current=temperature_2m,apparent_temperature,wind_speed_10m&wind_speed_unit=ms&timezone=Europe%2FMoscow"
        guard let url = URL(string: urlString) else {
                    print("Invalid URL")
                    return
                }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          
            if let data, let wether = try? JSONDecoder().decode(Parser.self, from: data) {
                DispatchQueue.main.async {
                    self.curTemp.text = "Температура \(wether.current.temperature2M) °"
                    self.curTime.text = "\(wether.current.time)"
                    self.curSpeed.text = "Скорость ветра \(wether.current.windSpeed10M) м/с"
                }
            }
            
        }
        task.resume()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        getData()
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                    self.getData()
                }
//        view.backgroundColor = .systemBlue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    
    
    
    
}

