defmodule CommandExtractor do
    def extract_command(text) do
        command = %{
            text: text
            }
        command
        |> extract_prefix()
        |> extract_code_and_args()
        |> remove_text_key()
    end
    
    def extract_prefix(command) do
        prefix = String.slice(command[:text], 0..0)
        updated_text = String.slice(command[:text], 1..-1)
        Map.merge(command, %{
            text: updated_text,
            prefix: prefix
        })
    end

    def extract_code_and_args(command) do
        text = command[:text]
        [code | args] = text 
                        |> String.split(" ")
                        |> Enum.filter(fn x -> x != "" end)
        updated_text = ""

        Map.merge(command, %{
            text: updated_text,
            code: code,
            args: args
        })
    end

    def remove_text_key(command) do
        {_, clean_command} = Map.pop(command, :text)
        clean_command
    end


    #utility
    def remove_prefix(text) do
        chop(text, 1)
    end

    def chop(text, start_index) do
        String.slice(text, start_index..-1)
    end

    def code_char?(char) do
        special_char?(char) or letter?(char)
    end

    def special_char?(char) do
        special_chars = String.split("-", "")
        Enum.member?(special_chars, char)
    end

    def letter?(char) do
        alphabet = String.split("abcdefghijklmnopqrstuvwxyz", "")
        Enum.member?(alphabet, char)
    end

end










