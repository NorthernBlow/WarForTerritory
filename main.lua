function love.draw()
-- Все функции взаимодействия с модулями фреймворка - 
-- прячутся внутри таблицы love.
  love.graphics.print("Main Menu", 19, 19)
  love.window.setTitle("War For Territory")
  love.graphics.draw(image, 0, 0)
end
  
function love.load()
-- Код в функции love.load будет вызван один раз, 
-- как только проект будет запущен.
image = love.graphics.newImage('image.png')
end

function love.update(dt)
-- Код функций update и draw будут запускаться каждый кадр, 
-- чередуясь, в бесконечном цикле:
-- "посчитали->нарисовали->посчитали->нарисовали->"
-- пока не будет вызван выход из приложения.
end

function love.keypressed(key, scancode, isrepeat)
	if key == "f11" then
		fullscreen = not fullscreen
		love.window.setFullscreen(fullscreen, "desktop")
	end
end

function test(var)
  var = 2
  if var > 0 then
    print(var)
    end

end


local Tank, Shell, Bullet, UkranianSoldier, Field

Tank = {}
-- У всех таблиц, метатаблицей которых является Tank,
-- дополнительные методы будут искаться в таблице Tank.
Tank.__index = Tank

-- Задаём общее поле для всех членов класса, для взаимодействия разных объектов
Tank.type = 'T-80BVM'


function Tank:new(field, x, y)
  
-- переопределил self на новый объект, self более нам не товарищ.
-- новый объект у нас теперь метатаблица. теперь к нему применяются метаметоды
  self = setmetatable({}, self)
  
  
-- ссылка на игровой менеджер, чтобы командовать им  
  self.field = field
  
-- координаты спавна  
  self.x = x or 100
  self.y = y or 100
  
-- текущий угол поворота:  
  self.angle = 0
  
-- вектор движения  
  self.vx = 0
  self.vy = 0
  
  
-- ускорение газотурбинного  ГТД-1000Т пикселей в секунду:
  self.acceleration = 200
  
-- поворот   
  self.rotation = math.pi
  
-- перезарядка автомата заряжания  
  self.shoot_timer = 0
  self.shoot_delay = 0.3
  
--  радиус для коллизии
  self.radius = 30
  
-- список вершин полигона, для отрисовки Т-80БВМ  
  self.vertexes = {0, -30, 30, 30, 0, 20, -30, 30}
  
  return self
  
end  


--тестирование:

print('Tank.key', Tank.key)


function Tank:update(dt)
	-- Декрементов нема, и инкрементов тоже, но это не очень страшно.
	-- dt - дельта времени, промежуток между предыдущим и текущим кадром.
	self.shoot_timer = self.shoot_timer - dt
	
	
	-- Управление:
	
	-- "Если зажата кнопка и таймер истёк" - спавнит новую пулю.
	if love.keyboard.isDown('x') and self.shoot_timer < 0 then
		self.field:spawn(Bullet:new(self.field, self.x, self.y, self.angle))

		-- сбрасывает таймер, чтобы танк не стрелял непрерывно 
		-- хоть это и забавно.
		self.shoot_timer = self.shoot_delay
	end
