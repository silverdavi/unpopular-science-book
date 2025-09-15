# Writing Rules for "Unpopular Science"

## Core Philosophy

**Anti-Sensationalism**: Reject "laugh track" approaches to science communication. Science doesn't need manufactured excitement or dramatic language. Wonder should arise naturally from the ideas themselves.

**Rigorous Accessibility**: Present science as it truly is — both elegant and complex. Respect reader intelligence without oversimplifying. Understanding takes effort, but that effort transforms curiosity into enlightenment.

**Structural Integrity**: The hardcore analysis section provides scaffolding for the entire chapter, even if not all readers can follow it completely. It justifies the clarity above it.

## Narrative Structure Rules

### Chapter Organization
Each chapter follows a three-part structure:
1. **Historical Context** - Concise background on people, circumstances, or discoveries
2. **Phenomenon Description** - Clear, down-to-earth explanation without sensational language  
3. **Hardcore Analysis** - Rigorous academic analysis with equations, references, and detailed derivations

### Language and Style Rules

**Em Dash Usage**: Use em dashes only when structurally necessary, and always pad with spaces on both sides (" — " not " --- ").

**Eliminate Filler Words**: Remove words that don't add substance. Target vague softeners ("rather," "somewhat," "quite," "fairly"), empty intensifiers ("very," "extremely," "highly"), and structural fillers ("underlying," "overall," "general"). Every word must contribute meaning.

**Preserve Technical Language**: Distinguish between filler and precise technical terms. Words like "fundamental," "significant," "multiple," "complex," "crucial," "important," and "specific" are legitimate when they convey technical meaning:
- ✓ "multiple paths" (physics: many geodesics exist)
- ✗ "multiple approaches" (vague: how many?)
- ✓ "significant challenges" (technical assessment)
- ✗ "significant results" (empty praise)
- ✓ "Special relativity" (proper name of theory)
- ✗ "special method" (vague qualifier)
- ✓ "complex analysis" (mathematical field)
- ✗ "complex situation" (vague descriptor)

**No Rhetorical Questions**: Enter topics directly. Avoid rhetorical questions, dramatization, or surprise framing.

**Contextual Contrast Scaffolding**: Generally avoid "not only... but also..." constructions, "this XXX is not merely YYY but ZZZ" patterns, and "not because X but because Y" structures. However, preserve these when they express meaningful logical relationships:
- ✗ "Gold is not just yellow but also metallic" (redundant contrast)
- ✓ "Proper time depends not only on local geometry but also on global topology" (two distinct physical contributions)
- ✗ "This approach is not merely theoretical but practical" (empty contrast)
- ✓ "The effect arises not from acceleration but from frame transitions" (clarifies causal mechanism)

**"Structure" Usage**: Reserve "structure" (noun) for literal contexts only:
- ✓ "sentence structure," "atomic structure," "Sun's internal structure"  
- ✗ "structure of the argument," "underlying structure," "mathematical structure"
Use specific synonyms: "framework," "organization," "pattern," "relationship," "architecture," "configuration."

**Avoid Repetition**: Do not repeat explanations or phrasing across adjacent sections or sentences. Each sentence must advance content.

**Personal Voice in Commentary**: Allow more personal, reflective voice in commentary sections and sidenotes while maintaining technical accuracy in main content.

## Mathematical and Technical Rules

**Clarify Abstract Terms**: Introduce and illustrate abstract concepts (e.g., curvature) with concrete examples before using them in abstract contexts.

**Interpret Mathematical Terms**: Physically interpret each mathematical term (e.g., Christoffel symbols) when introduced. Mathematics should connect to physical reality.

**Justify Approximations**: Explicitly state the reason behind any approximation (e.g., dropping higher-order terms due to smallness).

**Restrict Equations**: Include only equations that convey structural insight. Avoid gratuitous derivations that don't advance understanding.

**Proper Equation Formatting**: Use aligned environments with line breaks and suppressed numbering where appropriate for multi-step derivations.

## File Structure Standards

Each chapter folder contains:
- `main.tex` - Primary chapter content
- `historical.tex` - Historical context section
- `technical.tex` - Hardcore analysis section  
- `summary.tex` - Brief chapter summary
- `title.tex` - Chapter title
- `quote.tex` - Opening quote
- `topicmap.tex` - Tag words that follow the main.tex content
- `sidenote.tex` - Sidenote content (1 page)
- Additional files as needed: `exercises.tex`, `imagefigure.tex`, `joke.tex`, `cartoon.tex`

## Target Page Structure

Each chapter aims for exactly **8 pages**:

1. **Page 1**: Title + Summary + Topicmap + Quote
2. **Pages 2-6**: Historical + Main content (4-5 pages)
3. **Page 7**: Technical/Hardcore analysis (1 page)
4. **Page 8**: Sidenote (1 page)
5. **Optional**: Exercise/imagefigure/joke/cartoon (replaces 1 page when included)

*Note: This is a target structure, still work in progress.*

## Tone Guidelines

**Authoritative but Humble**: Present information with confidence while acknowledging complexity and nuance.

**Direct Entry**: Begin discussions immediately without preamble or throat-clearing.

**Substance Over Style**: Let the inherent fascination of scientific concepts drive engagement rather than linguistic flourishes.

**Precision**: Use technically accurate language. Avoid approximations in language that could mislead about the underlying science.

**No Manufactured Wonder**: Don't tell readers how to feel ("This is mind-blowing!"). Let the material speak for itself.

## Summary Style Guidelines

**"Bar-Pitch" Approach**: Write summaries as compelling, concise pitches that "awe the reader." Focus on why the topic matters and what makes it fascinating. Use vivid, direct language without filler words or conversational scaffolding.

**Foreground Significance**: Lead with why the phenomenon or discovery is important, not just what it is. Emphasize the broader implications and connections to fundamental questions.

**Detailed Rules**: See `summary_writing_rules.md` for comprehensive guidelines on summary structure, content patterns, and examples of excellence.

## Editorial Guidelines

**Context-Aware Editing**: When editing for filler words, consider the semantic function of each word in context. The same word can be filler in one context and precise technical language in another.

**Physics-Informed Language**: Understand the underlying physics when editing. Terms like "multiple," "complex," "fundamental," and "significant" often have precise technical meanings that should be preserved.

**Systematic Analysis**: Use automated tools to identify potential filler words, but always apply human judgment to distinguish between meaningless filler and legitimate technical terminology.

## Formatting Conventions

- No paragraph indentation (set via `\setlength{\parindent}{0pt}`)
- Consistent spacing between sections
- Custom environments for historical, technical, and commentary sections
- Multi-column layout for technical.tex
- Proper citation format in technical sections, when the citation is for support of an interesting claim, we cite verbatim a sentence (like in @03_GoldRelativity)