class Hamming {

	def distance(strand1, strand2) {
		if (strand1.length() != strand2.length()) throw new ArithmeticException()
		[strand1.chars, strand2.chars].transpose().count { a, b -> a != b }
	}

}
