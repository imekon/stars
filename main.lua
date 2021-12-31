function love.load()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()
    
    stars = {}
    for i = 1,200 do
        stars[i] = {}
        stars[i].x = math.random() * screenWidth * 2
        stars[i].y = math.random() * screenHeight * 2
        stars[i].size = 2 + math.random() * 3
        --stars[i].speed = 2 + math.random() * 3
    end
        
    starX = 0
    starY = 0
    speedX = 0
    speedY = 0
    speed = 180
end

function love.update(dt)
    speedX = 0
    speedY = 0
    
    if love.keyboard.isDown("left") then
        speedX = speed
    end
    
    if love.keyboard.isDown("right") then
        speedX = -speed
    end
    
    if love.keyboard.isDown("up") then
        speedY = speed
    end
    
    if love.keyboard.isDown("down") then
        speedY = -speed
    end
    
    starX = (starX + dt * speedX) % screenWidth
    starY = (starY + dt * speedY) % screenHeight
end

function love.draw()
    for i, star in pairs(stars) do
        local x = (star.x + starX) % screenWidth * 2
        local y = (star.y + starY) % screenHeight * 2
        love.graphics.circle("fill", x, y, star.size)
    end
end
