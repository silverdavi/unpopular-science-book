# Punctuation and Typography Standards for "Unpopular Science"

## Quotation Marks

### Double Quotes
- **Usage**: Direct quotations, ironic usage, first mention of unusual terms
- **LaTeX**: Use `` ` ` '' (backticks and straight quotes), NOT "straight quotes"
- **Example**: ``This is a proper quote''
- **NOT**: "This is wrong"

### Single Quotes
- **Usage**: Quotes within quotes, technical terms on first use
- **LaTeX**: Use `` ` ' (single backtick and straight quote)
- **Example**: ``He said `quantum' repeatedly''

### Block Quotes
- **Usage**: For quotes longer than 3 lines
- **LaTeX**: Use `\begin{quote}...\end{quote}` environment
- **No quotation marks needed in block quotes**

## Dashes

### Em Dash (—)
- **Usage**: Parenthetical statements, dramatic pauses
- **LaTeX**: ` --- ` (three hyphens WITH spaces on both sides)
- **Example**: `The result --- surprising to everyone --- changed physics`
- **NOT**: `The result---surprising to everyone---changed physics`

### En Dash (–)
- **Usage**: Ranges (pages, years, values)
- **LaTeX**: `--` (two hyphens, no spaces)
- **Example**: `1914--1918`, `pp. 23--45`, `$5--10$ GeV`

### Hyphen (-)
- **Usage**: Compound words, word breaks
- **LaTeX**: `-` (single hyphen)
- **Example**: `self-consistent`, `re-examine`

## Quote Attribution

### After Block Quotes
```latex
\begin{quote}
The quote text here...
\end{quote}
\hfill --- Author Name, \textit{Source} (Year)
```

### Inline Attribution
- Use em dash with space: ` --- Einstein (1915)`
- NOT: `- Einstein` or `-- Einstein`

### In Quote Environment (quote.tex files)
```latex
\begin{quote}
``The actual quote text here.''\\
\hspace*{\fill} --- Author Name
\end{quote}
```

## Special Names and Terms

### Product/Software Names
- **First mention**: \texttt{MATLAB}, \texttt{Mathematica}
- **Subsequent**: Can use regular text if not emphasizing code aspect

### Journal/Book Titles
- **Format**: \textit{Nature}, \textit{Physical Review Letters}
- **In references**: Follow standard bibliography style

### Technical Terms
- **First use**: \emph{quantum entanglement}
- **Subsequent**: quantum entanglement (no emphasis)

### Acronyms
- **First use**: Quantum Chromodynamics (QCD)
- **Subsequent**: QCD

## Mathematical Expressions

### Inline Math
- **Variables**: $x$, $n$, $\pi$
- **Short expressions**: $E = mc^2$

### Display Math
- **Single equations**: `\[ ... \]`
- **Multiple aligned**: `\begin{align} ... \end{align}`
- **No equation numbers**: Add `\nonumber` or use `align*`

## Lists

### Bullet Points
- **Punctuation**: End with period only if complete sentence
- **Capitalization**: Lowercase unless proper noun or complete sentence
- **Parallel structure**: Keep all items grammatically consistent

### Numbered Lists
- **When to use**: For sequences, priorities, or referenced items
- **Format**: `\begin{enumerate}` with consistent punctuation

## Special Cases

### Ellipsis
- **LaTeX**: `\ldots` (NOT `...`)
- **Example**: `The sequence continues\ldots`

### Chemical Formulas
- **Subscripts**: H\(_2\)O, CO\(_2\)
- **In text**: Use \(\) delimiters for safety

### Units
- **With numbers**: 5 km, 10 GeV (thin space between)
- **LaTeX**: `5\,km`, `10\,\text{GeV}`

### Page References
- **Format**: p. 23 (single), pp. 23--45 (range)
- **NOT**: p.23 or pp.23-45

## Consistency Rules

1. **Be consistent within each file** - If you start with one style, maintain it
2. **Follow existing chapter patterns** - Check similar usage in completed chapters
3. **Technical accuracy over style** - When in doubt, prioritize clarity
4. **No double punctuation** - Never `?'', `!'', etc.

## Common Mistakes to Avoid

- ❌ Straight quotes: "example"
- ✅ LaTeX quotes: ``example''

- ❌ Unspaced em dash: The result---surprising
- ✅ Spaced em dash: The result --- surprising

- ❌ Wrong dash for range: 1914-1918
- ✅ En dash for range: 1914--1918

- ❌ Three dots: ...
- ✅ LaTeX ellipsis: \ldots

- ❌ Hyphen for attribution: - Einstein
- ✅ Em dash attribution: --- Einstein

## References for This Guide

Based on:
- Chicago Manual of Style (scientific style)
- LaTeX best practices
- Existing usage in "Unpopular Science" chapters
- Standard physics typography conventions
