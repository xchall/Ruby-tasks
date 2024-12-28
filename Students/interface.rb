
class Interface

  def read_from_file(file_path)
    raise NoImplementedError, "Реализация метода в подклассе"
  end

  def write_to_file(file_path, student_list)
    raise NoImplementedError, "Реализация метода в подклассе"
  end

end