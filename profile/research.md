# Research

The technical core. Use this for research statements, lab-meeting intros, paper-collaboration cold emails, and the "what's your dissertation about" question.

---

## Current PhD research (Aug 2025 – present)

### Title
**An AI-Driven Co-Creation Framework for Manufacturing-Aware Design**
*(NDSEG version: From Integration to Co-Creation: A Human-Machine Teaming Framework for AI-Guided Manufacturing-Aware Design)*

### Lab and advisor
- **Co-Design Lab**, Mechanical Engineering, UC Berkeley
- **Advisor:** Prof. Kosa Goucher-Lambert (tenured 2026)
- **Lab affiliation:** Berkeley Institute of Design (BiD), with HCI tie-ins via the B-Crew group
- **Industry collaboration:** Autodesk Industry Futures research lab; planned use of Pier 9 Technology Center (San Francisco)
- **Physical testing partner:** Jacobs Design Institute Makerspace at Berkeley

### The problem (one paragraph)

Modern complex systems — satellites, defense systems, vehicles — take years to develop. A study of 22 low-Earth-orbit systems found an average of 7+ years from idea to spacecraft. A major contributor is the **design-to-manufacturing bottleneck**: manufacturability is considered late, after concept and prototype, sometimes during finalization. Late changes drive enormous cost and schedule overruns. State-of-the-art CAD/CAM software offers integration but only one-way data transfer (CAD → CAM); current methods accelerate CAM individually but don't help the designer make machining-aware parts from the beginning. Current research on agentic AI in engineering design focuses on idea generation and team dynamics, not mechanical design.

### The thesis (one paragraph)

**Co-creation** — agentic AI partnering with the designer in CAD, with manufacturer expertise in the loop, throughout early-stage design — can reduce late-stage manufacturability changes (saving millions of dollars and thousands of hours per program), while keeping control with the designer. The dissertation builds and tests this framework specifically for **subtractive manufacturing (CNC machining)**, the dominant method for producing complex-system components.

### The three aims

#### Aim 1 — Identify the core problems behind the slow design-manufacturing handoff and create a co-creation framework

Two studies:
1. **Field study** with mixed methods on current designer-manufacturer collaboration and AI use, focused on:
   - What form/delivery of design feedback is most informative and least disruptive for the designer?
   - What barriers exist to early/effective designer-manufacturer communication?
   - How do engineers currently use AI in early-stage mechanical design?
   - Which design stages would benefit most from CAM co-creation?
2. **Framework synthesis study** answering: *How can designers, manufacturers, and AI operate concurrently to optimize early-stage design outcomes?*

Output: a co-creation framework, tested and updated in Aim 2.

#### Aim 2 — Develop agentic co-creation methodologies and use them to collect data and hone the framework

Three studies, each using a different digital design aid and recording one mode of communication:
1. **Simplified qualitative feedback** — digital machinability rubrics (un-machinable features, production risk, workholding difficulty) graded by machinists and viewed by designers.
2. **Natural-language and quantitative feedback.**
3. **Visual geometry assessment.**

Implementation: integrate the design aids into the **Jacobs Design Institute Makerspace** workflow to record a high quantity and distribution of projects.

Output: training data on fundamental manufacturability metrics; updated framework; a methodology for building agentic co-creation models.

#### Aim 3 — Train agentic co-creation models and test implementation strategies

- Use the existing digital DFM-feedback tools as platforms to train and embed co-creation models (e.g. automated CAM graders).
- Continual updates based on user feedback.
- Re-run Aim 2 studies to study how designer behavior changes under automation, the effects on design outcomes, and common failure modes.
- Models to compare: **graph neural networks (GNNs), agentic large-language models (LLMs), 2D and 3D CNNs, vision–language models.**

Backstop: because the studies use digital collaboration platforms, when models hallucinate or malfunction, a manufacturer can correct the system; corrections become training data.

### Intellectual merit

- Establishes a **detailed framework, training dataset, and robust AI capabilities** for evolving design-for-manufacturing.
- Targets a real gap: 3D data and spatial reasoning have historically been hard for AI; manufacturability data are scarce and inconsistent.
- The lab's HCI tie (B-Crew) supports the digital-application development that the work depends on.
- The Autodesk partnership provides researchers, data, and the Pier 9 facility as a second testbed for novel comparisons of UC Berkeley vs. Autodesk project outcomes.

### Broader impacts

- **Open source.** Research methods will be released so government organizations and national labs can implement and improve them.
- **Public dataset.** The 3D-geometry-and-manufacturability dataset enables future research on AI for engineering design.
- **Workforce transition.** As the machinist workforce ages, the next generation can shift from individual operation to monitoring multiple agents — a critical investment in the future DoD workforce.
- **Engineering accessibility.** Designers can manifest ideas with less friction, lowering the cost of engineering capability for those without expensive equipment or expensive degrees.
- **Dissemination plan.** Annual presentation at the **Computational Design for Advanced Manufacturing Symposium (CDFAM)** series; paper submissions to **ASME IDETC-CIE**; ASME journal papers from Aim 2 and Aim 3 results.
- **Education.** Future plan to develop a multidisciplinary student team using my research and Autodesk resources to help engineering clubs at Berkeley improve their system development processes.

