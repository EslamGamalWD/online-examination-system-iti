using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Feature.Repository;
using ExaminationBLL.ModelVM.InstructorVM;
using ExaminationBLL.ModelVM.InstructorVM;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.FlowAnalysis.DataFlow;
using System.Diagnostics.CodeAnalysis;
using ExaminationBLL.Feature.Interface;
using static System.Runtime.InteropServices.JavaScript.JSType;
using ExaminationBLL.Helper;

namespace ExaminationPL.Controllers.Admin
{
    public class InstructorController : Controller
    {

        //tranisient
        //Scope
        //SingleTone
        private readonly IInstructorRepo instructorRepo;
        public InstructorController(IInstructorRepo _instructorRepo)
        {
           this. instructorRepo = _instructorRepo;
        }
        public IActionResult getAll()
        {
            var Data = instructorRepo.getAllInstructor();
            return View(Data);
        }
        public IActionResult GetInstructorById(int id)
        {
            var Data = instructorRepo.GetInstructorById(id);
            return View(Data);
        }
        public IActionResult DeleteInstructorByID(int Id)
        {
            instructorRepo.DeleteInstructorByID(Id);
            return RedirectToAction("getAll");
        }
        [HttpGet]
        public IActionResult InsertInstructor()
        {
            return View();
        }
        [HttpPost]
        public IActionResult InsertInstructor(InsertInstructorVM model)
        {
            if (ModelState.IsValid)
            {


                instructorRepo.InsertInstructor(model);
                return RedirectToAction("getAll");
            }
            return View(model);

        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            if (id == null)
                return NotFound();
            
            var Data = instructorRepo.GetInstructorDataById(id);
            if (Data==null)
                return NotFound();
            return View(Data);
        }
        [HttpPost]
        public IActionResult Edit(EditInstractorVM model)
        {
            if(ModelState.IsValid)
            {
                instructorRepo.Edit(model);
                return RedirectToAction("getAll");
            }
            return View(model);
        }
    }
}
