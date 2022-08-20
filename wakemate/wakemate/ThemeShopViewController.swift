//
//  ThemeShopViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/13.
//


import UIKit


//MARK: - 컬렉션 뷰 데이터
struct Data {
    let thema = ["Apple Thema", "Banana Thema", "Midnight Thema", "Night Thema", "default", "default","default","default"]
}

//MARK: - delegate랑 resource
class CustomCollectionView: UICollectionView {
    // none
}

//MARK: - Custom cell 생성
class CollectionViewCell: UICollectionViewCell {
    
    
    var themaImage : UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    override init(frame: CGRect){
        // 어디서 시작할 지 => CGRect
        // origin(CGRect), size(CGSize)
        // .zero => (0,0) 시작한다.
        super.init(frame: .zero)
        setUpCell()
    }
    
    func setUpCell(){
        // cell 배치
        themaImage = UIImageView()
        contentView.addSubview(themaImage)
        themaImage.translatesAutoresizingMaskIntoConstraints = false
        themaImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        themaImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        themaImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        themaImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}


// 초기화를 해주지 않으면 에러가 발생한다.
// 즉 customCollectionView = CustomCollectionView()와 같은
// 형태로 실행하면 에러가 발생한다는 뜻
// Table View와 마찬가지로 delegate 프로토콜을 통해 보여줄 데이터의 수와 셀의 모습을 설정


//MARK: - VC에서 컬렉션뷰 설정
class ThemeShopViewController: UIViewController {
    
    private var customCollectionView: CustomCollectionView!
    private let data = Data()
    
    // 타이틀 라벨
    let shopLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOP"
        //MARK: -font 적용
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = UIColor.init(rgb: 0xFFD80D).withAlphaComponent(1.0)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        titleLabel()
        configureCollectionView()
        registerCollectionView()
        collectionViewDelegate()
    }
    
    
    
    
    func titleLabel(){
        shopLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(shopLabel)
        shopLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        shopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
    }
    
    //MARK: - 컬렉션 뷰 위치 배정
    func configureCollectionView() {
        // 꼭 초기화를 해줘야한다.
        customCollectionView = CustomCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        customCollectionView.backgroundColor = .black
        // collectionView 위치 설정
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(customCollectionView)
        
        
        customCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        customCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        customCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        customCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    
    
    func registerCollectionView() {
        customCollectionView.register(CollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellIdentifier")
    }
    
    
    func collectionViewDelegate() {
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
    }
    
}


//MARK: - 셀 디테일 설정
extension ThemeShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀의 크기를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    // 셀의 칸 개수 결정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data().thema.count
    }
    
    // 셀의 이미지 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //dequeueResuableCell == RecyclerView
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! CollectionViewCell
        // indexPath => cell의 순서
        // indexPath.row => 정확한 순서 숫자
        cell.themaImage.contentMode = .scaleAspectFit
        cell.themaImage.image = UIImage(named: data.thema[indexPath.row])
        
        return cell
    }
    
}


// MARK: - 폰트 색상 RGB로 나타내기
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    // [사용 방법 : UIColor.init(rgb: 0x00ff00).withAlphaComponent(1.0)]
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


