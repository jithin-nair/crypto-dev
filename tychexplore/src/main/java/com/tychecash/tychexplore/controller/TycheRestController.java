/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tychecash.tychexplore.model.ResponseVO;
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
	public ResponseVO getRecentBlocks(@RequestParam("filterslength") Integer filterslength,
			@RequestParam("pagenum") Integer pagenum, @RequestParam("pagesize") Integer pagesize) {
		BlockResponse lastBlockResponse = tycheExploreService.getLastBlockResponse();
		Integer lastBlockHeight = lastBlockResponse.getResult().getBlock_header().getHeight();
		ResponseVO responseVO = tycheExploreService.getLastNBlockResponseFromHeight(lastBlockHeight,pagenum, pagesize);
		return responseVO;
	}

}
