//
//  PostListTableViewCell+UI.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit

//포스트 리스트 전용 Cell
class PostListTableViewCell: BaseTableViewCell {

    /* 실질적으로 이벤트 처리에 직접적으로 사용할 View 요소만 변수 세팅 */
    
    var titleGL: UILabel!
    var contentGL: UILabel!
    
    /* */
    
    //데이터 바인딩
    func dataBind(_ data: PostRPModel) {
        titleGL.text = data.title
        contentGL.text = data.body
    }
}
