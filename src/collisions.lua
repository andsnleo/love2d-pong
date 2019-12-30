local tbl = require("lib/tbl")
local settings = require("src/settings")
local G = love.graphics

local collisions = {}

function collisions.betweenBallAndPaddles(ball, paddles)
  tbl.each(
    paddles,
    function(p)
      local collidedInX
      local collidedInY = ball.y >= p.y and ball.y <= p.y + p.height

      if p.player.id == 1 then
        collidedInX = ball.x <= p.x + p.width
      elseif p.player.id == 2 then
        collidedInX = ball.x + ball.width >= p.x
      end

      if collidedInX and collidedInY then
        ball:bounceHorizontally()
      end
    end
  )
end

function collisions.betweenBallAndWalls(ball)
  local collidedInY

  if ball.dy < 0 then
    collidedInY = ball.y <= 0
  elseif ball.dy > 0 then
    collidedInY = ball.y + ball.height >= settings.window.virtual.height
  end

  if collidedInY then
    ball:bounceVertically()
  end
end

return collisions