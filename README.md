# hfdumps
Dumps from a collection of hotel room keys for analysis

This is a collection of dumps of HF RFID hotel keys collected over several years.

Dumps of Mifare cards were made from the "hf mf autopwn" command of iceman's proxmark3 
firmware on a Proxmark3 RDV4 using the stock antenna.

The majority of them are Mifare keys, with a smattering of others thrown in for good measure.

Probably a good representative cross-section of what's out there in the real world.

Maybe a good source for a key dictionary to speed up pwns?

There are three types of files.  .bin, .eml and .json.  Keys discovered are greppable in the
.json files.  Might post an analysis at some point.

Feedback welcome.  Either here via github or at dc540@dc540.org.

I added a script to begin the process of unpacking what's contained in the Mifare dumps. More
than anything it's to help me to understan the structures.  I can't stress enough that I'm
fairly new at this. RFID contains worlds, and I'm barely scratching the surface. I look at
the content in the Proxmark forums and I wonder if I'm even interested in knowing as much as
some of them do. But I'm encouraged by the fact that there are ialso people posting in there that 
appear to be dumber than me. :)

Please follow @dc540_nova to keep abreast of future developments and projects by the DC540 group.
We're growing and we have big dreams.
