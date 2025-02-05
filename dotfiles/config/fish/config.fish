function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Disable Fish greeting
    set fish_greeting ""

    # Initialize Starship prompt
    starship init fish | source

    # Apply AGS terminal sequences (if available)
    if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
        cat ~/.cache/ags/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias pamcan=pacman

    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
   
    fastfetch

end

