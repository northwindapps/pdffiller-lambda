from pdf2image import convert_from_path

# Convert all pages
images = convert_from_path('/Users/yano/Documents/react_receipt_reader/お申込書.pdf', dpi=300)

# Save as PNG
for i, img in enumerate(images):
    img.save(f'page_{i+1}.png', 'PNG')
