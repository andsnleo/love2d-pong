local G = love.graphics
local K = love.keyboard

local Paddle = class()

Paddle:set{
  width = 10,
  height = 50,
  dy = 200
}

function Paddle:init(pos, player)
  self.x, self.y = unpack(pos)

  self.keys = {
    moveUp = player.id == 1 and "w" or "up",
    moveDown = player.id == 1 and "s" or "down"
  }
end

function Paddle:update(dt)
  self:move(dt)
end

function Paddle:draw()
  G.rectangle("fill", self.x, self.y, Paddle.width, Paddle.height)
end

function Paddle:move(dt)
  if K.isDown(self.keys.moveUp) then
    self.y = self.y + -Paddle.dy * dt
  elseif K.isDown(self.keys.moveDown) then
    self.y = self.y + Paddle.dy * dt
  end
end

return Paddle
