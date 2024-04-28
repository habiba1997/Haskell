import re

def create_table_of_contents(markdown_file):
    toc = []
    headers = []
    with open(markdown_file, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    # Regex to match markdown headers
    header_pattern = r'^(#{1,3})\s+(.*)'

    # Process each line to find headers and create ToC entries
    for line in lines:
        match = re.match(header_pattern, line.strip())
        if match:
            level = len(match.group(1))  # Level of header based on number of '#'
            header_text = match.group(2).strip()
            # Create a slug from header text for linking
            slug = re.sub(r'\s+', '-', header_text.lower())
            slug = re.sub(r'[^\w\-]+', '', slug)
            slug = slug.strip('-')  # Remove leading/trailing dashes
            headers.append((level, header_text, slug))
            indent = '  ' * (level - 1)
            toc.append(f"{indent}- [{header_text}](#{slug})")

    # Create the ToC string
    toc_string = '\n'.join(toc) + '\n'

    # Insert ToC after possible front matter
    front_matter_end = 0
    if lines and lines[0].startswith('---'):
        # Assuming front matter ends after the second '---'
        front_matter_end = lines.index('---\n', 1) + 1
    
    # Include ToC in the file
    output_lines = lines[:front_matter_end] + [toc_string] + lines[front_matter_end:]
    return output_lines, headers

def update_markdown_file(markdown_file):
    content, headers = create_table_of_contents(markdown_file)
    with open(markdown_file, 'w', encoding='utf-8') as file:
        file.writelines(content)

    return headers

# Example usage
markdown_path = 'Haskell-Helper.md'
headers = update_markdown_file(markdown_path)
print("Table of contents updated. Headers found:")
for level, header, slug in headers:
    print(f"Level {level}: {header} -> #{slug}")
