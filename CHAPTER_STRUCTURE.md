# Chapter Structure Reference

**EXACTLY 10 pages per chapter**

## Page Layout Structure

### 1. **Big Title** (1 page)
- **Position**: Recto (right-hand page)
- **Content**: Large chapter title page

### 2. **Side Note** (1 page) 
- **Position**: Verso (left-hand page)
- **Content**: Sidenote content

### 3. **Title + Summary + Topicmap + Quote** (1 page)
- **Position**: Recto (right-hand page)
- **Content**: 
  - Chapter title
  - Summary paragraph
  - Topic map (tag words)
  - Opening quote

### 4. **Historical + Main** (3-5 pages)
- **Content**: 
  - Historical context section
  - Main chapter content
- **Length**: Variable based on extra content inclusion

### 5. **Technical** (1 page)
- **Content**: Hardcore analysis section with equations and derivations

### 6. **Extra Content** (0-2 pages)
- **Content**: One of:
  - Exercise (`exercises.tex`)
  - Image figure (`imagefigure.tex`) 
  - Joke (`joke.tex`)
  - Cartoon (`cartoon.tex`)
- **Length**: 0-2 pages depending on inclusion

### 7. **Empty Page** (1 page)
- **Position**: Verso (left-hand page)
- **Content**: Blank page for chapter separation

---

**Total**: Exactly 10 pages per chapter
**Target Book Length**: 50 chapters × 10 pages = 500 pages

## File Structure Mapping

Each chapter directory contains:
- `title.tex` → Big Title (page 1)
- `sidenote.tex` → Side Note (page 2)  
- `title.tex` + `summary.tex` + `topicmap.tex` + `quote.tex` → Combined page (page 3)
- `historical.tex` + `main.tex` → Historical + Main (pages 4-8, variable)
- `technical.tex` → Technical (page 9)
- `exercises.tex`/`imagefigure.tex`/`joke.tex`/`cartoon.tex` → Extra Content (pages 8-9, if included)
- Empty page → Separator (page 10)

*Updated: 2025-08-21*
