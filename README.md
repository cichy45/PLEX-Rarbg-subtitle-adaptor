# PLEX-Rarbg-subtitle-adaptor

This script must be run inside folder that holds folders of RARBG released 1080p x264/x265 movies.

It will rename all English, German, Polish subtitles with addition of .eng/.ger/.pol before .srt. This way plex will recognise external subtitles with respect to language. It will also delete all other subtitles and .txt and .exe files.

It will move remaining subtitles one foler up (from Subs folder one up) and delete empty folder.

In othe words, before:


E:\Folder_główny
│
├── adapt_v2.ps1
│
├── Empire.of.the.Sharks.2017.1080p.BluRay.H264.AAC-RARBG
│   ├── Empire.of.the.Sharks.2017.1080p.BluRay.H264.AAC-RARBG.mp4
│   ├── RARBG.txt
│   ├── RARBG_DO_NOT_MIRROR.exe
│   └── Subs
│       ├── 2_English.srt
│       ├── 4_Polish.srt
│       └── 6_Portugal.srt
│
├── Jurassic.Shark.2012.1080p.BluRay.H264.AAC-RARBG
│   ├── Jurassic.Shark.2012.1080p.BluRay.H264.AAC-RARBG.mp4
│   ├── RARBG.txt
│   └── Subs
│       └── 2_German.srt
│
└── Mimic.2.2001.1080p.BluRay.x265-RARBG
    ├── Mimic.2.2001.1080p.BluRay.x265-RARBG.mp4
    ├── RARBG.txt
    ├── RARBG_DO_NOT_MIRROR.exe
    └── Subs
        ├── 2_English.srt
        ├── 4_Polish.srt
        └── 8_Russian.srt

After:

E:\Folder_główny
│
├── adapt_v2.ps1
│
├── Empire.of.the.Sharks.2017.1080p.BluRay.H264.AAC-RARBG
│   ├── 2_English.eng.srt
│   ├── 4_Polish.pol.srt
│   └── Empire.of.the.Sharks.2017.1080p.BluRay.H264.AAC-RARBG.mp4
│
├── Jurassic.Shark.2012.1080p.BluRay.H264.AAC-RARBG
│   ├── 2_German.ger.srt
│   └── Jurassic.Shark.2012.1080p.BluRay.H264.AAC-RARBG.mp4
│
└── Mimic.2.2001.1080p.BluRay.x265-RARBG
    ├── 2_English.eng.srt
    ├── 4_Polish.pol.srt
    └── Mimic.2.2001.1080p.BluRay.x265-RARBG.mp4
