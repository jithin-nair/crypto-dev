/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.service;

import com.tychecash.tychexplore.model.ResponseVO;
import com.tychecash.tychexplore.model.response.BlockResponse;

/**
 *
 * @author jithin
 */
public interface TycheExploreService {
	public BlockResponse getBlockResponseByHeight(Integer height);

	public BlockResponse getBlockResponseByHash(String hash);

        public BlockResponse getFirstBlockResponse();
        
	public BlockResponse getLastBlockResponse();

	public ResponseVO getLastNBlockResponseFromHeight(Integer height, Integer pageNumber, Integer size);
        
        public ResponseVO getBlockSamples(Integer samplingRate);
}
