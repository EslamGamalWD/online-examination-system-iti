using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Feature.Repository;
using ExaminationBLL.Helper;
using ExaminationBLL.ModelVM.StudentVM;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Examination.PL.Controllers.Admin
{
    public class StudentController : Controller
    {
        private readonly IStudentRepo _studentRepo;
        private readonly IDepartmentRepo departmentRepo;

        public StudentController(IStudentRepo studentRepo, IDepartmentRepo departmentRepo )
        {
            _studentRepo = studentRepo;
             this.departmentRepo =  departmentRepo;
        }
        public IActionResult getAll()
        {
            var Data = _studentRepo.getAllStudent();
            return View(Data);
        }
        public IActionResult getById(int id)
        {
            var Data = _studentRepo.GetStudentById(id);
            return View(Data);
        }
        public IActionResult DeleteInstructorByID(int Id)
        {
            _studentRepo.DeleteInstructorByID(Id);
            return RedirectToAction("getAll");
        }


        public IActionResult InsertStudent()
        {
            ViewData["Department"] = new SelectList(departmentRepo.GetAllDepartments(), "DeptId", "DeptName");

            return View();
        }
        [HttpPost]
        public IActionResult InsertStudent(InsertStudentVM insertStudentVM)
        {
            if(ModelState.IsValid)
            {
                insertStudentVM.StImg = FileUploader.UploadFile("Imgs", insertStudentVM.Image);

                _studentRepo.InsertStudent(insertStudentVM);
                return RedirectToAction("getAll");
            }
            ViewData["Department"] = new SelectList(departmentRepo.GetAllDepartments(), "DeptId", "DeptName");

            return View(insertStudentVM);
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            ViewData["Department"] = new SelectList(departmentRepo.GetAllDepartments(), "DeptId", "DeptName");

            var Data = _studentRepo.GetStudentDataById(id);
            return View(Data);
        }
        [HttpPost]
        public IActionResult Edit(EditStudentVM model)
        {
            if(ModelState.IsValid)
            {
                _studentRepo.Edit(model);
                return RedirectToAction("getAll");

            }

            ViewData["Department"] = new SelectList(departmentRepo.GetAllDepartments(), "DeptId", "DeptName");
            return View(model);

        }
    }
}
