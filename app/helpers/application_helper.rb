module ApplicationHelper

  def default_meta_tags
    {
        title: "スマホ自動コールシステムSMART CTI",
    	site: "SMART CTI",
    	description: "スマホで自動コールシステムならSMART CTI。通話料が定額のため、今までより大きくコストカットが出来ます。",
    	keywords: "スマホ CTI",
        noindex: ! Rails.env.production?, # production環境以外はnoindex  
        charset: "UFT-8",
    }
    end

end
