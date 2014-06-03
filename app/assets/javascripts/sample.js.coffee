class Person
  constructor: (@name = "nobody", @phone = "6060842") ->


$ ->
  $("#select").click ->
    checkboxes = $("input[type=checkbox]")
    for checkbox in checkboxes
      checkbox = $(checkbox)
      checkbox.prop "checked", !checkbox.prop("checked")

  x = for item in ["apple", "banana"]
    "Fruit: #{item}"


  name = "david"
  z = if name == "david"
    "yay"
  else
    "not yay"

  person = new Person()
  person.name = "Catherine"

  console.log z