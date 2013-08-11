class PackageCell < UICollectionViewCell
  
  def display_string=(string)
    @display_label.text = string unless @display_label.text == string      
  end
  
  def initWithFrame(frame)
    super.tap do
      @display_label = UILabel.alloc.initWithFrame(self.contentView.bounds).tap do |label|
         label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
         label.backgroundColor = UIColor.whiteColor
         label.textColor = UIColor.blackColor
         label.textAlignment = NSTextAlignmentCenter
         self.contentView.addSubview(label)
       end
     end
  end
end