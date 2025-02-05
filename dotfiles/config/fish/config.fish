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

    # Use the systemd-managed ssh-agent
    set -x SSH_AUTH_SOCK (systemctl --user show-environment | grep SSH_AUTH_SOCK | cut -d= -f2)

    # Add SSH key if not already added
    ssh-add -l > /dev/null 2>&1; or ssh-add ~/.ssh/id_ed25519

    # Run Fastfetch for system info
    fastfetch
end

