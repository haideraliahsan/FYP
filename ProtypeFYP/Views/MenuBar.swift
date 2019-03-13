import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var homeController: HomeController?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
        cv.backgroundColor = UIColor.darkGray
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    let cellId = "cellId"
    var selectedIndexPath: IndexPath?
    let imageNames = ["home", "checked","bird","profile"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        addConstrintWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrintWithFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
      
        selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: [])
        collectionView.cellForItem(at: (selectedIndexPath)!)?.isSelected = true
       
        backgroundColor = UIColor.darkGray
        setupHorizontalBar()
   }
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    func setupHorizontalBar () {
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.imageView.tintColor = UIColor.black
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: [])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class MenuCell: BaseCell{
    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "profile")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.black
       return iv
    }()
    override var isHighlighted: Bool{
        didSet{
           imageView.tintColor = isHighlighted ? UIColor.white : UIColor.black
        }
    }
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.black
        }
    }
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addConstrintWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstrintWithFormat(format: "V:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

