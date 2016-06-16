MakrosTool
==========

MakrosTool is a an extention for [Scale](https://github.com/guillep/Scale "Scale") project for easy scripting based on [Makros] (https://github.com/sbragagnolo/makros "Makros").





Installing
----------

For installing MakrosTool you have to be SUDOER and to have internet connection, and an Scale installation. If you do not have an Scale installation, please start here [Scale](https://github.com/guillep/Scale "Scale"), and comeback after having it :).


```bash
git clone https://github.com/sbragagnolo/MakrosTool
cd MakrosTool
./build/buildMakros.st
sudo ./build/install.st
```

```bash
	makros --version 
```

For uninstall MakrosTool you just need to execute 
```bash
sudo ./MakrosTool/build/uninstall.st
```


Examples
--------


#### Writing a simple echo node  

```smalltalk
#!/usr/bin/makros

" Naming component. For facilitating the after configuration " 

makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].

" Wiring up components "
makros
	applicationNamed: 'EchoerExample';
	route: #echoer >> #echo toPublisherOn: '/echo';
	start.

" Program Service "
system repeat: [ 
	(makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf 
] each: 10 hz cycleDelay.
```


Breaking this code in pieces

```smalltalk
#!/usr/bin/makros

" Naming component. For facilitating the after configuration " 

makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].

```

This first line registers a component creation block for with a name. This block will be executed when the application is built. This naming feature is for allowing to use names instead of variables.



```smalltalk

" Wiring up components "
makros applicationNamed: 'EchoerExample'.
```


This second line forces the creation of an application named 'EchoerExample'. That means that our node will be named 'EchoerExample' in the ROS master node. 



```smalltalk
makros route: #echoer >> #echo toPublisherOn: '/echo'.
```

This line does two things in a row. It creates a Topic publisher component for the topic called '/echo'. And it connects the output port #echo of the component (locally named and previously defined) echoer to the input port (#outgoing) of the just created publisher component .


```smalltalk
makros start.
```

This start command makes the real route binding and it starts the Makros inner clock. 

```smalltalk
" Program Service "
system repeat: [ 
	(makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf 
] each: 10 hz cycleDelay.
```

Finally it starts an new process that executes the given block in an infinite loop, each 100 milliseconds. (The enough time to aim to execute 10 times per second). 

Since the #repeat:each: system message register the job execution to be joined in the end of the script, the 'main thread' get paused waiting for any finalization of the echoing thread.


For watching the output of the example you can read the topic from the shell with the ros command 'rostopic' as following: 



```bash
$> rostopic echo /echo 
data: Shiny happy people holding hands 

---
data: Shiny happy people holding hands 

---
data: Shiny happy people holding hands 
...
```






Loading
-------

Wanting to code? 
   For loading this project on a development image is really easy. Just execute the building script, it will give you as output an image in the directory called 'cache', with Scale and MakrosTool installed :). 
  


Pay attention to change the address of the File repository for the Scale code. 



