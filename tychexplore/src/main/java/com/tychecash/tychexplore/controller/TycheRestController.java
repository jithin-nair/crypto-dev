/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tychecash.tychexplore.model.response.BlockResponse;
import com.tychecash.tychexplore.service.TycheExploreService;

/**
 *
 * @author jithin
 */
@RestController
public class TycheRestController {
    
    @Autowired
    private TycheExploreService tycheExploreService;
    
    @GetMapping("/getRecentBlocks")
	public List<BlockResponse> getRecentBlocks() {
		BlockResponse lastBlockResponse = tycheExploreService.getLastBlockResponse();
		Integer lastBlockHeight = lastBlockResponse.getResult().getBlock_header().getHeight();
		List<BlockResponse> blockResponses = tycheExploreService.getLastNBlockResponseFromHeight(lastBlockHeight, 10);
		return blockResponses;
	}
    
}
