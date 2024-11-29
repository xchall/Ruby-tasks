class DataTable
	private def table=(table)
		@table = table
	end
	def initialize(table:)
		self.table = table
	end
	def get_element(n_row, n_col)
		if (n_row >=0 && n_row <= row_count-1) && (n_col >=0 && n_col <= col_count-1)
			@table[n_row][n_col]
		else 
			raise ArgumentError, "Неверный формат номера строки, или номера столбца"
		end
	end
	def col_count
		@table.size == 0 ? 0 : @table[0].size
	end
	def row_count
		@table.size
	end
end