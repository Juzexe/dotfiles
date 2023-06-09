# name: nai
# Display the following bits on the left:
# * Current directory name
# * Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _venv
  string split -r -m1 / $VIRTUAL_ENV
end

function fish_prompt
  set -l yellow (set_color yellow)
  set -l green (set_color green)
  set -l normal (set_color normal)
  set -l purple (set_color purple)

  set -l cwd (basename (prompt_pwd))

  set venv (_venv)
  if [ $venv[-1] ]
    set -l venv_info $purple \ue73c ' ' $venv[-1]
    echo -n -s $venv_info $normal
  end

  echo -n -s ' ' \ue5ff ' ' $cwd $normal

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set branch_symbol \uE0A0
    if [ (_git_dirty) ]
      set git_info $yellow $branch_symbol $git_branch
    else
      set git_info $green $branch_symbol $git_branch
    end
    echo -n -s ' ' $git_info $normal
  end

  echo -n -s ' -> ' $normal

end
