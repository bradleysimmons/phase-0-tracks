#design and build a nested data structure to represent a real-world construct.
painting_supply_bag = {
  paint_tubes: {
    thirty_seven_ml: {
      reds: ["cadmium red deep", "alazarin crimson", "rose madder genuine"],
      yellows: ["cadmium lemon", "cadmium yellow pale", "naples yellow light"],
      blues: ["cerulean blue", "prussian blue"],
      other: ["cobalt turquoise light", "cobalt green"]
    },
    two_hundred_ml: {
      reds: ["alazarin crimson"],
      yellows: [],
      blues: ["french ultramarine", "cobalt blue"],
      other: ["cremintz white", "viridian", "payne\'s gray"]
    }
  },
  
  brushes: {
  manet_227_A_filberts: {
    brush_one: "size 1",
    brush_two: "size 4",
    brush_three: "size 10",
    brush_four: "size 20"
    }
  },
  
 other_items: ["rgm 106 palette knife", "jar of gamsol", "roll of shop towels"]
}

#Once you've built it, print a few individual pieces of deeply nested data from the structure, showing that you know how to use multiple indexes or hash keys (or both) to access nested items. Try to demonstrate a few different types of access.

p painting_supply_bag[:paint_tubes][:thirty_seven_ml][:other]
p painting_supply_bag[:paint_tubes][:thirty_seven_ml][:reds][2]
p painting_supply_bag[:brushes][:manet_227_A_filberts][:brush_four]
p painting_supply_bag[:other_items][0]

