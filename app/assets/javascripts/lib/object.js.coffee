Object.size = (obj)->
  size = 0
  for key of obj
    size++ if (obj.hasOwnProperty(key))
  return size;
