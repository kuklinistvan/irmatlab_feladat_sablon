
setGlobalX(5)
getGlobalX()

function setGlobalX(val)
global x
x = val;
end

function result = getGlobalX()
global x
result = x;
end