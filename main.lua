function love.load()
  
  --таблица 
  pz3mtank = {
    love.graphics.newImage("/pz3m.png"),
    love.graphics.newImage("/pz3mEXHAUST.png")
    }
  love.window.setTitle("War For Territory")
  
  rotate = {
    0,
    math.pi / 2,
    math.pi,
    -math.pi / 2
    }  
  --координаты
  x, y = 100, 100
  
  --скорость
  speed = 100
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
  
love.graphics.clear(0, 20, 130)

--прописываем угол поворта
if right then
  love.graphics.draw(pz3mtank[frame], x, y, rotate[rot] + math.pi / 2, nil, nil, 66, 66) -- 66 х 66 пиксели, откуда произведется поворот
  else
  love.graphics.draw(pz3mtank[frame], x, y, 0, nil, nil, 66, 66 )
  end
end


function love.update(dt)
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