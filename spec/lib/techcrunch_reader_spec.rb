require "spec_helper"

describe Reader do
  describe 'Techcrunch' do
    let(:techcrunch) do
      Reader::Techcrunch 'http://techcrunch.com/2012/12/23/internet-silence-speaks-louder-than-words/'
    end

    it 'has the right class name' do
      techcrunch.class.should eql Reader::Techcrunch
    end

    it 'has a title' do
      techcrunch.title.should eql "Internet Silence Speaks Louder Than\u00A0Words"
    end

    it 'has a text body' do
      techcrunch.body.should include "Major websites around the web blacked out"
      techcrunch.body.should include "a holiday break and subsequent chaos of a new Congress."
    end

    it 'has them all as JSON' do
      techcrunch.as_json.should eql "{\"title\":\"Internet Silence Speaks Louder Than\u00A0Words\",\"body\":\"Major websites around the web blacked out their homepages Friday at 9:30 a.m. in memoriam for the Sandy Hook massacre last week. In the cacophonous free-speech circus that is the Internet, where the knee-jerk reaction to all issues is to generate more words, the practice of forced silence sends a distinct signal of seriousness: sacrifice. In a blackout, we cannot advertise. We cannot promote our coveted views. We can only sit in deafening silence as our traffic flatlines. In exchange, we hope that readers will give a rare moment of undivided reflection.\\nAs a society, we\u2019ve learned to work through tragic news, to nonchalantly breeze over civil wars and financial recession while standing in line for a $5 cup of coffee. Blackouts, then, have become a tool of last resort to warn users about an issue that threatens the very foundation of the free flow of information. First popularized by a massive online protest against a widely criticized law, The Stop Online Piracy Act, web titans banded together to stop a bill that they believe gave the government the power of censorship.\\n\u201CRight now, the U.S. Congress is considering legislation that could fatally damage the free and open Internet,\u201D read Wikipedia, which blacked out its entire site for 24 hours. The message was clear: there is no piece of information more vital right now than the knowledge of a bill that could prevent Wikipedia from fulfilling its mission indefinitely. Shortly thereafter, SOPA was stopped cold in Congress.\\nThe school shooting in Newtown last week uniquely scarred the nation. Press releases halted, nonessential news slowed to a crawl, and even my TechCrunch colleagues had a hard time talking about anything but guns and violence.\\nWhile there will be an important debate about why this particular tragedy was more impactful than so many other atrocities, it demonstrably was. An online gun control petition for the White House became the most popular in the site\u2019s history, amassing the otherwise difficult threshold of 25,000 signatures in mere hours. Google, too, made a unique gesture, placing a small but salient vigil candle under its search bar (Friday, a green ribbon stands in the same place).\\nOn a normal day, most users can casually avoid knowledge of the world\u2019s ills or problems beyond themselves. It is the luxury of living in a relatively peaceful nation. On Friday, this was not the case, as a number of high-profile websites, including some of those owned by TechCrunch\u2019s parent company, Aol, blacked out their pages in a moment of digital silence.\\nThe blackout ran with a corresponding Causes.com petition of nearly 200,000 signatures, including tech titans, Sean Parker (Facebook\u2019s first president), Jack Dorsey (Twitter co-founder) and Marc Benioff (Salesforce founder), as well as celebrities Britney Spears, Ryan Seacrest, and Arnold Schwarzenegger.\\nLike the SOPA protest\u2019s successful blackout, silence is bolstered by an onslaught of op-eds, petitions, and endless news coverage. The blackout itself gives a political movement distinctiveness, an added badge that is more memorable. The most serious threat to some meaningful gun or mental health reform is complacency. Congress is out for recess until the newly elected members take their place in January. Additionally, the active members over the break are inundated\u00A0with a looming budget crises. An entire month in regular congressional business could prove catastrophic to any normal political movement.\\nNetizens may not remember any particular op-ed, but they will remember a blackout.\u00A0Congress already has a dismally low rating; ignoring the most desperate of calls for reform would be politically hazardous. Perhaps it is only the echoing of deafening silence that can keep\u00A0political pressure up through the mental abyss of a holiday break and subsequent chaos of a new Congress.\"}"
    end
  end
end