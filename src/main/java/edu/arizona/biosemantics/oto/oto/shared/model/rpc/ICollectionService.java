package edu.arizona.biosemantics.oto.oto.shared.model.rpc;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

import edu.arizona.biosemantics.oto.oto.shared.model.Collection;


/**
 * The client side stub for the RPC service.
 */
@RemoteServiceRelativePath("collection")
public interface ICollectionService extends RemoteService {
	
	public Collection get(Collection collection) throws Exception;

}
