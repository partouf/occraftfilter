local component = require('component');
local tp = component.transposer;

function getEmptySlot(side)
  for slot = 1, tp.getInventorySize(side) do
    local stack = tp.getStackInSlot(side, slot);
    if stack then
      if stack.name == "air" then
        return slot;
      end
    else
      return slot;
    end
  end

  return -1;
end

function transferRandomStuff(source, destination)
  for slot = 1, tp.getStackInSlot(source) do
    local stack = tp.getStackInSlot(source);
    if stack then
      if not (stack.name == "air") then
        local emptyslot = getEmptySlot(destination);
        if (emptyslot > 0) then
          tp.transferItem(1, destination);
        else
          print("no empty slots")
        end
      end
    end
  end
end
    
transferRandomStuff(1, 2);
