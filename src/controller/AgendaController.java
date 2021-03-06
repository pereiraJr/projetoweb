package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AgendaDAO;
import dao.MedicoDAO;
import dao.PacienteDAO;
import model.Agenda;
import model.Medico;
import model.Paciente;

@WebServlet("/AgendaController")
public class AgendaController extends HttpServlet{

	private AgendaDAO dao;
	private static final long serialVersionUID = 1L;
	public static final String INSERIR = "/agenda.jsp";
	public static final String LISTAR_AGENDA = "/agenda.jsp";
	public static final String EDITAR = "/agenda.jsp";

	public AgendaController() {
		dao = new AgendaDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String forward = "";
		String action = request.getParameter("action");

		if(action.equalsIgnoreCase("deletar")) {
			forward = LISTAR_AGENDA;
			int agendaId = Integer.parseInt(request.getParameter("agendaId"));
			dao.excluir(agendaId);
			request.setAttribute("agendas", dao.listarTodos());
		}
		else if(action.equalsIgnoreCase("editar")) {
			forward = EDITAR;
			int agendaId = Integer.parseInt(request.getParameter("agendaId"));
			Agenda agenda = dao.buscarPorId(agendaId);
			request.setAttribute("agenda", agenda);
			
			PacienteDAO pacienteDAO = new PacienteDAO();
			request.setAttribute("pacientes", pacienteDAO.listarTodos());

			MedicoDAO medicoDAO = new MedicoDAO();
			request.setAttribute("medicos", medicoDAO.listarTodos());
		}
		else if(action.equalsIgnoreCase("inserir")) {
			forward = INSERIR;
		}
		else {
			forward = LISTAR_AGENDA;
			request.setAttribute("agendas", dao.listarTodos());

			PacienteDAO pacienteDAO = new PacienteDAO();
			request.setAttribute("pacientes", pacienteDAO.listarTodos());

			MedicoDAO medicoDAO = new MedicoDAO();
			request.setAttribute("medicos", medicoDAO.listarTodos());
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Agenda agenda = new Agenda();
		String agendaId = request.getParameter("agendaId");

		Paciente paciente = new Paciente();
		paciente.setPacienteId(Integer.parseInt(request.getParameter("slPaciente")));
		agenda.setPaciente(paciente);

		Medico medico = new Medico();
		medico.setMedicoId(Integer.parseInt(request.getParameter("slMedico")));
		agenda.setMedico(medico);
		
		agenda.setData(request.getParameter("data"));
		agenda.setHora(request.getParameter("hora"));

		if(agendaId == null || agendaId.isEmpty())
			dao.adicionar(agenda);
		else {
			agenda.setAgendaId(Integer.parseInt(agendaId));
			dao.alterar(agenda);
		}
		response.sendRedirect("AgendaController.do?action=");
	}
}