using ExaminationBLL.Feature.Interface;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers
{
    public class ExamController : Controller
    {
        private readonly IExamRepo examRepo;
        public ExamController(IExamRepo _examRepo)
        {
            examRepo = _examRepo;
        }
        public IActionResult getAll()
        {
            var Data = examRepo.GetAllExam();
            return View(Data);
        }

        public IActionResult getExamById(int id)
        {
            var data = examRepo.GetExamById(id);
            return View(data);
        }

        public IActionResult DeleteExam(int id)
        {
            examRepo.DeleteExam(id);
            return RedirectToAction("getAll");
        }
    }
}
