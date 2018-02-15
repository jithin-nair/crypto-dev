/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import com.tychecash.tychexplore.service.TycheExploreService;

/**
 *
 * @author jithin
 */
@RestController
public class TycheRestController {
    
    @Autowired
    private TycheExploreService tycheExploreService;
    
    
    
}
