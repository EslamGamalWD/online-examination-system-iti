using ExaminationBLL.Feature.Interface;
using ExaminationBLL.ModelVM.ExamVM;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers;

public class CurrentExamController : Controller
{
    private readonly IExamRepository _examRepository;
    private readonly IQuestionRepository _questionRepository;

    public CurrentExamController(IExamRepository examRepository, IQuestionRepository questionRepository)
    {
        _examRepository = examRepository;
        _questionRepository = questionRepository;
    }

    public IActionResult ShowExam(int id)
    {
        var exam = _examRepository.GetExamById(id);
        if (exam is null)
            return NotFound();
        
        var questions = _questionRepository.GetAllQuestionsByExamId(id);
        CurrentExamViewModel currentExamViewModel = new(exam, questions);
        return View(currentExamViewModel);
    }
}