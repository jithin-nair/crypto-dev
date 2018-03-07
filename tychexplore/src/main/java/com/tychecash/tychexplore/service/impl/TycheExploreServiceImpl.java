/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tychecash.tychexplore.service.impl;

import com.tychecash.tychexplore.config.TycheExploreConfig;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.tychecash.tychexplore.model.ResponseVO;
import com.tychecash.tychexplore.model.request.BlockRequest;
import com.tychecash.tychexplore.model.request.Params;
import com.tychecash.tychexplore.model.response.BlockHeader;
import com.tychecash.tychexplore.model.response.BlockResponse;
import com.tychecash.tychexplore.service.TycheExploreService;
import com.tychecash.tychexplore.util.BlockUtil;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author jithin
 */
@Component
public class TycheExploreServiceImpl implements TycheExploreService {

    @Autowired
    TycheExploreConfig tycheExploreConfig;

    @Override
    public BlockResponse getBlockResponseByHeight(Integer height) {
        BlockRequest blockRequest = new BlockRequest();
        blockRequest.setId("self");
        blockRequest.setJsonrpc("2.0");
        blockRequest.setMethod("getblockheaderbyheight");
        Params params = new Params();
        params.setHeight(height);
        blockRequest.setParams(params);
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        String uri = tycheExploreConfig.getRpcServerUrl();
        BlockResponse blockResponse = restTemplate.postForObject(uri, blockRequest, BlockResponse.class);
        System.out.println("Input : " + blockRequest.toString());
        System.out.println("output : " + blockResponse.toString());
        return blockResponse;
        // Tools | Templates.
    }

    @Override
    public BlockResponse getBlockResponseByHash(String hash) {
        BlockRequest blockRequest = new BlockRequest();
        blockRequest.setId("self");
        blockRequest.setJsonrpc("2.0");
        blockRequest.setMethod("getblockheaderbyhash");
        Params params = new Params();
        params.setHash(hash);
        blockRequest.setParams(params);
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        String uri = tycheExploreConfig.getRpcServerUrl();
        BlockResponse blockResponse = restTemplate.postForObject(uri, blockRequest, BlockResponse.class);
        System.out.println("Input : " + blockRequest.toString());
        System.out.println("output : " + blockResponse.toString());
        return blockResponse;

    }

    @Override
    public BlockResponse getFirstBlockResponse() {
        return getBlockResponseByHeight(0);
    }

    @Override
    public BlockResponse getLastBlockResponse() {
        BlockRequest blockRequest = new BlockRequest();
        blockRequest.setId("self");
        blockRequest.setJsonrpc("2.0");
        blockRequest.setMethod("getlastblockheader");
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        String uri = tycheExploreConfig.getRpcServerUrl();
        BlockResponse blockResponse = restTemplate.postForObject(uri, blockRequest, BlockResponse.class);
        System.out.println("Input : " + blockRequest.toString());
        System.out.println("output : " + blockResponse.toString());
        return blockResponse;
    }

    @Override
    public ResponseVO getLastNBlockResponseFromHeight(Integer height, Integer pageNumber, Integer size) {
        ResponseVO responseVO = new ResponseVO();
        List<BlockResponse> blockResponses = new ArrayList<BlockResponse>();
        String uri = tycheExploreConfig.getRpcServerUrl();
        BlockRequest blockRequest = new BlockRequest();
        blockRequest.setId("self");
        blockRequest.setJsonrpc("2.0");
        blockRequest.setMethod("getblockheaderbyheight");
        Params params = new Params();
        for (int i = 0; i < size; i++) {
            Integer curHeight = (height - (size * pageNumber)) - i;
            if (curHeight > -1) {
                params.setHeight(curHeight);
                blockRequest.setParams(params);
                RestTemplate restTemplate = new RestTemplate();
                restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
                BlockResponse blockResponse = restTemplate.postForObject(uri, blockRequest, BlockResponse.class);
                blockResponses.add(blockResponse);
                System.out.println("Input : " + blockRequest.toString());
                System.out.println("output : " + blockResponse.toString());
            }
        }
        List<BlockHeader> blockHeaders = new ArrayList<>();
        for (BlockResponse blockResponse : blockResponses) {
            if (blockResponse.getResult().getStatus().equalsIgnoreCase("OK")) {
                blockHeaders.add(blockResponse.getResult().getBlock_header());
            }
        }
        responseVO.setId(blockRequest.getId());
        responseVO.setJsonrpc(blockRequest.getJsonrpc());
        responseVO.setBlockHeaders(blockHeaders);
        responseVO.setStatus("SUCCESS");
        return responseVO;
    }

    @Override
    public ResponseVO getBlockSamples(Integer samplingRate) {
        ResponseVO responseVO = new ResponseVO();
        BlockResponse lastBlockResponse = getLastBlockResponse();
        Integer lastBlockHeight = lastBlockResponse.getResult().getBlock_header().getHeight();
        List<Integer> blockSamples = BlockUtil.getAllBlockSamples(samplingRate, lastBlockHeight);
        List<BlockResponse> blockResponses = new ArrayList<BlockResponse>();
        String uri = tycheExploreConfig.getRpcServerUrl();
        BlockRequest blockRequest = new BlockRequest();
        blockRequest.setId("self");
        blockRequest.setJsonrpc("2.0");
        blockRequest.setMethod("getblockheaderbyheight");
        Params params = new Params();
        for (Integer blockHeight : blockSamples) {
            if (blockHeight > 0) {
                params.setHeight(blockHeight);
                blockRequest.setParams(params);
                RestTemplate restTemplate = new RestTemplate();
                restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
                BlockResponse blockResponse = restTemplate.postForObject(uri, blockRequest, BlockResponse.class);
                blockResponses.add(blockResponse);
                System.out.println("Input : " + blockRequest.toString());
                System.out.println("output : " + blockResponse.toString());
            }
        }
        List<BlockHeader> blockHeaders = new ArrayList<>();
        for (BlockResponse blockResponse : blockResponses) {
            if (blockResponse.getResult().getStatus().equalsIgnoreCase("OK")) {
                blockHeaders.add(blockResponse.getResult().getBlock_header());
            }
        }
        responseVO.setId(blockRequest.getId());
        responseVO.setJsonrpc(blockRequest.getJsonrpc());
        responseVO.setBlockHeaders(blockHeaders);
        responseVO.setStatus("SUCCESS");
        return responseVO;
    }

}
