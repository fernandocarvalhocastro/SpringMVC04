package br.com.fiap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.fiap.dao.CervejaDAO;
import br.com.fiap.exception.IdNotFoundException;
import br.com.fiap.model.Cerveja;

@Controller
@RequestMapping("/cerveja")
public class CervejaController {
	
	@Autowired //Injeção de dependencia
	private CervejaDAO dao;
	//private static List<Cerveja> lista = new ArrayList<>();

	@GetMapping("cadastrar")
	public String abrirForm(){
		return "cerveja/cadastro";
	}
	
	@GetMapping("editar/{id}")
	public ModelAndView abrirFormEdicao(@PathVariable("id") int id){
		Cerveja cerveja = dao.pesquisar(id);
		ModelAndView retorno = new ModelAndView("cerveja/edicao");
		retorno.addObject("cerveja", cerveja);
		return retorno;
	}
	
	@Transactional
	@PostMapping("editar")
	public ModelAndView editar(Cerveja cerveja , RedirectAttributes redirect){
		dao.alterar(cerveja);
		ModelAndView retorno = new ModelAndView("redirect:/cerveja/listar");
		redirect.addFlashAttribute("msg","Alterado com sucesso");
		return retorno;
	}
	
	@Transactional
	@PostMapping("excluir")
	public ModelAndView apagar(int codigo , RedirectAttributes redirect){
		ModelAndView retorno = new ModelAndView("redirect:/cerveja/listar");
		try {
			dao.remover(codigo);
			redirect.addFlashAttribute("msg", "Removido com sucesso!");
		} catch (IdNotFoundException e) {
			// TODO Auto-generated catch block
			redirect.addFlashAttribute("msg", "Falha ao remover!");
			e.printStackTrace();
		}
		return retorno;
	}
	
	@Transactional
	@PostMapping("cadastrar")
	public ModelAndView processarForm(Cerveja cerveja, RedirectAttributes redirect){
		//lista.add(cerveja);
		dao.cadastrar(cerveja);
		ModelAndView retorno = new ModelAndView("redirect:/cerveja/listar");
		redirect.addFlashAttribute("msg","Cadastrado!");
		//retorno.addObject("c", cerveja);
		return retorno;
	}
	
	@GetMapping("listar")
	public ModelAndView listagem(){
		ModelAndView retorno = 
				new ModelAndView("cerveja/lista");
		retorno.addObject("lista",dao.listar());
		return retorno;
	}
	
	
}

