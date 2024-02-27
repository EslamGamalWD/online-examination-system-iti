﻿using ExaminationBLL.Feature.Repository;
using ExaminationDAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace ExaminationBLL.Feature.Interface
{
    public interface IpreExam
    {
        Exam GetExamByStudentId(int? StudentId);

        Student GetStudentById(int? StudentId);

    }
}