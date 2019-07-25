import java.util.ArrayList;
import java.util.List;

class ProteinTranslator {

  private static final int CODON_LEN = 3;

  List<String> translate(String rna) {
    List<String> results = new ArrayList<>();

    for (int i=0; i < rna.length(); i += CODON_LEN) {
      String codon = rna.substring(i, i + CODON_LEN);
      String protein = match(codon);
      if ("STOP".equals(protein)) {
        return results;
      }
      results.add(protein);
    }

    return results;
  }

  private String match(String candidate) {
    switch (candidate) {
      case "AUG":
        return "Methionine";
      case "UUU":
      case "UUC":
          return "Phenylalanine";
      case "UUA":
      case "UUG":
          return "Leucine";
      case "UCU":
      case "UCC":
      case "UCA":
      case "UCG":
          return "Serine";
      case "UAU":
      case "UAC":
          return "Tyrosine";
      case "UGU":
      case "UGC":
          return "Cysteine";
      case "UGG":
          return "Tryptophan";
      case "UAA":
      case "UAG":
      case "UGA":
          return "STOP";
      default:
          throw new RuntimeException("Bad input");
    }
  }
}
