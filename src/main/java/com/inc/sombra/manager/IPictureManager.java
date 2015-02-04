package com.inc.sombra.manager;

import java.util.List;

//import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import com.inc.sombra.entity.Picture;

@Component
public interface IPictureManager {
	public void save(Picture picture);

	public List<Picture> getAll();

	public Picture findPictureById(Integer id);
	// public Page<Picture> picturePage(Integer pageNumber, Integer countItems);
}
