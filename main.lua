function love.load()
  --таблица 
  pz3mtank = {
    love.graphics.newImage("/pz3m.png"),
    love.graphics.newImage("/pz3mEXHAUST.png")
  }
  
  font = love.graphics.newFont(32)
  unitName = love.graphics.newText(font, "Panzer III")
  --gameoverText = love.graphics.NewText(font, "")
  
  love.window.setTitle("War For Territory")
  
  rotate = {
    0,
    math.pi / 2,
    math.pi,
    -math.pi / 2
  }  
  
  -- масштабирование мб пригодится
  scale_x, scale_y = 1, 1
  origin_x, origin_y = 66, 66
  --координаты
  x, y = 100, 100
  
  --скорость
  speed = 40
  speed2 = 10
  right = false
  frame = #pz3mtank
  slow = 0
  exhaust = 0.2
  rot = 1
  slowRot = 0
  maxBlink = 1
end




function love.draw()
--производится очистка, весь экран заполняется этим цветом.
love.graphics.clear(50, 50, 50)

--задел для зимних карт: можно создавать альфа канал для спрайта ._.
love.graphics.setColor(0, 255, 255)

--прописываем угол поворта
if right then
  love.graphics.draw(pz3mtank[frame], x, y, rotate[rot] + math.pi / 2, scale_x, scale_y, origin_x, origin_y) -- 66 х 66 пиксели, откуда произведется поворот(origin_x, origin_y)
  else
  love.graphics.draw(pz3mtank[frame], x, y, 0, scale_x, scale_y, origin_x, origin_y )
  end
end



function love.update(dt) -- dt(Delta time) зависит от колличества FPS
  x = x + speed * dt
  y = y + speed2 * dt
  right = love.mouse.isDown(2)
  slow = slow + dt
  
  slowRot = slowRot + dt
  if slowRot > maxBlink then
    slowRot = 0
  end
  if slow > exhaust then
    slow = 0
    frame = frame + 1
    if frame > #pz3mtank then
       frame = 1
    end
    rot = rot + 1
    if rot > #rotate then
      rot = 1
      end
  end
  end

function love.keypressed(key, scancode, isrepeat)
  if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
end