function love.draw()
  love.graphics.print("Hello World!", 19, 19)
  love.window.setTitle("SUPER GAME")
end
  
function love.load()

end

function love.update(dt)

end

function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
end

function train(num)
  num = 2
  if num > 0 then
    print(num)
    end

end


a1 = train()
print(a1)