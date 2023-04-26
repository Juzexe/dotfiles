set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1


set -x EDITOR hx
set -x VISUAL hx
set -e WAYLAND_DISPLAY
# set -gx WAYLAND_DISPLAY wayland-0
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

fish_add_path ~/.local/bin

alias ls="exa -lh"
alias cat="bat"

function venv
    . ./venv/bin/activate.fish
end

function airflow
    cd ~/Work/airflow/
end

function programming
    cd ~/Programming/
end

function webservice
    cd ~/Work/web-services-khd/
end

function cambridge
    cd ~/Work/cambridge_answers_backend/
end

function superset
    cd ~/Work/egfdem-superset-plugins
end

function telegram
    cd ~/Downloads/Telegram\ Desktop
end

function education
    cd ~/Programming/forks/education-backend
end

function fish_greeting
end

function ntfy_docker
    curl -H ta:heavy_check_mark -d "Docker build finished" ntfy.sh/linara
end

function up_vpn
    wg-quick up WorkPC_wg0
end

function down_vpn
    wg-quick down WorkPC_wg0
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /home/juzexe/.spicetify

function __fish_doit_list
    # doit list --template '{name}'
    doit list --template '{name}tab{doc}' | sed 's/tab/\t/'
end

complete -c doit -f -a '(__fish_doit_list)'
