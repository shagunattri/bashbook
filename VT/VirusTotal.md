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

In VT you can make rulesets and use the YARA templatea to pattern match malware samples

```yara
rule yara_template
{
	strings:
		$a = "first string"
		$b = "second string"
		$c = "third string"
		$d = "fourth string"
	condition:
		all of them
}
```
Check for four strings and trigger notification when all of them are satisfied in the pattern

```yara
rule silent_banker : banker
{
	meta:
		description = "This is just an example"
		thread_level = 3
		in_the_wild = true

	strings:
		$a = {6A 3A 4F 5G 6J 7V 2G 13 54 F5 91}
		$b = {3D 5F 5G 32 FE 42 C5 D3 5T G5 45}
		$c = "UDFGHJMNBVCDFGHJMNBVGYJKM"

	condition:
		$a or $b or $c
}
```

Strings with the hex bytes,where we are matching conditions wiht either a or b or c.



sample for files with request sent to a website:
```yara
import "cuckoo"

rule example_19
{
	condition:
		cuckoo.network.http_request(/www\.google\.com/)
}

```


using cuckoo to define string with hex bytes and checking for string and sending request to sites.

```yara
import  "cuckoo"

rule evil_doer
{
	strings:
		$a = {01 23 25 67 98 47}

	condition:
		$some_string and cuckoo.network.http_request(/http:\/\/someone\.doingevil\.com/)
}
```


### Further Reading

https://github.com/VirusTotal/yara

http://virustotal.github.io/yara/


### VT GRAPH

start investigation with a hash,IP and details the graph with sample info,properties
- Gives file information
- Root node
- Show bundled files
- Relationship nodes
- Full expansion of nodes and the relations