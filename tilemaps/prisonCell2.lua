return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 25,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 7,
  properties = {},
  tilesets = {
    {
      name = "Map_Tileset_06",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "../graphics/Map_Tileset_06.png",
      imagewidth = 256,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 25,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        33, 34, 33, 33, 33, 33, 33, 33, 41, 37, 38, 41, 33, 34, 33, 34, 33, 34, 33, 34,
        49, 50, 49, 49, 49, 57, 49, 49, 50, 53, 54, 50, 49, 50, 49, 50, 49, 50, 49, 50,
        33, 34, 3, 3, 4, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 3, 3, 4, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 19, 19, 19, 20, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 19, 3, 3, 4, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 19, 3, 4, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 19, 3, 4, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 3, 4, 4, 3, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 3, 3, 4, 19, 20, 19, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 19, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 20, 3, 3, 4, 20, 19, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 19, 3, 4, 4, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 0, 19, 20, 19, 20, 19, 20, 19, 3, 3, 4, 19, 20, 19, 20, 19, 20, 0, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 3, 19, 3, 3, 4, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 20, 19, 20, 19, 3, 4, 20, 19, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 3, 4, 3, 3, 3, 4, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 20, 19, 20, 19, 19, 3, 3, 4, 20, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 19, 3, 3, 4, 3, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 19, 3, 4, 19, 20, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 3, 4, 4, 33, 34,
        49, 50, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 3, 3, 4, 49, 50,
        33, 34, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 19, 19, 20, 33, 34,
        33, 34, 33, 34, 43, 44, 33, 34, 33, 34, 33, 34, 33, 34, 43, 44, 33, 34, 49, 50,
        49, 50, 49, 50, 59, 60, 49, 50, 49, 50, 41, 50, 49, 50, 59, 60, 49, 50, 33, 34
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "GameObjects",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 144,
          y = 0,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Walls",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 144,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 176,
          y = 0,
          width = 144,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 288,
          y = 32,
          width = 32,
          height = 368,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 32,
          y = 368,
          width = 256,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 32,
          width = 32,
          height = 368,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 25,
      id = 2,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        33, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 34,
        49, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, 50,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
