return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-frecency.nvim",
    },
    opts = {
        extensions = {
            frecency = {
                auto_validate = false,
                matcher = "fuzzy",
                path_display = { "filename_first" },
            },
      },
  }
}
