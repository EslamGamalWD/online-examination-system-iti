using ExaminationBLL.Feature.Interface;
using ExaminationDAL.Context;
using ExaminationDAL.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExaminationBLL.Feature.Repository
{
    public class PreExamManager : IpreExam
    {
        private readonly ApplicationDbContext _context;

        public PreExamManager(ApplicationDbContext context)
        {
            _context = context;
        }
        public Exam GetExamByStudentId(int? StudentId)
        {
            var Exam = _context.Exams.Where(e => e.StId == StudentId).FirstOrDefault();

            return Exam;
        }

        public Student GetStudentById(int? StudentId)
        {

            //Student student = _context.Students.Where(s => s.StId == StudentId).FirstOrDefault();
            Student student = _context.Students.Include(s => s.St).Include(d => d.Dept).Include(c => c.Crs).Where(b => b.StId == StudentId).FirstOrDefault();

            return student;
            
        }
    }
}
