/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.service;

import java.util.List;

import com.tychecash.tychexplore.model.response.BlockResponse;

/**
 *
 * @author jithin
 */
public interface TycheExploreService {
    public BlockResponse getBlockResponseByHeight(String height);
    public BlockResponse getBlockResponseByHash(String hash);
    public BlockResponse getLastBlockResponse();
    public List<BlockResponse> getLastNBlockResponseFromHeight(Integer height,Integer size);
}
