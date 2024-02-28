using ExaminationBLL.ModelVM.CourseVM;
using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Feature.Repository;
using ExaminationBLL.ModelVM.CourseVM;
using Microsoft.AspNetCore.Mvc;

namespace ExaminationPL.Controllers
{
    public class CourseController : Controller
    {
        private readonly ICourseRepo courseRepo;
        public CourseController(ICourseRepo _courseRepo)
        {
            courseRepo = _courseRepo;
        }
        public IActionResult getAll()
        {
            var Data = courseRepo.GetAll();
            return View(Data);
        }
        public IActionResult DeleteCourse(int id)
        {
            courseRepo.DeleteCourse(id);
            return RedirectToAction("getAll");
        }
        [HttpGet]
        public IActionResult EditCourse(int id)
        {
           var Data = courseRepo.getCourseById(id);
            EditCourseVM editCourseVM = new EditCourseVM()
            {
                CrsId = Data.CrsId,
                CrsDuration =(int) Data.CrsDuration,
                CrsName = Data.CrsName,
            };
            return View(editCourseVM);

        }
        [HttpPost]
        public IActionResult EditCourse(EditCourseVM editCourseVM)
        {
            //2 
            if(ModelState.IsValid) 
            {
                courseRepo.EditCourse(editCourseVM);
                return RedirectToAction("getAll");
            }
            return View(editCourseVM);

        }
        public IActionResult getCourseById(int id)
        {
            var Data = courseRepo.getCourseById(id);
            return View(Data);
        }

        [HttpGet]
        public IActionResult InsertCourse(int id)
        {
            return View();
        }
        [HttpPost]
        public IActionResult InsertCourse(InsertCourseVM model)
        {
            //2 
            if (ModelState.IsValid)
            {
                courseRepo.InsertCourse(model);
                return RedirectToAction("getAll");
            }
            return View(model);

        }
    }
}
