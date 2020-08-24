### Using Virustotal for DFIR/Threat Hunting

VT is for uplading/scanning and researching virus samples.

### Operators
- AND
- OR
- NOT

### Modifiers:
- `tag:`
	- `tag:docx AND (tag:macros OR tag:exploit)`
	- combinig tags and operators for search
- `behaviour_registry:`
	- `behaviour_registry:"[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"`
	-   You can look for behaviour and all the actions that takes place in a system where the \RUN was performed
- `behaviour_process`
	- `tag:docx AND behaviour_processes:"powershell.exe"`
	- behaviour that triggered and opened poweshell using a docx file when opened
	- Also gives process tree of actions performed
	-  `tag:docx AND behaviour_processes:"powershell.exe" AND behaviour:"ep bypass"`
	- for results which show that opening a docx file led to opening powershell and having arguments `ep bypass` in the exploit.
	- Shows shell commands in the the behaviour section
- `content`
	- `content:{411414142546432432}`
	- content in hexadecimal with no spaces to look for similar bytes in the samples available.
- `name`
	- `name:vbaProject.bin`
	- look for file with particular names
- `behaviour_network`
	- `behaviour_network:"settings.crashlytics.com"`
	- Look for network behaviour and requests to particular DNS resolvers/websites
	- shows behaviour in network communication section
- `size`
	- `size:245187`
	- look for files with size in bytes
- `entity`
	- `entity:file symantecmobileinsight:"AppRisk:Generate"`
	- specific files scanned by certain av engines and flagged has AppRisk:generate



### Yara Rules 