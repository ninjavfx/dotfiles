
alias cpu-test='s-tui'

alias gpu-test='
cd /home/ale/Downloads
sudo git clone https://github.com/wilicc/gpu-burn.git
cd gpu-burn/
sudo make 
./gpu_burn -tc 3600
'
alias nvme-test='
echo check folder /home/ale/.tools to launch the tool 
echo Commands to launch the test on command line, you can lunch the GUI tool as well
echo ./nvmecmd self-test.cmd.json -n 1  Use 1,2,3 to target the Nvme we want to test 
echo ./nvmecmd self-test.cmd.json --extended -n 1 
'
alias Nvlink='nvidia-smi nvlink --status'

alias Nvidia-full='nvidia-smi -i 0 -q'

alias jupyter-local='jupyter notebook'

alias jupyter-remote='jupyter notebook --no-browser --port=8889'

alias jupyter-help='
echo For remote config follow the steps:
echo 1- run the command Jupyter-remote
echo 2- on the client need to run this command on a terminal:
echo ssh -N -f -L localhost:8888:localhost:8889 user@domain
echo The host will give you a token, then when opening a webrowser and typing
echo http://localhost:8888/tree on the client machine, insert your token
echo Enjoy your notebook from any location
echo To get access out of your local network need to configure router porforwarding'

alias bizonbench-deploy='/bin/bash -c "$(curl -fsSL https://bizonos.s3.amazonaws.com/bizonbench_linux_deployment.sh)"'
alias bizonbench-remove='
sudo rm -rf /home/ale/bizon_suit
sudo rm -rf /home/ale/bizonbench
sudo rm -rf /home/ale/Bizon_benchmark_Linux.zip
sudo rm -rf /home/ale/end.sh
sudo rm -rf /home/ale/start.sh
sudo rm -rf /home/ale/xorg_fix.py
sudo rm -rf /home/ale/__MACOSX
sudo rm -rf /home/ale/Downloads/*
sudo rm -f /usr/share/applications/bizon_suit.desktop
history -c && history -w'

alias anydesk-restore='
sudo rm -f /etc/anydesk/service.conf
sudo reboot'

alias vm-win11='/bin/bash -c "$(curl -fsSL https://bizon-vm.s3.amazonaws.com/win11_vm.sh)"'

fans-gpu0() {
	nvidia-settings --display :1.0 -a "[gpu:0]/GPUFanControlState=1" -a "[fan]/GPUTargetFanSpeed=$1"
	echo "Fan speeds set to $1 percent"
}    

fans-gpu1() {
	nvidia-settings --display :1.0 -a "[gpu:1]/GPUFanControlState=1" -a "[fan]/GPUTargetFanSpeed=$1"
	echo "Fan speeds set to $1 percent"
}


alias ipmiview='java -jar /bin/ipmiview/IPMIView20.jar'
