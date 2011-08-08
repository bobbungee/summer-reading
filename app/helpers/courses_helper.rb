module CoursesHelper
  def novel_info(name)
    return {:read => false, :page => ''} if cookies[:novels].blank?
    novels = JSON.parse(cookies[:novels])
    
    if novels[name].blank?
      {:read => false, :page => ''}
    else
      {:read => novels[name]['read'], :page => novels[name]['page']}
    end
  end
end
