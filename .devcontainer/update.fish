echo "=========== Update you container on start ==========="

if test $TZ = "Asia/Shanghai"
  echo ">> Set source mirror"
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  sudo sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
end

if test -f ./requirements.txt
  echo ">> Install requirements"
  pip install -r ./requirements.txt
end


if test -f ./package.json
  echo ">> Install bun"
  curl -fsSL https://bun.sh/install | bash
  echo 'set -x PATH ~/.bun/bin $PATH'  >> ~/.config/fish/config.fish
end

if test -n "$MODULAR_AUTH"
  echo ">> Install mojo from https://developer.modular.com/download"
  curl https://get.modular.com | MODULAR_AUTH=$MODULAR_AUTH sh -
  modular install mojo
  if test -z "$MODULAR_HOME"
    echo 'set -x MODULAR_HOME $HOME/.modular' >> ~/.config/fish/config.fish
    echo 'set -x PATH $MODULAR_HOME/pkg/packages.modular.com_mojo/bin $PATH' >> ~/.config/fish/config.fish

    echo 'export MODULAR_HOME=$HOME/.modular' > ~/.bashrc
    echo 'export PATH=$HOME/pkg/packages.modular.com_mojo/bin:$PATH' > ~/.bashrc
  end
end