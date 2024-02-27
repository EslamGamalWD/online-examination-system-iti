using ExaminationDAL.Entities;

namespace ExaminationBLL.Feature.Interface;

public interface IExamRepository
{
    Exam? GetExamById(int id);
}