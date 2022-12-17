<h1>What is Multi-AOF?</h1>
Multi-AOF is an edited version of Team AOF's StartServer.bat Script to allow the user to automatically create a MultiMC .ZIP Instance.

No plans for any port on GNU/Linux systems. If you're using that, then you probably could do what this tool does a million times better than me.

Due to current limitations (from the lack of programming knowledge on my part) the setup is odd but it works.

<h2>Instructions</h2>

1 - Download Multi-AOF via the releases tab (or the "Code" button)

2 - Go to your favorite modpack on CurseForge (ew) that includes server files (example: All Of Fabric 5) and download the server files.

3 - Extract Multi-AOF somewhere (Documents is a good place)

4 - Open the Modpack Archive and find "seerver-setup-config.yaml", extract it in the .minecraft folder of Multi-AOF

5 - Run Multi-AOF.bat (which is also located in .minecraft)

6 - Follow the on-screen prompts (and thus exit the program when you're prompted to agree to the EULA assuming you did everything correctly)

7 - Relaunch Multi-AOF.bat

8 - Follow the on-screen prompts again

9 - Drag and drop the Multi-AOF.zip file into your Multi-MC window and press "OK"

10 - If needed, right click the newly added Instance, click on "Edit Instance" and change the "LWJGL 3" / "Minecraft" / "Intermediary Mappings" / "Fabric Loader" version by clicking on "Change Version" and then choose the one that corresponds to your modpack.

11 - Enjoy !


<h3>Notice:</h3>
If you see the following message when installing the 7zip Powershell Module:

```
Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its
InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules from
'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"):
```

Please press Y and then enter.

<h4>Tested Modpacks</h4>
- All of Fabric 5's Server YAML

- All of Fabric 6's Server YAML (v1.10)

<h4>Tested Windows Versions</h4>
- Windows 11 Enterprise N Insider Dev (Build 25252.1010)

- Windows 11 Enterprise N Insider Dev (Build 25267.1010)
