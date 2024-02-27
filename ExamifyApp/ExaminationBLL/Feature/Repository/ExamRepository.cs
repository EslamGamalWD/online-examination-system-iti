using ExaminationDAL.Context;
using ExaminationDAL.Entities;
using ExaminationBLL.Feature.Interface;

namespace ExaminationBLL.Feature.Repository;

public class ExamRepository : IExamRepository
{
    private readonly ApplicationDbContext _applicationDbContext;

    public ExamRepository(ApplicationDbContext applicationDbContext)
    {
        _applicationDbContext = applicationDbContext;
    }

    public Exam? GetExamById(int id)
        => _applicationDbContext.Exams.FirstOrDefault(e => e.ExId == id);
}