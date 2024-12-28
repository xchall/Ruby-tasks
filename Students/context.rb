require_relative "students_list"
require_relative "students_list_yaml"
require_relative "students_list_json"
class Context
  def initialize(studenlist)
    @strategy = studenlist
  end

  # Возможность изменить стратегию на ходу
  def strategy=(studenlist)
    @strategy = studenlist #оьъект класса StudentsListYaml или StudentsListJson
  end

  # Выполняет стратегию
  def execute_strategy_read(file_path)
    @strategy.read_from_file(file_path)
  end
  def execute_strategy_write(file_path)
    @strategy.write_to_file(file_path)
  end
end

context = Context.new(StudentsListJson.new)
puts "Read json: "
context.execute_strategy_read("testing_json.json")

puts "Write json: "
context.execute_strategy_write("output_json.json")

# Замена стратегии
context.strategy = StudentsListYaml.new
puts "Read yaml: "
context.execute_strategy_read("testing_json.json")

puts "Write yaml: "
context.execute_strategy_write("output_yaml.yaml")