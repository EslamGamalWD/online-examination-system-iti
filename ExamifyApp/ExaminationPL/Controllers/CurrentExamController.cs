using ExaminationDAL.Entities;
using ExaminationBLL.Feature.Interface;
using ExaminationDAL.Entities;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers;

public class CurrentExamController : Controller
{
    private readonly IExamRepository _examRepository;

    public CurrentExamController(IExamRepository examRepository)
    {
        _examRepository = examRepository;
    }

    public IActionResult Index(int id)
    {
        var exam = _examRepository.GetExamById(id);
        if (exam is null)
            return NotFound();

        return View(exam);
    }

    [HttpPost]
    public IActionResult Index(Exam exam)
    {
        try
        {
            List<int?> answers = [null, null, null, null, null, null, null, null, null, null];
            var count = 0;
            foreach (var include in exam.Includes)
            {
                if (include.StAnswer is not null)
                    answers[count] = include.StAnswer;
                count++;
            }

            _examRepository.StoreStudentExamAnswers(exam.ExId, "Jane Smith", answers[0], answers[1],
                answers[2], answers[3], answers[4], answers[5], answers[6], answers[7], answers[8],
                answers[9]);

            _examRepository.CorrectExam(exam.ExId, "Emily White");
        }
        catch (Exception e)
        {
            Exam? showedExam = _examRepository.GetExamById(exam.ExId);
            return View(showedExam);
        }
        
        return RedirectToAction("Index","Result");
    }
}