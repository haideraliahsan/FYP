
import UIKit

class JobCell: BaseCell {
    var job: Job? {
        didSet{
            titleLabel.text = job?.title
            setupThumbnailImage()
            setupProfileImage()
            thumbnailImageView.image = UIImage(named: (job?.thumbNailImageName)!)
            
            if let channelName = job?.channel?.name, let numberOfViews = job?.numberOfViews {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let subTitleText = "\(channelName) - \(numberFormatter.string(from: numberOfViews)!) - 2 years ago"
                subtitleTextView.text = subTitleText
            }
        }
    }
    func setupThumbnailImage(){
        if let thumbnailImageUrl = job?.thumbNailImageName {
            thumbnailImageView.loadImageUsingUrlString(UrlString: thumbnailImageUrl)
        }
    }
    func setupProfileImage(){
        if let profileImage = job?.channel {
            profileImageView.image = #imageLiteral(resourceName: "profileImage")
            
            
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "shutterstock_374227048")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.image = #imageLiteral(resourceName: "profileImage")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coding is the key to the inside"
        return label
    }()
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.lightGray
        //  textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.text = "its been two months and where the ios development taking me well thats dollar bill question"
        return textView
    }()
    override func setupViews (){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(profileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstrintWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstrintWithFormat(format: "H:|-16-[v0(44)]", views: profileImageView)
        addConstrintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileImageView, separatorView)
        
        addConstrintWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
}
