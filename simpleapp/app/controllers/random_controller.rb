class RandomController < ApplicationController
  def random

  end
  def randomresult
    arr = ['시원하게 남극 추천~~','놀러간다고????? 정신 좀 차리자...','월드컵 보러 ㄱㄱ','멀캠에 같혀서 놀러 못 가죠^^']
    arr_img = {
        "시원하게 남극 추천~~"=>"ng.jpg",
        "놀러간다고????? 정신 좀 차리자..."=>"hbd.jpg",
        "월드컵 보러 ㄱㄱ"=>"wdc.jpg",
        "멀캠에 같혀서 놀러 못 가죠^^"=>"multi.jpg"
    }
    @location = arr.sample
    @img = arr_img[@location]
    end
end
