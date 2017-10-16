package com.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mapper.AddressMapper;
import com.boot.pojo.Address;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	public AddressMapper addressMapper;

	

	@Override
	public void addAddress(Address address) {
		addressMapper.setAddrZero(address.getUserId());
		addressMapper.addAddress(address);
	}



	@Override
	public List<Address> findAllbyUserId(String userId) {
		return addressMapper.findAllbyUserId(userId);
	}



	@Override
	public void deleteAddressbyReceivedId(String[] receiveId) {
		addressMapper.deleteAddressbyReceivedId(receiveId);
		
	}



	@Override
	public Address findAddressByReceiveId(String receiveId) {
		return addressMapper.findAddressByReceiveId(receiveId);
	}

}
