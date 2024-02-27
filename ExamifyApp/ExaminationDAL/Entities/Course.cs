﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable enable
using System;
using System.Collections.Generic;

namespace ExaminationDAL.Entities;

public partial class Course
{
    public int CrsId { get; set; }

    public string? CrsName { get; set; }

    public int? CrsDuration { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Topic> Topics { get; set; } = new List<Topic>();

    public virtual ICollection<Instructor> Ins { get; set; } = new List<Instructor>();

    public virtual ICollection<Student> Sts { get; set; } = new List<Student>();
}