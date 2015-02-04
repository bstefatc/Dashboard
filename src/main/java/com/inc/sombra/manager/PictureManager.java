package com.inc.sombra.manager;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.inc.sombra.dao.IPictureDao;
import com.inc.sombra.entity.Picture;

@Service
public class PictureManager implements IPictureManager {

	@Autowired
	private IPictureDao pictureDao;

	@Override
	@Transactional
	public void save(Picture picture) {
		pictureDao.save(picture);
	}

	@Override
	@Transactional
	public List<Picture> getAll() {
		return pictureDao.findAll();
	}

	@Override
	public Picture findPictureById(Integer id) {
		return pictureDao.findOne(id);
	}

	// @Override
	// public Page<Picture> picturePage(Integer pageNumber, Integer countItems)
	// {
	// // TODO Auto-generated method stub
	// PageRequest request = new PageRequest(pageNumber - 1, countItems);
	// return pictureDao.queryPicturePage(request);
	// }

}
