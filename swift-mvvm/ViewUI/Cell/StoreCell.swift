//
//  StoreCell.swift
//  swift-mvvm
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit

class StoreCell:BaseTableViewCell {
    
    lazy var contentsViewWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var thumbnailWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 224, g: 224, b: 224, alpha: 1)
        return view
    }()
    
    lazy var contentsWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var bottomLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()

    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "testImg")
        return image
    }()
    
    lazy var openFlagGL:UILabel = {
        let label = UILabel()
        label.text = "정보 없음"
        label.colorSetting(r: 187, g: 107, b: 217, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var storeNameGL:UILabel = {
        let label = UILabel()
        label.text = "올리앤올리앤올리앤올리앤올리앤올리앤올리앤올리앤"
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        return label
    }()
    
    lazy var storeCategoryGL:UILabel = {
        let label = UILabel()
        label.text = "족발 전문점"
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    
    lazy var ratingWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ratingGL: UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★  4.2"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var reviewMoreWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var reviewMoreGL: UILabel = {
        let label = UILabel()
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.text = "14개의 리뷰 모아보기 >"
        return label
    }()
    
    lazy var bookmarkImageWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var bookmarkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bookmark_off")
        return image
    }()
    
    
    lazy var borderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
    
        addContentView()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addContentView() {
        contentView.addSubview(contentsViewWrap)
        contentsViewWrap.addSubview(thumbnailWrap)
        contentsViewWrap.addSubview(contentsWrap)
        contentsWrap.addSubview(openFlagGL)
        contentsWrap.addSubview(storeNameGL)
        contentsWrap.addSubview(storeCategoryGL)
        contentsWrap.addSubview(ratingWrap)
        ratingWrap.addSubview(ratingGL)
        contentsWrap.addSubview(reviewMoreWrap)
        reviewMoreWrap.addSubview(reviewMoreGL)
        contentsViewWrap.addSubview(bookmarkImageWrap)
        bookmarkImageWrap.addSubview(bookmarkImage)
        thumbnailWrap.addSubview(thumbnailImage)
        contentView.addSubview(bottomLine)
    }
    
    private func autoLayout() {
        
        contentsViewWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 204)

            make.top.bottom.leading.trailing.equalTo(contentView)
            make.height.equalTo(Int(height))
        }
        thumbnailWrap.snp.makeConstraints{ make in
            make.leading.equalTo(22)
            make.top.equalTo(22)
            make.width.equalTo((currentViewSize.width/2) - 22)
            make.bottom.equalTo(-22)
        }
        contentsWrap.snp.makeConstraints{ make in
            make.leading.equalTo(thumbnailWrap.snp.trailing).offset(14)
            make.top.equalTo(22)
            make.trailing.equalTo(-22)
            make.bottom.equalTo(-22)
        }
        bottomLine.snp.makeConstraints{ make in
            make.bottom.equalTo(0)
            make.width.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        openFlagGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(3)
            make.leading.equalTo(0)
            openFlagGL.font = openFlagGL.font.withSize(fontSize)
        }
        storeNameGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 18)
            let constraint = constraintRatio(direction: .top, standardSize: 13)
            make.top.equalTo(openFlagGL.snp.bottom).offset(constraint)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            storeNameGL.font = storeNameGL.font.withSize(fontSize)
        }
        storeCategoryGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.top.equalTo(storeNameGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            storeCategoryGL.font = storeCategoryGL.font.withSize(fontSize)
        }
        ratingWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 17)
            let height = aspectRatio(standardSize: 22)
            make.top.equalTo(storeCategoryGL.snp.bottom).offset(topRatio)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(0)
        }
        ratingGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            ratingGL.font = ratingGL.font.withSize(fontSize)
            make.top.bottom.leading.bottom.equalTo(0)
        }
        
        /* 리뷰 모아보기 버튼 부분 */
        reviewMoreWrap.snp.makeConstraints{ make in
            make.top.equalTo(ratingWrap.snp.bottom).offset(1)
            make.bottom.equalTo(contentView)
            make.trailing.equalTo(0)
            make.leading.trailing.equalTo(0)
        }
        
        reviewMoreGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 14)
            reviewMoreGL.font = reviewMoreGL.font.withSize(fontSize)
            make.bottom.equalTo(contentsWrap)
            make.leading.trailing.equalTo(0)
        }
        /* */
        
        /* 찜하기 아이콘 부분 */
        bookmarkImageWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 50)
            make.top.equalTo(10)
            make.trailing.equalTo(-13)
            make.width.height.equalTo(height)
        }
        
        bookmarkImage.snp.makeConstraints{ make in
            make.top.equalTo(12)
            make.leading.equalTo(9)
            make.trailing.equalTo(-9)
            make.bottom.equalTo(-11)
        }
        thumbnailImage.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
    }
}
