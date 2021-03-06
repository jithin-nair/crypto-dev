package com.tychecash.tychexplore.controller;

import com.tychecash.tychexplore.model.response.BlockResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tychecash.tychexplore.service.TycheExploreService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(Model model) {
        return "index";
    }

    @RequestMapping(value = "/block/{hash}", method = RequestMethod.GET)
    public ModelAndView foo(ModelAndView modelAndView, @PathVariable("hash") String hash) {
        try {
            BlockResponse blockResponse = tycheExploreService.getBlockResponseByHash(hash);
            modelAndView.addObject("bHeight", blockResponse.getResult().getBlock_header().getHeight());
            modelAndView.addObject("bHash", blockResponse.getResult().getBlock_header().getHash());
            modelAndView.addObject("bFound", blockResponse.getResult().getBlock_header().getTimestamp());
            modelAndView.addObject("bDifficulty", blockResponse.getResult().getBlock_header().getDifficulty());
            modelAndView.addObject("bReward", blockResponse.getResult().getBlock_header().getReward());
            modelAndView.addObject("bStatus", (blockResponse.getResult().getBlock_header().getOrphan_status().equalsIgnoreCase("true")) ? "Orphaned" : "Not Orphaned");
            modelAndView.addObject("bPrevious", blockResponse.getResult().getBlock_header().getPrev_hash());
            modelAndView.setViewName("search");
        } catch (RuntimeException ex) {
            modelAndView.addObject("message", "Nothing in the blockchain has been found that matches the search"
                    + "<br>Note: There might be some delay for latest details to be found");
            modelAndView.setViewName("invalid");
        }
        return modelAndView;
    }
}
