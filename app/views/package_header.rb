class PackageHeader < UICollectionReusableView

  def initWithFrame(frame)
    super.tap do |header|
      header.backgroundColor = UIColor.greenColor
    end
  end
    
end