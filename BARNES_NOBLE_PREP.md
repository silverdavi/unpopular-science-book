# Barnes & Noble Print Preparation

## Book Specifications
- **Trim Size**: 7" × 10"
- **Page Count**: ~515 pages (50 chapters × 10 pages + front matter)
- **Spine Width**: 1.29" (calculated for cream paper at 0.0025" per page)
- **Cover Size**: 15.54" × 10.25" (includes front, back, spine, and 0.125" bleeds)

## Files Created
1. **Interior PDF**: `main_interior_BN.tex` → `main_interior_BN.pdf`
   - No cover page (removed)
   - Starts with academic title page
   - All chapters properly formatted with verso/recto alignment
   - Each chapter is exactly 10 pages

2. **Cover PDF**: `cover/cover_refined.tex` → `cover/cover_refined.pdf`
   - Wraparound cover with front, spine, and back
   - Includes 0.125" bleeds on all sides
   - Spine width adjusted to 1.29" for page count
   - Spine centered on page, with back cover on left and front cover on right
   - High-resolution background image required: `cover_wrap_hires.png`

## To Compile
Run: `./compile_BN.sh`

This will generate both PDFs needed for Barnes & Noble Press upload.

## Upload Instructions
1. Go to Barnes & Noble Press
2. Upload interior PDF separately from cover PDF
3. Select "Cream" paper type (standard)
4. Verify spine width matches (1.29")
5. Review digital proof carefully

## Important Notes
- The `openany` option ensures chapters can start on any page (not just recto)
- With 10-page chapters, pagination should work correctly
- Front matter uses `\frontmatter` and main content uses `\mainmatter`
- Cover fonts require XeLaTeX compilation

## Cover Image Requirements
The cover template expects: `cover/cover_wrap_hires.png`
- Resolution: At least 300 DPI
- Size: 15.54" × 10.25" (4662 × 3075 pixels at 300 DPI)
- Must include full wraparound design (back, spine, front)
- Ensure critical elements are within safe zones (away from edges and spine)
- Image must be properly centered with no extra white space or margins
- If image appears shifted, check that the PNG has no transparent areas at edges

## Troubleshooting Cover Issues
If the cover appears shifted or cut off:
1. Test without background: Comment out the `\includegraphics` line
2. Check image dimensions: Should be exactly 4662 × 3075 pixels
3. Verify no extra margins in the PNG file
4. Use `cover_noimage.tex` to test text positioning without background
