require "doc_tien/version"

module DocTien
  A = {0=> '',1 =>'một', 2=>'hai', 3=>'ba', 4=>'bốn', 5=>'năm', 6=>'sáu', 7=>'bảy', 8=>'tám', 9=>'chín'}
  B = ['mười một', 'mười hai', 'mưòi ba', 'mười bốn', 'mười lăm', 'mười sáu', 'mười bảy',
    'mười tám', 'mười chín' ]
  C = {10=> 'mười', 20 => 'hai mươi',30=>'ba mươi',40=>'bốn mươi',50=>'năm mươi',60=>'sáu mươi',70=>'bảy mươi',
       80=>'tám mươi',90=>'chín mươi'}
  D = ['đồng.','nghìn','triệu','tỉ', "nghìn", 'triệu', 'tỉ' ]
  E = ['trăm']
  SPECIAL = {'trăm một' => 'trăm lẻ một', 'trăm hai' => 'trăm lẻ hai','trăm ba' => 'trăm lẻ ba',
              'trăm bốn' => 'trăm lẻ bốn','trăm năm' => 'trăm lẻ năm','trăm sáu' => 'trăm lẻ sáu',
              'trăm bảy' => 'trăm lẻ bảy','trăm tám' => 'trăm lẻ tám','trăm chín' => 'trăm lẻ chín' }

  SPECIAL_2 = {'hai mươi một' => 'hai mươi mốt', 'ba mươi một' => 'ba mươi mốt',
                'bốn mươi một' => 'bốn mươi mốt','năm mươi một' => 'năm mươi mốt',
                'sáu mươi một' => 'sáu mươi mốt','bảy mươi một' => 'bảy mươi mốt',
                'tám mươi một' => 'tám mươi mốt', 'chín mươi một' => 'chín mươi mốt' }
  SPECIAL_3 = {'mười năm' => 'mười lăm', 'hai năm' => 'hai lăm',
                'ba năm' => 'mười lăm','bốn năm' => 'bốn lăm',
                'năm năm' => 'năm lăm','sáu năm' => 'sáu lăm',
                'bảy năm' => 'bảy lăm', 'tám năm' => 'tám lăm', 'chín năm' => 'chín lăm', 'mươi năm' => 'mươi lăm'  }

  def self.now(s)
    s = s.to_s
     # Split every 3 number to 1 block
    s1 = s.reverse.scan(/.{1,3}/)
    s2 = s1.reverse.map do |d|
      d.reverse
    end
    # How many block
    num_of_blocks = s2.size
    # 5 is Trillion, 4 is Bilion, 3 is Milion, 2: Thousand, 1 Dong
    words_first = s2.map do |e|
      num_of_hundred(e.to_i)
    end
    words_string = num_to_words(words_first, num_of_blocks)
    words_string = replace_with_special_word(words_string)
    return words_string.lstrip.chop.capitalize
  end

  def self.num_to_words(words_first, num_of_blocks)
    s = ""
    for i in 0...num_of_blocks
      s = s + words_first[i] + " "+ D[num_of_blocks-(i+1)]
      s = s +" "
    end
    return s
  end

  def self.num_of_hundred(number)
    s = ""
    num_temp_mod100 = number%100
    if num_temp_mod100==0
      unless A[number/100]==''
        s = s+ A[number/100] + " "+ E.first
      end
      return s
    else
      #So hang tram
      tram = number/100
      if tram>0
        s =  s+ A[tram] +" "+ E.first
      end
      num_temp_mod10 = num_temp_mod100%10
      if (num_temp_mod10==0)
        #so hang chuc
        chuc = num_temp_mod100/10
        s = s+" "+ C[chuc*10]
        return s
      else
        chuc = num_temp_mod100/10
        if chuc>0
          s = s+" "+C[chuc*10]
        end
        donvi = num_temp_mod10
        s = s +" "+ A[donvi]
        if s.split(' ').size==3
          SPECIAL.each do |k, v|
            s.gsub!(k,v)
          end
        end
        return s
      end
    end
  end
  def self.replace_with_special_word(msg)
    input = msg
    SPECIAL_2.each do |k, v|
      input.gsub!(k,v)
    end
    SPECIAL_3.each do |k, v|
      input.gsub!(k,v)
    end
    return input
  end
end
