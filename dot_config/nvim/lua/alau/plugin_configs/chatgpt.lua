require("chatgpt").setup({
    openai_params = {
        model = "gpt-4-1106-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 500,
        temperature = 0,
        top_p = 1,
        n = 1
    }
})
