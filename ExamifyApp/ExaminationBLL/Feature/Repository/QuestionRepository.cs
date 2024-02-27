using ExaminationDAL.Context;
using ExaminationBLL.Feature.Interface;
using ExaminationBLL.Mapping.DTOs;
using Microsoft.EntityFrameworkCore;

namespace ExaminationBLL.Feature.Repository;

public class QuestionRepository : IQuestionRepository
{
    private readonly ApplicationDbContext _applicationDbContext;

    public QuestionRepository(ApplicationDbContext applicationDbContext)
    {
        _applicationDbContext = applicationDbContext;
    }

    public IEnumerable<IncludeDTO> GetAllQuestionsByExamId(int examId)
        => _applicationDbContext.Includes
            .Where(i => i.ExId == examId)
            .Include(i => i.Qs.MultipleChoices)
            .Select(i =>
                new IncludeDTO
                {
                    Question = i.Qs
                });
}