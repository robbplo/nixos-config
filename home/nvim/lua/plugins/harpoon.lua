return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
   { "<leader>a", function() require('harpoon'):list():add() end, desc = "Harpoon add" },
   { "<leader>o", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Harpoon toggle menu" },
   { "<C-1>", function() require('harpoon'):list():select(1) end, desc = "Harpoon goto 1" },
   { "<C-2>", function() require('harpoon'):list():select(2) end, desc = "Harpoon goto 2" },
   { "<C-3>", function() require('harpoon'):list():select(3) end, desc = "Harpoon goto 3" },
   { "<C-4>", function() require('harpoon'):list():select(4) end, desc = "Harpoon goto 4" },
   { "<C-5>", function() require('harpoon'):list():select(5) end, desc = "Harpoon goto 5" },
   { "<C-6>", function() require('harpoon'):list():select(6) end, desc = "Harpoon goto 6" },
   { "<C-7>", function() require('harpoon'):list():select(7) end, desc = "Harpoon goto 7" },
   { "<C-8>", function() require('harpoon'):list():select(8) end, desc = "Harpoon goto 8" },
   { "<C-9>", function() require('harpoon'):list():select(9) end, desc = "Harpoon goto 9" },
  },

}
