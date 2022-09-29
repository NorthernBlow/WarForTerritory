  -- ДЛЯ ТЕСТА ФРЕЙМРЕЙТА -- 
  
  local var = 10  -- сюда подставить то, что буду тестировать
  local rate = 60 
  
  if love.keyboard.isDown("down") then   -- уменьшение значения
      var = var - (dt * rate)
   end
   if love.keyboard.isDown("up") then   -- увеличение значения
     var = var + (dt * rate)
   end
end

