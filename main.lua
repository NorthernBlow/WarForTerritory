function love.load()
  love.window.setTitle("War For Territory")
  pz3m = love.graphics.newImage("/pz3m.png")
  x, y = 100, 100
  speed = 100
  speed2 = 10
  right = false
end

function love.draw()
  
love.graphics.clear(0, 20, 130)  
if right then
  love.graphics.draw( pz3m, x, y, math.pi / 2) 
  else
  love.graphics.draw(pz3m, x, y, 0)
  end
end


function love.update(dt)
  x = x + speed * dt
  y = y + speed2 * dt
  right = love.mouse.isDown(2)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
end