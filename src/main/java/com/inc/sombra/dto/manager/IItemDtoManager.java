package com.inc.sombra.dto.manager;

import org.springframework.stereotype.Component;

import com.inc.sombra.dto.model.ItemDto;

@Component
public interface IItemDtoManager {
	public ItemDto createHomeDto(Integer pictureId);
}
