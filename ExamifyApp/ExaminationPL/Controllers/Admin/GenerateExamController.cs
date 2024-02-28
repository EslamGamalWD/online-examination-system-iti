using ExaminationBLL.Feature.Interface;
using ExaminationBLL.ModelVM.GenerateVM;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPLL.Controllers.Admin
{
    public class GenerateExamController : Controller
    {
        private readonly IGenerateExamRepo generateExamRepo;
        public GenerateExamController(IGenerateExamRepo generateExamRepo)
        {
            this.generateExamRepo = generateExamRepo;
        }
        public IActionResult Index(int id)
        {
            var Data = generateExamRepo.Get(id);
            return View(Data);
        }
        [HttpPost]
        public IActionResult Index(GenerateExam generateExam)
        {
            if(ModelState.IsValid)
            {
                generateExamRepo.Generate(generateExam);
                return RedirectToAction("getAll", "Student");
            }
            return View(generateExam);
        }
    }
}
