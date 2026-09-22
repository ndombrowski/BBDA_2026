# Lesson plan: Day 1 & Day 2

Rough time-boxed plan for the sessions, running 10:00-15:00 (5h, lunch break
included). Times are suggestions to sanity-check the flow, adjust freely.
Treat this as a scaffold, not a fixed schedule: the day can extend past 15:00
if the group needs it, and hands-on practicals like this are hard to
time-box precisely in advance, pacing depends a lot on where a given group
gets stuck. Day 2 is assumed to follow the same 10:00-15:00 window; adjust if
that's not the case.

## Day 1

| Time | Block | Content |
|---|---|---|
| 10:00-10:30 | Lecture | Bridge from the prior genomics module (reference-guided/genome assembly) to what's different about de novo transcriptome assembly. Roadmap for the day. |
| 10:30-11:00 | Self-study | Read the paper's methods section (Q1: paired-end/read length/strand). Start the ENA data hunt (Q2: project ID, sample accessions, `metadata.txt`). |
| ~10:55-11:00 | **ENA check** | Informal, walk the room rather than a full stop. Ask specifically about ENA/project ID progress, not the whole section. Goal: catch groups stuck on the archive navigation while there's still time left in the block to unstick them. If a group is stuck, mention the fallback `metadata.txt` file explicitly rather than waiting for them to find the hint on their own. |
| 11:00-11:30 | Self-study | Finish `metadata.txt`, set up the project folder structure, run FastQC + SeqKit on raw reads. |
| 11:30-11:45 | Lecture | SLURM job arrays (`intro_arrays.qmd`), Q&A. |
| 11:45-12:00 | Self-study | Start writing/testing the fastp SLURM array script (buffer before lunch). |
| 12:00-13:00 | Lunch break | Flexible: eat, keep coding, whatever the group prefers. |
| 13:00-14:45 | Self-study | Run the fastp array job, re-run FastQC/SeqKit on cleaned reads, build the Trinity samples file, submit the Trinity job. |
| 14:45-15:00 | Closing remarks | Recap. What happens overnight (Trinity running). What to expect on day 2. |

## Day 2

| Time | Block | Content |
|---|---|---|
| 10:00-10:20 | Discussion | Go over day 1's questions/answers together. Check Trinity job status. |
| 10:20-10:50 | Lecture | What's coming today: assembly QC, annotation, quantification, DEG analysis. Roadmap. |
| 10:50-12:00 | Self-study | Assembly QC (TrinityStats + BUSCO note below), start annotation (TransDecoder, then kick off the HMMER/KEGG search, see note below). |
| 12:00-13:00 | Lunch break | Flexible: eat, keep coding, whatever the group prefers. Good window for the HMMER/KEGG search to keep running in the background. |
| 13:00-14:40 | Self-study | Quantification (salmon), DEG analysis (DESeq2 in R), check back on HMMER/KEGG output once it's done. |
| 14:40-15:00 | Closing discussion | Recap DEG results and comparison to the paper. Wrap up the two-day tutorial. |

Three pacing notes for the day 2 self-study blocks, worth keeping in mind
rather than announcing as hard checkpoints:

- The KEGG/HMMER search takes 1-2h. If students start it by ~11:00-11:30, it
  can run through the lunch break and be ready in the early afternoon, so
  they don't wait on it idle. Worth flagging this explicitly since students
  won't otherwise know to start it early.
- BUSCO is explicitly flagged in the material as "don't run yet." It's meant
  to be picked up once everything else is done, so it doesn't block the
  annotation/quantification/DESeq2 chain.
- The "Read in and summarize annotations" step in the DESeq2 script needs the
  finished HMMER/KEGG output file, so it's a hard dependency, not just a nice-
  to-have. If HMMER takes the full 2h it may not be ready right when the
  afternoon block starts. Point students to do the "Read in salmon data" step
  first (no annotation dependency) and only move to the annotation step once
  HMMER/KEGG is done, the same way BUSCO gets explicitly deferred in the
  material itself.

## Facilitation approach (both days)

During all self-study blocks: circulate and handle questions one-on-one. If
several students hit the same issue, call a brief, unplanned group discussion
instead of repeating the same explanation one-on-one over and over.
