package edu.arizona.biosemantics.oto.oto.client.categorize;

import java.util.LinkedList;
import java.util.List;

import com.sencha.gxt.data.shared.TreeStore;
import com.sencha.gxt.dnd.core.client.DndDropEvent;
import com.sencha.gxt.widget.core.client.container.CardLayoutContainer;
import com.sencha.gxt.widget.core.client.tree.Tree;

import edu.arizona.biosemantics.oto.oto.client.categorize.CategorizeView.LabelTreeNode;
import edu.arizona.biosemantics.oto.oto.client.categorize.CategorizeView.TermsView;
import edu.arizona.biosemantics.oto.oto.shared.model.Term;
import edu.arizona.biosemantics.oto.oto.shared.model.TermTreeNode;

public class DndDropEventExtractor {

	public static List<Term> getTerms(DndDropEvent event) {
		List<Term> terms = new LinkedList<Term>();
		Object data = event.getData();
		if (data != null) {
			if (data instanceof List<?>) {
				for (Object element : (List<?>) data) {
					// drags from tree are of form treeNode, either from west or
					// another portlet
					if (element instanceof TreeStore.TreeNode<?>) {
						TreeStore.TreeNode<?> treeNode = (TreeStore.TreeNode<?>) element;

						// drags from west panel, only location of
						// labelTreeNodes
						if (treeNode.getData() instanceof LabelTreeNode) {
							LabelTreeNode labelTreeNode = (LabelTreeNode) treeNode
									.getData();
							terms.addAll(labelTreeNode.getLabel()
									.getTerms());
						}
						if (treeNode.getData() instanceof TermTreeNode) {
							TermTreeNode termTreeNode = (TermTreeNode) treeNode
									.getData();
							terms.add(termTreeNode.getTerm());
							return terms;
						}
					}
					// drags from listView are of Term
					if (element instanceof Term) {
						terms.add((Term) element);
					}

					// possibly still needed e.g. if from the inside the tree a
					// synonym is dropped on the portlet to remove synonymy and
					// add it as a main term
					/*
					 * if(element instanceof TermTreeNode) { TermTreeNode
					 * termTreeNode = (TermTreeNode)element;
					 * portletStore.add(new
					 * MainTermTreeNode(termTreeNode.getTerm())); } if(element
					 * instanceof CategoryTreeNode) { CategoryTreeNode
					 * categoryTreeNode = (CategoryTreeNode)element;
					 * 
					 * for(Term term :
					 * categoryTreeNode.getCategory().getTerms()) {
					 * portletStore.add(new MainTermTreeNode(term)); } }
					 */
				}
			}
		}
		return terms;
	}
	
	public static boolean isSourceLabelPortlet(DndDropEvent event) {
		if(event.getTarget() instanceof Tree) {
			Tree tree = (Tree)event.getTarget();
			if(tree.getParent() instanceof LabelPortlet) {
				return true;
			}
		}
		return false;
	}
	
	public static boolean isSourceCategorizeView(DndDropEvent event) {
		if(event.getTarget() instanceof Tree) {
			Tree tree = (Tree)event.getTarget();
			if(tree.getParent() instanceof CardLayoutContainer) {
				return true;
			}
		}
		return false;
	}
	
	public static LabelPortlet getLabelPortletSource(DndDropEvent event) {
		return (LabelPortlet)event.getTarget().getParent();
	}
	
	public static TermsView getTermsViewSource(DndDropEvent event) {
		return (TermsView)event.getTarget().getParent().getParent();
	}
	
}
