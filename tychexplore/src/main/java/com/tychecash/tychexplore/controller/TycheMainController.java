package com.tychecash.tychexplore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tychecash.tychexplore.model.response.BlockResponse;
import com.tychecash.tychexplore.service.TycheExploreService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author jithin
 */
@Controller
public class TycheMainController {

    @Autowired
    private TycheExploreService tycheExploreService;
    
    @RequestMapping("/")
    public String showHome(Model model) {
    	BlockResponse lastBlockResponse = tycheExploreService.getLastBlockResponse();
		Integer lastBlockHeight = lastBlockResponse.getResult().getBlock_header().getHeight();
		Integer totalPages = lastBlockHeight / 10;
		model.addAttribute("totalPages", totalPages);
        return "index";
    }
}
