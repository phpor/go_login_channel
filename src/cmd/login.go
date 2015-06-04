package main

/**
 问题：
 1. 没有 -t 选项时，是不行的， -t 指定一个字符串勉强可以通过
 2. -T选项将不把ssh看做一个终端，会遇到很多问题
 3. 命令回显的处理如何做？
 */
import (
	"fmt"
	"os/exec"
	"os"
	"io/ioutil"
	"time"
)


func main() {
	home := os.Getenv("HOME")
	user := "vagrant"
	ip := "172.16.7.239"
	privkey := home + "/vagrant.pri"

	//no buffering
	exec.Command("stty", "-F", "/dev/tty", "cbreak", "min", "1").Run()
	//no visible output
	exec.Command("stty", "-F", "/dev/tty", "-echo").Run()

	cmd := exec.Command("ssh", "-t", "-t", "-i" , privkey, user + "@" + ip)
//	cmd := exec.Command("/bin/echo", "123")
	stdin, err := cmd.StdinPipe()
	stdout, err := cmd.StdoutPipe()
	stderr, err := cmd.StderrPipe()

	err = cmd.Start()
	if err != nil {
		print("ssh exec fail")
		os.Exit(-1)
	}
//	fmt.Fprint(stdin, "stty -F /dev/tty -echo\n")
	fmt.Fprint(stdin, "stty -F /dev/tty cbreak min 1\n")
	ch := make(chan int, 3)
	go func() {
		b := make([]byte, 1)
		for{
			_, err = stdout.Read(b)
			if err != nil {
				break
			}
			fmt.Print(string(b))
			os.Stdout.Sync()
		}
		ch <- 1
	}()
	go func() {
		b := make([]byte, 1)
		for{
			_, err = stderr.Read(b)
			if err != nil {
				break
			}
			fmt.Print(string(b))
		}
		ch <- 1
	}()
	go func() {
		b := make([]byte, 1)
		for{
			_, err = os.Stdin.Read(b)
			if err != nil {
				break
			}
			fmt.Fprint(stdin, string(b))
		}
		ch <- 1
	}()
	go func() {
		for{
			break;
			cmd := exec.Command("stty", "-F", "/dev/tty", "size")
			stdout,_ := cmd.StdoutPipe()
			stderr,_ := cmd.StderrPipe()
			cmd.Start()

			b,_ := ioutil.ReadAll(stdout)
			fmt.Print(string(b))
			b,_ = ioutil.ReadAll(stderr)
			fmt.Print(string(b))

			// 我无法将改变后的size通过命令的方式通知到远端的sshd
			time.Sleep(time.Second*3)
		}
	}()
	<-ch
	exec.Command("stty", "-F", "/dev/tty", "echo").Run()

}


/*
<?php
$mypwd = "123";
$arrIp = array("10.0.2.2");
while(true) {
	echo "please input password:";
	$pwd = trim(fgets(STDIN));
	$pwd = "123";
	if ($pwd != $mypwd) continue;
	$user = posix_getlogin();
	$user = 'vagrant';

	while(true) {
		echo "please input ip to connect[ q for exit ]:";
		$ip = trim(fgets(STDIN));
		$ip = "10.0.2.2";
		if ($ip == "q") exit;
		if (!in_array($ip, $arrIp)) {
			echo "forbidden\n";continue;
		}
	echo	passthru("ssh -i /Users/phpor/.vagrant.d/boxes/web/0/virtualbox/vagrant_private_key $user@$ip -p 2222");
	}
}

 */
