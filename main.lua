function love.load()
  
  --таблцица 
  pz3mtank = {}
  pz3mtank[1] = love.graphics.newImage("/pz3m.png")
  pz3mtank[2] = love.graphics.newImage("/pz3mEXGHAUST.png")
  love.window.setTitle("War For Territory")
  
  --координаты
  x, y = 100, 100
  
  --скорость
  speed = 100
  speed2 = 10
  right = false
  frame = 1
  slow = 0
  isDamaged = 0.1
end

function love.draw()
  
love.graphics.clear(0, 20, 130)

--прописываем угол поворта
if right then
  love.graphics.draw(pz3mtank[frame], x, y, math.pi / 2, nil, nil, 30, 36) 
  else
  love.graphics.draw(pz3mtank[frame], x, y, 0, nil, nil, 30, 36 )
  end
end


function love.update(dt)
  x = x + speed * dt
  y = y + speed2 * dt
  right = love.mouse.isDown(2)
  frame = frame + 1
  if slow > isDamaged then
    slow = 0
    if frame > 2 then
    frame = 1
  end
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
end