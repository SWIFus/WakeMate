//
//  HomeViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/13.
//  Soojeong's VC
//

import UIKit

class HomeViewController: UIViewController {
    
// MARK: - Property
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunny")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Seoul, Korea \nLittle Cloudy, 25"
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        return label
    }()
    
    let moonImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "moon")
        return imageView
    }()
    
    let dayLabel : UILabel = {
        let label = UILabel()
        let formatter = DateFormatter()
        let date = Date()
        
        formatter.locale = Locale(identifier: "default")
        formatter.dateFormat = "yyyy.MM.dd EEE" // 요일이 뜨게 됨
        
        label.font =  UIFont.boldSystemFont(ofSize:30)
        
        label.numberOfLines=2
        label.textAlignment = .center
        label.text = formatter.string(from: date) // test를 위해서 출력할 라벨
        label.textColor = .white
        return label
    }()
    
    let clockLabel : UILabel = {
        let label = UILabel()
        let formatter = DateFormatter()
        let date = Date()
        formatter.dateFormat = "a HH:mm" // 오전 오후 뜨게 됨
        formatter.locale = Locale(identifier: "default")
        // 시간을 text에 나오게해야함
        label.font =  UIFont.boldSystemFont(ofSize:32)
        label.textAlignment = .center
        label.text = formatter.string(from: date) // test를 위해서 출력할 라벨
        label.textColor = .white
     //   label.font = UIFont(name: "AlfaSlabOne-Regular", size: 30)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let tapBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.darkGray, for: .normal)
        btn.setTitle("TAP TO WAKE UP", for: .normal)
        
        return btn
    }()
    

    
    
    var timer: Timer?
    
    
    
    //code auto layout swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAutoLayout()
        view.backgroundColor = .black // 배경색

        // AutoResize 기능을 끄는 코드
        // view가 AutoResize 될 때는 AutoLayout의 제약 조건을 추가로 설정해줄수 없기 때문에
        //코드로 제약 조건을 설정하고 반영하기 위해서 해당 코드가 반드시 필요함
  
        // addSubview 전에 코드를 작성해버리면 illgal이라고 오류가 뜸
        // constraints 적용하기
        
        
        // 중앙정렬
        // centerXAnchor의 값은 해당 뷰의 수평 중심이 어디있는지 나타내는 값
        // constraint는 NSLayoutConstraint 객체를 반환
        // 해당 객체가 active 상태가 되어야 제약 조건이 반영되어 isActive = true가 들어가야한다.
        
        
        // timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(formTimeAll), userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func formTimeAll() {
        formDayLabel()
        formClockLabel()
    }
    
    func formDayLabel() {
        let formatter = DateFormatter()
        let date = Date()
        formatter.locale = Locale(identifier: "default")
        formatter.dateFormat = "yyyy.MM.dd EEE" // 요일이 뜨게 됨
        dayLabel.text = formatter.string(from: date) // test를 위해서 출력할 라벨
    }
    
    func formClockLabel() {
        let formatter = DateFormatter()
        let date = Date()
        formatter.dateFormat = "a HH:mm" // 오전 오후 뜨게 됨
        formatter.locale = Locale(identifier: "default")
        // 시간을 text에 나오게해야함
        clockLabel.text = formatter.string(from: date) // test를 위해서 출력할 라벨
    }
    
    func setAutoLayout() {
        view.addSubview(iconImage)
        view.addSubview(weatherLabel)
        view.addSubview(moonImage)
        view.addSubview(dayLabel)
        view.addSubview(clockLabel)
        view.addSubview(tapBtn)
        
        iconImageAutoLayout()
        weatherLabelAutoLayout()
        moonImageAutoLayout()
        dayLabelAutoLayout()
        clockLabelAutoLayout()
        tapBtnAutoLayout()
    }


}




// MARK: -extension
extension HomeViewController {
    

    func iconImageAutoLayout() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func weatherLabelAutoLayout(){
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 8.0).isActive = true
        weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func moonImageAutoLayout(){
        moonImage.translatesAutoresizingMaskIntoConstraints = false
        moonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        moonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func dayLabelAutoLayout(){
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        

    }
    
    func clockLabelAutoLayout(){
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor).isActive = true
        clockLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor).isActive = true
        clockLabel.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor).isActive = true

    }
    
    func tapBtnAutoLayout(){
        tapBtn.translatesAutoresizingMaskIntoConstraints = false
        tapBtn.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 110).isActive = true
        tapBtn.leadingAnchor.constraint(equalTo: clockLabel.leadingAnchor).isActive = true
        tapBtn.trailingAnchor.constraint(equalTo: clockLabel.trailingAnchor).isActive = true
        tapBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true

    }
}
