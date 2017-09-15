package br.com.fiap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.fiap.dao.PetiscoDAO;
import br.com.fiap.model.Petisco;

@Controller
@RequestMapping("/petisco")
public class PetiscoController {

	@Autowired
	private PetiscoDAO dao;
	
	@GetMapping("listar")
	public ModelAndView listagem(){
		ModelAndView retorno = new ModelAndView("petisco/lista");
		retorno.addObject("lista",dao.listar());
		return retorno;
	}
	
	@GetMapping("cadastrar")
	public String abrirForm(){
		return "petisco/cadastro";
	}
	
	@Transactional
	@PostMapping("cadastrar")
	public ModelAndView processaForm(Petisco petisco){
		dao.cadastrar(petisco);
		//Endereco da controller para fazer o redirect
		ModelAndView retorno = 
				new ModelAndView("redirect:/petisco/listar");
		retorno.addObject("msg","Cadastrado com sucesso!");
		return retorno;
	}
	
}






