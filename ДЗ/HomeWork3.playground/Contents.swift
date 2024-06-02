var x = 0
var y = 0
while x < 351 {
x += 70
    if x > 352 && y > 600 {
        x = 0
        y = 0
        break
    } else if x > 360 {
        x = 0
        y += 70
        }
    }
print (x)
print(y)
