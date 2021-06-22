---
title: "Biophysics"
permalink: "/biophysics/"
layout: frontpage
---

## Methods

I apply various theoretical and computational techniques to solve problems at the intersection of physics, chemistry, and biology. Given the complexity of biological systems, the physics and chemistry involved are often so intricate that no reliable ab initio models can be constructed. Coarse-graining and abstract models, based on physics, chemistry, and math intuitions are general required. Methods I use can be roughly categorized as follows:

<div id="fifty-right">
<img style="margin:10px 10px 10px 10px" src="/images/methods_schematic.svg" />
</div>
  
**Statistical Physics:** 
Structure-based models for constructing mean-field and/or detailed partition functions for biomolecular systems, including but not limited to iterative structure construction, lattice cluster expansion, chemical kinetics, and polymer field theory.

**Numerical Simulation:**
Coarse-grained simulations for investigating systems which simplified theoretical models are not applicable, or for validating the concepts and results of the theoretical models. Monte Carlo (MC) and molecular dynamics (MD) simulations in lattice and continuum space are applied.

**Statistical Analysis and Supervised Machine Learning**
These methods are applied to biological systems that large-scale experimental datasets are available for data mining, finding key features to help design new experiments and establish new theories. Meanwhile, theoretical and computational methods can also provide key features that can be validated by applying these methods to databases.

***


## Biomolecular condensates 


<div id="fifty-left">
<img style="margin:10px 10px 10px 10px" src="/images/fprofile_for_web.svg" />
</div>

<div id="fifty-right">
<img style="margin:10px 10px 13px 10px" src="/images/RPA_idea_for_web.svg" />
</div>


Biomolecular condensates are assemblies of various DNA, RNA, and protein molecules, mostly inside the cell with some exceptions. Their formation is underpinned by the liquid-liquid phase separation (LLPS) phenomena of pertinent biomolecules. Without a membrane, these condensates can rapidly respond to stimuli, and thus are crucial in various spatial-temporal regulation processes in organisms. Some of these liquid-state organelles can also evolve into pathological aggregates and are implicated to neurodegenerative diseases.

Although Phase separation of polymers is not a new topic in physical sciences, biomolecules, benefiting from the highly regulated cellular replication machinery, are under precise control of polymorphism not only regarding their lengths and configurations but also their amino acid (proteins) or nucleic acid (DNA and RNA) sequences. A new degree of freedom, the **sequence specificity**, in biological phase separation is calling for new polymer physics theories.

I applied **polymer field theory** to construct analytical (i.e. pen-and-paper) theories for describing the thermodynamic behaviors of biomolecular condensates. I have published a series of papers of sequence-specific **random-phase-approximation (RPA)** theories and their applications to real biological systems. I also conduct MC and MD simulations of biomolecular condensates. The theoretical and computational outcomes have been compared with experiments.

Selected publications:  
[Lin, Forman-Kay, & Chan, Phys Rev Lett (2016)](https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.117.178101)  
[Lin, Forman-Kay, & Chan, Biochemistry (2018)](https://pubs.acs.org/doi/abs/10.1021/acs.biochem.8b00058)  


## Intrinsically disordered proteins 

![IDP binding](/images/simulate_struct_hist_bar.svg)

Intrinsically disordered proteins (IDPs) are proteins lacking hydrophobic residues whereas enriched in charged, polar, and aromatic amino acid, thus not folding into a unique structure and maintaining "disordered" when performing their biological functions. Electrostatics and 𝜋-electron interactions are important in determining IDPs' conformational dimensions and binding reactions. These IDPs can be viewed as charged heteropolymers with precisely controlled charge patterns, which can be investigated under the framework of "sequence-specific" polymer physics theories.

I have applied the **Mayer cluster expansion** technique in statistical physics to develop an analytical theory for the transient protein-protein interaction between two highly charged IDPs.

The theory quantifies the so-called "fuzzy" molecular recognition mechanism between a pair of IDPs. The theory has been applied to real and model IDP sequences and obtained results consistent with experiments and simulations, validating the importance of the consideration of **sequence specificity**.

Selected publication:  
[Amin, Lin, Das, & Chan, J Chem Phys B (2020)](https://pubs.acs.org/doi/abs/10.1021/acs.jpcb.0c04575)  


## RNA-protein interaction  

![RNA-protein](/images/RNAprotein.svg)

RNA molecules are nucleic acid sequences transcribed from DNA. The RNA molecules carrying information for later on be translated to proteins to perform biological functions are called messenger RNA (mRNA). After an mRNA is transcribed in a cell, it is subject to a multitude of RNA processing, RNA localization, and RNA decay steps that together determine the fate of the molecule. These steps are regulated by interactions with RNA-binding proteins or small RNAs such as microRNAs. The mechanism that orchestrates these RNA-protein binding reactions is crucial and intriguing.

On this topic, I proposed a cooperative mechanism between RNA-binding proteins mediated by RNA secondary structures. The structure-based partition function of the RNA-protein system is constructed via an iterative algorithm. The analytical derivation of the theory suggests a power-law, long-range cooperativity between two proteins binding to the same RNA molecule. Physical quantities proposed by the theory has been applied to genomic databases and a cooperativity between 5'- and 3'-UTR of a messenger RNA molecule was disclosed statistically.

Publications:  
[Lin & Bundschuh Phys Rev E (2013)](https://journals.aps.org/pre/abstract/10.1103/PhysRevE.88.052707)  
[Lin & Bundschuh Nucleic acids Res (2015)](https://academic.oup.com/nar/article-abstract/43/2/1160/2414332)
