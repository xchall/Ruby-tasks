require_relative "html_tree"
require_relative "tag"

parsed_tree = HtmlTree.from_html('<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Пример HTML с атрибутами style</title>
</head>
<body>

    <h1>Добро пожаловать на мой сайт</h1>
    
    <p style="color: #333333; font-size: 18px;">
        Это пример простого HTML-документа. Этот абзац имеет стили.
    </p>
    
    <div>
        <h2 style="color: #4caf50;">Пример блока</h2>
        <p>Этот блок не имеет стилей, за исключением заголовка.</p>
    </div>

    <ul>
        <li style="font-weight: bold;">Элемент списка 1 (жирный текст)</li>
        <li>Элемент списка 2</li>
        <li>Элемент списка 3</li>
    </ul>

    <a href="#" style="text-decoration: none; color: #e91e63;">Ссылка без подчеркивания</a>

</body>
</html>')

# puts "parsed_html to_html:\n\n#{parsed_tree.to_html}"

puts "\nВсе теги содержащие хотя бы 1 ребенка :\n\n"

parsed_tree.depth_search {|current_tag| puts "#{current_tag.to_s}" if current_tag.has_children}

puts "\nВсе теги содержащие атрибут style в html:\n\n"

parsed_tree.breadth_search {|current_tag| puts "#{current_tag.to_s}" if current_tag.has_style}


puts "\nКоличество детей, обходом в щирину #{}:\n\n"
parsed_tree.breadth_search {|current_tag| puts "#{current_tag.children_amount}, #{current_tag.to_s}"}