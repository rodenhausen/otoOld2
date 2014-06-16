package edu.arizona.biosemantics.oto.oto.shared.model;
public class TermTreeNode extends TextTreeNode {

	private Term term;

	public TermTreeNode(Term term) {
		this.term = term;
	}
	
	@Override
	public String getText() {
		return term.getTerm();
	}

	public Term getTerm() {
		return term;
	}
	
}