### DoD-specific framing (NDSEG / DoD SMART / ERDC)

The work directly supports DoD critical-technology areas:
- **Trusted AI** — open-source models can be validated and audited.
- **Human-Machine Interfaces** — co-creation is human–machine teaming for cognitively demanding mechanical design, an area where AI has historically struggled to assist engineers.
- **ERDC W912HZ-25-BAA-01 ITL-1 / ITL-2 alignment** — the framework + agentic models advance computer-aided engineering across design and manufacturing; the data and framework support future digital-twin development; the outputs enable internal development of secure, multifunctional DoD design software.

Defense application narrative: *Manufacturing-aware design enables rapid development of bespoke defense systems, increasing adaptability on and off the battlefield, with maintainability and reparability for mission-critical systems — when a crucial part is needed, future warfighters no longer need to rely on the original manufacturer for repairs.*

---

## Past undergraduate research

### Honors thesis — Penn State Applied Research Lab (Jan 2023 – May 2025)
**Dynamic Analysis of Composite-Steel Bolted Joints for Structural System Design**

- FEA modeling of hybrid joint stiffness and vibration behavior in **Abaqus**.
- Calculated spring constants from static simulation data; ran a parametric study.
- Built a simplified model using complex spring elements; compared with the nonlinear model.
- Steady-state dynamic analysis: 2 models, 8 forcing functions, hundreds of drive points.
- FRF and eigenfrequency processing in **MATLAB** for hundreds of transfer points.
- Compression tests, microscopy, laminate prep on reinforced polymer samples.
- *Late phase (Feb–Apr 2025):* additional work at the Penn State **Materials Research Institute** — microscopy and image analysis of metal AM samples; characterized porosity / grain-structure effects on mechanical properties.
- Held interim **Secret clearance**.

### Research intern — Zucrow Labs, Purdue University (Summer 2022)
**DARPA-sponsored solid-propellant characterization with ML**

- PI: Prof. Steven F. Son (Alfred J. McAllister Professor of Mechanical Engineering, ex–Los Alamos J. Robert Oppenheimer Fellow).
- Streamlined the propellant characterization process for the DARPA ML pipeline.
- Burn-tested 100 pintle motor propellants in a Crawford Bomb setup.
- Produced 25 Saint Robert's Law curves from collected burning-rate data.
- CAD-modeled and FE-analyzed a 7-foot-tall propellant test fixture; isolated weak points.
- Presented poster.
- Also worked in Dr. Matt Lear's group on material property data collection and plotting.
- Note from Prof. Son's recommendation: *"I usually try to hire Juniors or Seniors, but Douglas is truly exceptional… GPA puts him in the top 1% of his class."*

---

## Industry research

### Mechanical Engineering Intern (Side Closures) — Rivian (Summer 2024)
- R&D project: replace welded sheet-metal door inner with a single die-cast inner panel.
- Designed inner panel + impact beam in CATIA.
- CAE simulation of door sag in Altair Simsolid; iterative redesign.
- FMEA + boundary diagram for failure-mode analysis.
- BOM and decision matrix for full-program business case.
- Produced an internal DFM guide on high-pressure and high-vacuum die casting.
- Solution supported a **patent application** at internship end.

---

## Reading the room — research-conversation cheat sheet

| Audience | Lead with |
|---|---|
| Mechanical / design researcher (IDETC, CDFAM) | Co-creation framework, the cognitive-collaboration empirical study, Autodesk partnership |
| HCI researcher | Designer-AI workflow integration, agentic LLM/GNN failure modes, B-Crew tie-in |
| ML / AI researcher | Training-data scarcity in manufacturability, multimodal 3D-geometry dataset, model comparison |
| Manufacturer / industry | Concrete cost/time savings, single-piece die-cast door story, machinist workforce transition |
| DoD / national-lab | DoD-bottleneck framing, Trusted AI / HMI critical-tech alignment, open-source for ERDC ITL-1/ITL-2 |
| General audience | "Help designers make things that machinists can actually build, in days instead of months" |

---

## Publications, talks, papers in flight

| Item | Status |
|---|---|
| ASME IDETC 2026 paper on tacit DFM knowledge — companion site at idetc-paper-site.vercel.app | In progress |
| AI in Engineering Design — a living research map (ai-in-design-map repo) | Public |
| AI Industry Map + Explorer (ai-industry-map / ai-industry-map-explorer) | Public |
| Web Design Guide / App Aesthetics Guide essays | Public |
| Ways of Thinking — viz-research-hub | Public |
| AI Engineering Design DB — flat-file JSONL DB of 831 AI/ML projects + interactive KG (8,795 edges) | Public |
| DFM Knowledge Graph Agent v2 (dfm-kg-agent-v2) | Active |

See the [Sites index](https://dpm-sites.vercel.app) for the live versions.
