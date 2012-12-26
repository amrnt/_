require "spec_helper"

describe Reader do
  describe 'Mashable' do

    describe 'Good link' do
      let(:link) do
        Reader::Mashable 'http://mashable.com/2012/10/11/gangnam-style-youtube-top-10/'
      end

      it 'has the right class name' do
        link.class.should eql Reader::Mashable
      end

      it 'responds to title' do
        link.respond_to?(:title).should eql true
      end

      it 'responds to body' do
        link.respond_to?(:body).should eql true
      end

      it 'responds to as_hash' do
        link.respond_to?(:as_hash).should eql true
      end

      it 'responds to as_json' do
        link.respond_to?(:as_json).should eql true
      end

      it 'has the right title' do
        link.title.should eql "'Gangnam Style' Cracks YouTube's All-Time Top 10"
      end

      it 'has the right body' do
        link.body.should eql "With 432 million views since its July 15 release, \"Gangnam Style\" has catapulted well into YouTube's list of 30 most-viewed videos. Psy's Korean electronica dance hit cracked the top 10 this week at number nine. \nThe clip previously broke the Guinness World Record for most YouTube \"Likes.\"\nA month ago, when talent manager Scooter Braun had signed Psy to the same record label as fellow viral sensation Carly Rae Jepsen, \"Gangnam Style\" had been watched 105 million times.\nThe 327 million additional views since the beginning of September have spawned partially because of parodies and Psy's TV appearances on Saturday Night Live, Today, Ellen and the MTV Video Music Awards. \n\nSEE ALSO: Prison Inmates Perform 'Gangnam Style' in Pouring Rain\n\"Gangnam Style\" also is the third most-discussed video and eighth most-favorited video ever on YouTube. \nHere are the videos keeping \"Gangnam Style\" from becoming the most-viewed YouTube clip ever: \n8. Michel Tel\u00F3's \"Ai Se Eu Te Pego\" with 443 million views\n7. \"Charlie Bit My Finger -- Again!\" with 487 million views\n6. LMFAO's \"Party Rock Anthem\" featuring Lauren Bennett and GoonRock with 489 million views\n5. Lady Gaga's \"Bad Romance\" with 490 million views\n4. Shakira's \"Waka Waka\" with 495 million views\n3. Eminem's \"Love The Way You Lie\" featuring Rihanna with 503 million views\n2. Jennifer Lopez's \"On The Floor\" featuring Pitbull with 606 million views\n1. Justin Bieber's \"Baby\" featuring Ludacris with 787 million views\nBONUS: 'Today' Show Goes Gangnam Style\nGangnam Style on The Today Show\n\n\n1.\n\n\n\n\n\n2. \n\n\n\n\n\n3.\n\n\n\n\n\n4.\n\n\n\n\n\n5.\n\n\n\n\n\n6.\n\n\n\n\n\n7.\n\n\n\n\n\n8.\n\n\n\n\n\n9.\n\n\n\n\n\n10.\n\n\n\n\n\n11.\n\n\n\n\n\n12.\n\n\n\n\n\n13.\n\n\n\n\n\n14.\n\n\n\nPhotos by Mashable's Stephanie Haberman"
      end

      it 'has them all as a hash' do
        hash = {:title => "'Gangnam Style' Cracks YouTube's All-Time Top 10", :body => "With 432 million views since its July 15 release, \"Gangnam Style\" has catapulted well into YouTube's list of 30 most-viewed videos. Psy's Korean electronica dance hit cracked the top 10 this week at number nine. \nThe clip previously broke the Guinness World Record for most YouTube \"Likes.\"\nA month ago, when talent manager Scooter Braun had signed Psy to the same record label as fellow viral sensation Carly Rae Jepsen, \"Gangnam Style\" had been watched 105 million times.\nThe 327 million additional views since the beginning of September have spawned partially because of parodies and Psy's TV appearances on Saturday Night Live, Today, Ellen and the MTV Video Music Awards. \n\nSEE ALSO: Prison Inmates Perform 'Gangnam Style' in Pouring Rain\n\"Gangnam Style\" also is the third most-discussed video and eighth most-favorited video ever on YouTube. \nHere are the videos keeping \"Gangnam Style\" from becoming the most-viewed YouTube clip ever: \n8. Michel Tel\u00F3's \"Ai Se Eu Te Pego\" with 443 million views\n7. \"Charlie Bit My Finger -- Again!\" with 487 million views\n6. LMFAO's \"Party Rock Anthem\" featuring Lauren Bennett and GoonRock with 489 million views\n5. Lady Gaga's \"Bad Romance\" with 490 million views\n4. Shakira's \"Waka Waka\" with 495 million views\n3. Eminem's \"Love The Way You Lie\" featuring Rihanna with 503 million views\n2. Jennifer Lopez's \"On The Floor\" featuring Pitbull with 606 million views\n1. Justin Bieber's \"Baby\" featuring Ludacris with 787 million views\nBONUS: 'Today' Show Goes Gangnam Style\nGangnam Style on The Today Show\n\n\n1.\n\n\n\n\n\n2. \n\n\n\n\n\n3.\n\n\n\n\n\n4.\n\n\n\n\n\n5.\n\n\n\n\n\n6.\n\n\n\n\n\n7.\n\n\n\n\n\n8.\n\n\n\n\n\n9.\n\n\n\n\n\n10.\n\n\n\n\n\n11.\n\n\n\n\n\n12.\n\n\n\n\n\n13.\n\n\n\n\n\n14.\n\n\n\nPhotos by Mashable's Stephanie Haberman"}
        link.as_hash.should eql hash
      end
    end

    describe 'Bad link' do
      let(:link) do
        Reader::Mashable 'http://mashable.com/2012/10/11/gangnam-style-you-tube-top-10/'
      end

      it 'raises an error if link is invalid' do
        expect { link }.to raise_error(StandardError, 'Error while fetching the link. Status: not 200')
      end
    end

    describe 'Not related link' do
      let(:link) do
        Reader::Mashable 'http://techcrunch.com/2012/12/23/internet-silence-speaks-louder-than-words/'
      end

      it 'raises an error if processed by not related class' do
        expect { link }.to raise_error(StandardError, 'Couldn\'t fetch your link through this class!')
      end
    end

  end
end