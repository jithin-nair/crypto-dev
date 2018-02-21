/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.service.impl;

import org.springframework.stereotype.Component;

import com.tychecash.tychexplore.model.request.BlockRequest;
import com.tychecash.tychexplore.model.response.BlockResponse;
import com.tychecash.tychexplore.service.TycheExploreService;

/**
 *
 * @author jithin
 */
@Component
public class TycheExploreServiceImpl implements TycheExploreService {

	@Override
	public BlockResponse getBlockResponseByHeight(String height) {
		throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
																		// Tools | Templates.
	}

	@Override
	public BlockResponse getBlockResponseByHash(String hash) {
		throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
																		// Tools | Templates.
	}

	@Override
	public BlockResponse getLastBlockResponse() {
		BlockResponse blockResponse = null;
		BlockRequest blockRequest = new BlockRequest();
		blockRequest.setId("self");
		blockRequest.setJsonrpc("2.0");
		blockRequest.setMethod("getlastblockheader");
		return blockResponse;
	}

	@Override
	public BlockResponse getLastNBlockResponseFromHeight(String height, Integer size) {
		throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
																		// Tools | Templates.
	}

}
