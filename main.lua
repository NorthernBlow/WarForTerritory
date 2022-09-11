function love.draw()
-- Все функции взаимодействия с модулями фреймворка - 
-- прячутся внутри таблицы love.
  love.graphics.print("Main Menu", 19, 19)
  love.window.setTitle("War For Territory")
end
  
function love.load()
-- Код в функции love.load будет вызван один раз, 
-- как только проект будет запущен.
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

function train(num)
  num = 2
  if num > 0 then
    print(num)
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