﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MotoMap.Api.DotNet.Data;
using Oracle.EntityFrameworkCore.Metadata;

#nullable disable

namespace MotoMap.Api.DotNet.Migrations
{
    [DbContext(typeof(MotoMapDbContext))]
    [Migration("20250520235141_InitialSchema")]
    partial class InitialSchema
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "9.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            OracleModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("MotoMap.Api.DotNet.Models.HistoricoPosicao", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime?>("DataFim")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<DateTime>("DataInicio")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<int>("MotoId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("PosicaoId")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.ToTable("HistoricoPosicoes");
                });

            modelBuilder.Entity("MotoMap.Api.DotNet.Models.Movimentacao", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("DataHora")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<int>("MotoId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<string>("Observacoes")
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<int?>("PosicaoId")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("Tipo")
                        .HasColumnType("NUMBER(10)");

                    b.Property<int>("UsuarioId")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.ToTable("Movimentacoes");
                });
#pragma warning restore 612, 618
        }
    }
}
