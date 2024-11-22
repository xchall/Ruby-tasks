class DataTable
	private def table=(table:)
		@table = table
	end
	def initialize(table:)
		self.table = table
	end
	def get_element(n_row, n_col)
		@table[n_row][n_col]
	end
	def col_count
		if @table.size == 0 ? 0 : @table[0].size
	end
	def row_count
		@table.size
	end
end