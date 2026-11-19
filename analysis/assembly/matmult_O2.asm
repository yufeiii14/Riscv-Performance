
build/embench_ROI_O2/src/matmult-int/matmult-int:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000470 <exit>:
     470:	1101                	addi	sp,sp,-32
     472:	e42a                	sd	a0,8(sp)
     474:	ec06                	sd	ra,24(sp)
     476:	0bb000ef          	jal	ra,d30 <__stdio_exit>
     47a:	0b9000ef          	jal	ra,d32 <__libc_exit_fini>
     47e:	00004317          	auipc	t1,0x4
     482:	c0a33303          	ld	t1,-1014(t1) # 4088 <_GLOBAL_OFFSET_TABLE_+0x60>
     486:	9302                	jalr	t1
     488:	6522                	ld	a0,8(sp)
     48a:	403000ef          	jal	ra,108c <_Exit>

000000000000048e <main>:
     48e:	1101                	addi	sp,sp,-32
     490:	ec06                	sd	ra,24(sp)
     492:	612000ef          	jal	ra,aa4 <initialise_board>
     496:	3b4000ef          	jal	ra,84a <initialise_benchmark>
     49a:	4505                	li	a0,1
     49c:	3a0000ef          	jal	ra,83c <warm_caches>
     4a0:	606000ef          	jal	ra,aa6 <start_trigger>
     4a4:	39e000ef          	jal	ra,842 <benchmark>
     4a8:	c62a                	sw	a0,12(sp)
     4aa:	602000ef          	jal	ra,aac <stop_trigger>
     4ae:	4532                	lw	a0,12(sp)
     4b0:	426000ef          	jal	ra,8d6 <verify_benchmark>
     4b4:	60e2                	ld	ra,24(sp)
     4b6:	00153513          	seqz	a0,a0
     4ba:	6105                	addi	sp,sp,32
     4bc:	8082                	ret

00000000000004be <_start>:
     4be:	00004197          	auipc	gp,0x4
     4c2:	3fa18193          	addi	gp,gp,1018 # 48b8 <__global_pointer$>
     4c6:	850a                	mv	a0,sp
     4c8:	00004597          	auipc	a1,0x4
     4cc:	9c858593          	addi	a1,a1,-1592 # 3e90 <_DYNAMIC>
     4d0:	ff017113          	andi	sp,sp,-16
     4d4:	a01d                	j	4fa <_start_c>

00000000000004d6 <__dls2>:
     4d6:	00858613          	addi	a2,a1,8
     4da:	418c                	lw	a1,0(a1)
     4dc:	4781                	li	a5,0
     4de:	00004717          	auipc	a4,0x4
     4e2:	bba73703          	ld	a4,-1094(a4) # 4098 <_GLOBAL_OFFSET_TABLE_+0x70>
     4e6:	00004697          	auipc	a3,0x4
     4ea:	b6a6b683          	ld	a3,-1174(a3) # 4050 <_GLOBAL_OFFSET_TABLE_+0x28>
     4ee:	00004517          	auipc	a0,0x4
     4f2:	b9253503          	ld	a0,-1134(a0) # 4080 <_GLOBAL_OFFSET_TABLE_+0x58>
     4f6:	0070006f          	j	cfc <__libc_start_main>

00000000000004fa <_start_c>:
     4fa:	6118                	ld	a4,0(a0)
     4fc:	df010113          	addi	sp,sp,-528
     500:	862a                	mv	a2,a0
     502:	2705                	addiw	a4,a4,1
     504:	00371793          	slli	a5,a4,0x3
     508:	00f606b3          	add	a3,a2,a5
     50c:	6694                	ld	a3,8(a3)
     50e:	0705                	addi	a4,a4,1
     510:	faf5                	bnez	a3,504 <_start_c+0xa>
     512:	07c1                	addi	a5,a5,16
     514:	97b2                	add	a5,a5,a2
     516:	0814                	addi	a3,sp,16
     518:	0a18                	addi	a4,sp,272
     51a:	0006b023          	sd	zero,0(a3)
     51e:	06a1                	addi	a3,a3,8
     520:	fee69de3          	bne	a3,a4,51a <_start_c+0x20>
     524:	457d                	li	a0,31
     526:	6394                	ld	a3,0(a5)
     528:	eeb5                	bnez	a3,5a4 <_start_c+0xaa>
     52a:	87ba                	mv	a5,a4
     52c:	0c18                	addi	a4,sp,528
     52e:	e43a                	sd	a4,8(sp)
     530:	6722                	ld	a4,8(sp)
     532:	0007b023          	sd	zero,0(a5)
     536:	07a1                	addi	a5,a5,8
     538:	fee79ce3          	bne	a5,a4,530 <_start_c+0x36>
     53c:	872e                	mv	a4,a1
     53e:	46fd                	li	a3,31
     540:	631c                	ld	a5,0(a4)
     542:	efbd                	bnez	a5,5c0 <_start_c+0xc6>
     544:	6526                	ld	a0,72(sp)
     546:	ed11                	bnez	a0,562 <_start_c+0x68>
     548:	7562                	ld	a0,56(sp)
     54a:	7742                	ld	a4,48(sp)
     54c:	77a2                	ld	a5,40(sp)
     54e:	4689                	li	a3,2
     550:	c909                	beqz	a0,562 <_start_c+0x68>
     552:	0007a803          	lw	a6,0(a5)
     556:	157d                	addi	a0,a0,-1
     558:	08d81063          	bne	a6,a3,5d8 <_start_c+0xde>
     55c:	6b88                	ld	a0,16(a5)
     55e:	40a58533          	sub	a0,a1,a0
     562:	677a                	ld	a4,408(sp)
     564:	779a                	ld	a5,416(sp)
     566:	800005b7          	lui	a1,0x80000
     56a:	972a                	add	a4,a4,a0
     56c:	973e                	add	a4,a4,a5
     56e:	fff5c593          	not	a1,a1
     572:	488d                	li	a7,3
     574:	40f70833          	sub	a6,a4,a5
     578:	e3b5                	bnez	a5,5dc <_start_c+0xe2>
     57a:	6736                	ld	a4,328(sp)
     57c:	67d6                	ld	a5,336(sp)
     57e:	800005b7          	lui	a1,0x80000
     582:	972a                	add	a4,a4,a0
     584:	973e                	add	a4,a4,a5
     586:	fff5c593          	not	a1,a1
     58a:	488d                	li	a7,3
     58c:	40f706b3          	sub	a3,a4,a5
     590:	e7ad                	bnez	a5,5fa <_start_c+0x100>
     592:	00004797          	auipc	a5,0x4
     596:	a6e78793          	addi	a5,a5,-1426 # 4000 <static_func_ptr.0>
     59a:	639c                	ld	a5,0(a5)
     59c:	85b2                	mv	a1,a2
     59e:	21010113          	addi	sp,sp,528
     5a2:	8782                	jr	a5
     5a4:	00d56c63          	bltu	a0,a3,5bc <_start_c+0xc2>
     5a8:	068e                	slli	a3,a3,0x3
     5aa:	01010813          	addi	a6,sp,16
     5ae:	20068693          	addi	a3,a3,512
     5b2:	96c2                	add	a3,a3,a6
     5b4:	0087b803          	ld	a6,8(a5)
     5b8:	e106b023          	sd	a6,-512(a3)
     5bc:	07c1                	addi	a5,a5,16
     5be:	b7a5                	j	526 <_start_c+0x2c>
     5c0:	00f6ea63          	bltu	a3,a5,5d4 <_start_c+0xda>
     5c4:	078e                	slli	a5,a5,0x3
     5c6:	0808                	addi	a0,sp,16
     5c8:	20078793          	addi	a5,a5,512
     5cc:	97aa                	add	a5,a5,a0
     5ce:	6708                	ld	a0,8(a4)
     5d0:	f0a7b023          	sd	a0,-256(a5)
     5d4:	0741                	addi	a4,a4,16
     5d6:	b7ad                	j	540 <_start_c+0x46>
     5d8:	97ba                	add	a5,a5,a4
     5da:	bf9d                	j	550 <_start_c+0x56>
     5dc:	00883683          	ld	a3,8(a6)
     5e0:	8eed                	and	a3,a3,a1
     5e2:	01169a63          	bne	a3,a7,5f6 <_start_c+0xfc>
     5e6:	00083683          	ld	a3,0(a6)
     5ea:	96aa                	add	a3,a3,a0
     5ec:	0006b803          	ld	a6,0(a3)
     5f0:	982a                	add	a6,a6,a0
     5f2:	0106b023          	sd	a6,0(a3)
     5f6:	17c1                	addi	a5,a5,-16
     5f8:	bfb5                	j	574 <_start_c+0x7a>
     5fa:	0086b803          	ld	a6,8(a3)
     5fe:	00b87833          	and	a6,a6,a1
     602:	01181963          	bne	a6,a7,614 <_start_c+0x11a>
     606:	0006b803          	ld	a6,0(a3)
     60a:	6a94                	ld	a3,16(a3)
     60c:	982a                	add	a6,a6,a0
     60e:	96aa                	add	a3,a3,a0
     610:	00d83023          	sd	a3,0(a6)
     614:	17a1                	addi	a5,a5,-24
     616:	bf9d                	j	58c <_start_c+0x92>

0000000000000618 <deregister_tm_clones>:
     618:	00004517          	auipc	a0,0x4
     61c:	a0050513          	addi	a0,a0,-1536 # 4018 <__TMC_END__>
     620:	00004797          	auipc	a5,0x4
     624:	9f878793          	addi	a5,a5,-1544 # 4018 <__TMC_END__>
     628:	00a78863          	beq	a5,a0,638 <deregister_tm_clones+0x20>
     62c:	00004797          	auipc	a5,0x4
     630:	a447b783          	ld	a5,-1468(a5) # 4070 <_GLOBAL_OFFSET_TABLE_+0x48>
     634:	c391                	beqz	a5,638 <deregister_tm_clones+0x20>
     636:	8782                	jr	a5
     638:	8082                	ret

000000000000063a <register_tm_clones>:
     63a:	00004517          	auipc	a0,0x4
     63e:	9de50513          	addi	a0,a0,-1570 # 4018 <__TMC_END__>
     642:	00004597          	auipc	a1,0x4
     646:	9d658593          	addi	a1,a1,-1578 # 4018 <__TMC_END__>
     64a:	8d89                	sub	a1,a1,a0
     64c:	4035d793          	srai	a5,a1,0x3
     650:	91fd                	srli	a1,a1,0x3f
     652:	95be                	add	a1,a1,a5
     654:	8585                	srai	a1,a1,0x1
     656:	c599                	beqz	a1,664 <register_tm_clones+0x2a>
     658:	00004797          	auipc	a5,0x4
     65c:	a087b783          	ld	a5,-1528(a5) # 4060 <_GLOBAL_OFFSET_TABLE_+0x38>
     660:	c391                	beqz	a5,664 <register_tm_clones+0x2a>
     662:	8782                	jr	a5
     664:	8082                	ret

0000000000000666 <__do_global_dtors_aux>:
     666:	1141                	addi	sp,sp,-16
     668:	e022                	sd	s0,0(sp)
     66a:	00004417          	auipc	s0,0x4
     66e:	a4e40413          	addi	s0,s0,-1458 # 40b8 <completed.1>
     672:	00044783          	lbu	a5,0(s0)
     676:	e406                	sd	ra,8(sp)
     678:	eb95                	bnez	a5,6ac <__do_global_dtors_aux+0x46>
     67a:	00004797          	auipc	a5,0x4
     67e:	9be7b783          	ld	a5,-1602(a5) # 4038 <_GLOBAL_OFFSET_TABLE_+0x10>
     682:	c791                	beqz	a5,68e <__do_global_dtors_aux+0x28>
     684:	00004517          	auipc	a0,0x4
     688:	98453503          	ld	a0,-1660(a0) # 4008 <__dso_handle>
     68c:	9782                	jalr	a5
     68e:	f8bff0ef          	jal	ra,618 <deregister_tm_clones>
     692:	00004797          	auipc	a5,0x4
     696:	9c67b783          	ld	a5,-1594(a5) # 4058 <_GLOBAL_OFFSET_TABLE_+0x30>
     69a:	c791                	beqz	a5,6a6 <__do_global_dtors_aux+0x40>
     69c:	00002517          	auipc	a0,0x2
     6a0:	af050513          	addi	a0,a0,-1296 # 218c <__FRAME_END__>
     6a4:	9782                	jalr	a5
     6a6:	4785                	li	a5,1
     6a8:	00f40023          	sb	a5,0(s0)
     6ac:	60a2                	ld	ra,8(sp)
     6ae:	6402                	ld	s0,0(sp)
     6b0:	0141                	addi	sp,sp,16
     6b2:	8082                	ret

00000000000006b4 <frame_dummy>:
     6b4:	00004797          	auipc	a5,0x4
     6b8:	9f47b783          	ld	a5,-1548(a5) # 40a8 <_GLOBAL_OFFSET_TABLE_+0x80>
     6bc:	cf99                	beqz	a5,6da <frame_dummy+0x26>
     6be:	1141                	addi	sp,sp,-16
     6c0:	e406                	sd	ra,8(sp)
     6c2:	00004597          	auipc	a1,0x4
     6c6:	9fe58593          	addi	a1,a1,-1538 # 40c0 <object.0>
     6ca:	00002517          	auipc	a0,0x2
     6ce:	ac250513          	addi	a0,a0,-1342 # 218c <__FRAME_END__>
     6d2:	9782                	jalr	a5
     6d4:	60a2                	ld	ra,8(sp)
     6d6:	0141                	addi	sp,sp,16
     6d8:	b78d                	j	63a <register_tm_clones>
     6da:	b785                	j	63a <register_tm_clones>

00000000000006dc <values_match>:
     6dc:	8d0d                	sub	a0,a0,a1
     6de:	00153513          	seqz	a0,a0
     6e2:	8082                	ret

00000000000006e4 <InitSeed>:
     6e4:	00004797          	auipc	a5,0x4
     6e8:	a007a623          	sw	zero,-1524(a5) # 40f0 <Seed>
     6ec:	8082                	ret

00000000000006ee <RandomInteger>:
     6ee:	00004717          	auipc	a4,0x4
     6f2:	a0270713          	addi	a4,a4,-1534 # 40f0 <Seed>
     6f6:	431c                	lw	a5,0(a4)
     6f8:	0057951b          	slliw	a0,a5,0x5
     6fc:	9d3d                	addw	a0,a0,a5
     6fe:	0025151b          	slliw	a0,a0,0x2
     702:	9d3d                	addw	a0,a0,a5
     704:	6789                	lui	a5,0x2
     706:	f9f7879b          	addiw	a5,a5,-97
     70a:	0515051b          	addiw	a0,a0,81
     70e:	02f5653b          	remw	a0,a0,a5
     712:	c308                	sw	a0,0(a4)
     714:	8082                	ret

0000000000000716 <Multiply>:
     716:	6705                	lui	a4,0x1
     718:	d2070713          	addi	a4,a4,-736 # d20 <__libc_start_main+0x24>
     71c:	8fae                	mv	t6,a1
     71e:	0a050813          	addi	a6,a0,160
     722:	8eb2                	mv	t4,a2
     724:	00e50f33          	add	t5,a0,a4
     728:	0a058e13          	addi	t3,a1,160
     72c:	88fe                	mv	a7,t6
     72e:	8576                	mv	a0,t4
     730:	f6080313          	addi	t1,a6,-160
     734:	00053023          	sd	zero,0(a0)
     738:	879a                	mv	a5,t1
     73a:	8646                	mv	a2,a7
     73c:	4681                	li	a3,0
     73e:	6398                	ld	a4,0(a5)
     740:	620c                	ld	a1,0(a2)
     742:	07a1                	addi	a5,a5,8
     744:	0a060613          	addi	a2,a2,160
     748:	02b70733          	mul	a4,a4,a1
     74c:	96ba                	add	a3,a3,a4
     74e:	e114                	sd	a3,0(a0)
     750:	ff0797e3          	bne	a5,a6,73e <Multiply+0x28>
     754:	08a1                	addi	a7,a7,8
     756:	0521                	addi	a0,a0,8
     758:	fdc89ee3          	bne	a7,t3,734 <Multiply+0x1e>
     75c:	0a078813          	addi	a6,a5,160 # 20a0 <__set_thread_area+0xbb2>
     760:	0a0e8e93          	addi	t4,t4,160
     764:	fde814e3          	bne	a6,t5,72c <Multiply+0x16>
     768:	8082                	ret

000000000000076a <Test>:
     76a:	b775                	j	716 <Multiply>

000000000000076c <benchmark_body>:
     76c:	715d                	addi	sp,sp,-80
     76e:	fc26                	sd	s1,56(sp)
     770:	f84a                	sd	s2,48(sp)
     772:	f44e                	sd	s3,40(sp)
     774:	f052                	sd	s4,32(sp)
     776:	ec56                	sd	s5,24(sp)
     778:	e85a                	sd	s6,16(sp)
     77a:	e45e                	sd	s7,8(sp)
     77c:	e062                	sd	s8,0(sp)
     77e:	e486                	sd	ra,72(sp)
     780:	e0a2                	sd	s0,64(sp)
     782:	8baa                	mv	s7,a0
     784:	84ae                	mv	s1,a1
     786:	4b01                	li	s6,0
     788:	00007997          	auipc	s3,0x7
     78c:	7f098993          	addi	s3,s3,2032 # 7f78 <seed>
     790:	00006917          	auipc	s2,0x6
     794:	ee890913          	addi	s2,s2,-280 # 6678 <ArrayA>
     798:	00004c17          	auipc	s8,0x4
     79c:	960c0c13          	addi	s8,s8,-1696 # 40f8 <ResultArray>
     7a0:	00004a97          	auipc	s5,0x4
     7a4:	5d8a8a93          	addi	s5,s5,1496 # 4d78 <ArrayB>
     7a8:	00006a17          	auipc	s4,0x6
     7ac:	ed0a0a13          	addi	s4,s4,-304 # 6678 <ArrayA>
     7b0:	4401                	li	s0,0
     7b2:	c4ad                	beqz	s1,81c <benchmark_body+0xb0>
     7b4:	00007797          	auipc	a5,0x7
     7b8:	b4478793          	addi	a5,a5,-1212 # 72f8 <ArrayA_ref>
     7bc:	00006717          	auipc	a4,0x6
     7c0:	ebc70713          	addi	a4,a4,-324 # 6678 <ArrayA>
     7c4:	6388                	ld	a0,0(a5)
     7c6:	678c                	ld	a1,8(a5)
     7c8:	6b90                	ld	a2,16(a5)
     7ca:	6f94                	ld	a3,24(a5)
     7cc:	e308                	sd	a0,0(a4)
     7ce:	e70c                	sd	a1,8(a4)
     7d0:	eb10                	sd	a2,16(a4)
     7d2:	ef14                	sd	a3,24(a4)
     7d4:	02078793          	addi	a5,a5,32
     7d8:	02070713          	addi	a4,a4,32
     7dc:	ff3794e3          	bne	a5,s3,7c4 <benchmark_body+0x58>
     7e0:	00005797          	auipc	a5,0x5
     7e4:	21878793          	addi	a5,a5,536 # 59f8 <ArrayB_ref>
     7e8:	00004717          	auipc	a4,0x4
     7ec:	59070713          	addi	a4,a4,1424 # 4d78 <ArrayB>
     7f0:	6388                	ld	a0,0(a5)
     7f2:	678c                	ld	a1,8(a5)
     7f4:	6b90                	ld	a2,16(a5)
     7f6:	6f94                	ld	a3,24(a5)
     7f8:	e308                	sd	a0,0(a4)
     7fa:	e70c                	sd	a1,8(a4)
     7fc:	eb10                	sd	a2,16(a4)
     7fe:	ef14                	sd	a3,24(a4)
     800:	02078793          	addi	a5,a5,32
     804:	02070713          	addi	a4,a4,32
     808:	ff2794e3          	bne	a5,s2,7f0 <benchmark_body+0x84>
     80c:	2405                	addiw	s0,s0,1
     80e:	8662                	mv	a2,s8
     810:	85d6                	mv	a1,s5
     812:	8552                	mv	a0,s4
     814:	f03ff0ef          	jal	ra,716 <Multiply>
     818:	f8849ee3          	bne	s1,s0,7b4 <benchmark_body+0x48>
     81c:	2b05                	addiw	s6,s6,1
     81e:	f96b99e3          	bne	s7,s6,7b0 <benchmark_body+0x44>
     822:	60a6                	ld	ra,72(sp)
     824:	6406                	ld	s0,64(sp)
     826:	74e2                	ld	s1,56(sp)
     828:	7942                	ld	s2,48(sp)
     82a:	79a2                	ld	s3,40(sp)
     82c:	7a02                	ld	s4,32(sp)
     82e:	6ae2                	ld	s5,24(sp)
     830:	6b42                	ld	s6,16(sp)
     832:	6ba2                	ld	s7,8(sp)
     834:	6c02                	ld	s8,0(sp)
     836:	4501                	li	a0,0
     838:	6161                	addi	sp,sp,80
     83a:	8082                	ret

000000000000083c <warm_caches>:
     83c:	85aa                	mv	a1,a0
     83e:	4505                	li	a0,1
     840:	b735                	j	76c <benchmark_body>

0000000000000842 <benchmark>:
     842:	4585                	li	a1,1
     844:	02700513          	li	a0,39
     848:	b715                	j	76c <benchmark_body>

000000000000084a <initialise_benchmark>:
     84a:	6589                	lui	a1,0x2
     84c:	00007617          	auipc	a2,0x7
     850:	b4c60613          	addi	a2,a2,-1204 # 7398 <ArrayA_ref+0xa0>
     854:	00007517          	auipc	a0,0x7
     858:	7c450513          	addi	a0,a0,1988 # 8018 <__progname_full>
     85c:	4781                	li	a5,0
     85e:	f9f5859b          	addiw	a1,a1,-97
     862:	f6060693          	addi	a3,a2,-160
     866:	0057971b          	slliw	a4,a5,0x5
     86a:	9f3d                	addw	a4,a4,a5
     86c:	0027171b          	slliw	a4,a4,0x2
     870:	9fb9                	addw	a5,a5,a4
     872:	0517879b          	addiw	a5,a5,81
     876:	02b7e7bb          	remw	a5,a5,a1
     87a:	06a1                	addi	a3,a3,8
     87c:	fef6bc23          	sd	a5,-8(a3)
     880:	fec693e3          	bne	a3,a2,866 <initialise_benchmark+0x1c>
     884:	0a068613          	addi	a2,a3,160
     888:	fca61de3          	bne	a2,a0,862 <initialise_benchmark+0x18>
     88c:	6589                	lui	a1,0x2
     88e:	00005617          	auipc	a2,0x5
     892:	20a60613          	addi	a2,a2,522 # 5a98 <ArrayB_ref+0xa0>
     896:	00006517          	auipc	a0,0x6
     89a:	e8250513          	addi	a0,a0,-382 # 6718 <ArrayA+0xa0>
     89e:	f9f5859b          	addiw	a1,a1,-97
     8a2:	f6060693          	addi	a3,a2,-160
     8a6:	0057971b          	slliw	a4,a5,0x5
     8aa:	9f3d                	addw	a4,a4,a5
     8ac:	0027171b          	slliw	a4,a4,0x2
     8b0:	9fb9                	addw	a5,a5,a4
     8b2:	0517879b          	addiw	a5,a5,81
     8b6:	02b7e7bb          	remw	a5,a5,a1
     8ba:	06a1                	addi	a3,a3,8
     8bc:	fef6bc23          	sd	a5,-8(a3)
     8c0:	fed613e3          	bne	a2,a3,8a6 <initialise_benchmark+0x5c>
     8c4:	0a060613          	addi	a2,a2,160
     8c8:	fcc51de3          	bne	a0,a2,8a2 <initialise_benchmark+0x58>
     8cc:	00004717          	auipc	a4,0x4
     8d0:	82f72223          	sw	a5,-2012(a4) # 40f0 <Seed>
     8d4:	8082                	ret

00000000000008d6 <verify_benchmark>:
     8d6:	6685                	lui	a3,0x1
     8d8:	81010113          	addi	sp,sp,-2032
     8dc:	77fd                	lui	a5,0xfffff
     8de:	c8068693          	addi	a3,a3,-896 # c80 <__init_libc+0x12e>
     8e2:	96be                	add	a3,a3,a5
     8e4:	7e113423          	sd	ra,2024(sp)
     8e8:	b6010113          	addi	sp,sp,-1184
     8ec:	002687b3          	add	a5,a3,sp
     8f0:	00001717          	auipc	a4,0x1
     8f4:	c0870713          	addi	a4,a4,-1016 # 14f8 <__set_thread_area+0xa>
     8f8:	38078793          	addi	a5,a5,896 # fffffffffffff380 <__BSS_END__+0xffffffffffff71d0>
     8fc:	00002697          	auipc	a3,0x2
     900:	87c68693          	addi	a3,a3,-1924 # 2178 <__set_thread_area+0xc8a>
     904:	00073803          	ld	a6,0(a4)
     908:	6708                	ld	a0,8(a4)
     90a:	6b0c                	ld	a1,16(a4)
     90c:	6f10                	ld	a2,24(a4)
     90e:	0107b023          	sd	a6,0(a5)
     912:	e788                	sd	a0,8(a5)
     914:	eb8c                	sd	a1,16(a5)
     916:	ef90                	sd	a2,24(a5)
     918:	02070713          	addi	a4,a4,32
     91c:	02078793          	addi	a5,a5,32
     920:	fed712e3          	bne	a4,a3,904 <verify_benchmark+0x2e>
     924:	6605                	lui	a2,0x1
     926:	75fd                	lui	a1,0xfffff
     928:	c8060613          	addi	a2,a2,-896 # c80 <__init_libc+0x12e>
     92c:	38058593          	addi	a1,a1,896 # fffffffffffff380 <__BSS_END__+0xffffffffffff71d0>
     930:	00b607b3          	add	a5,a2,a1
     934:	002785b3          	add	a1,a5,sp
     938:	00003517          	auipc	a0,0x3
     93c:	7c050513          	addi	a0,a0,1984 # 40f8 <ResultArray>
     940:	42a000ef          	jal	ra,d6a <memcmp>
     944:	4a010113          	addi	sp,sp,1184
     948:	7e813083          	ld	ra,2024(sp)
     94c:	00153513          	seqz	a0,a0
     950:	7f010113          	addi	sp,sp,2032
     954:	8082                	ret

0000000000000956 <rand_beebs>:
     956:	00007717          	auipc	a4,0x7
     95a:	62270713          	addi	a4,a4,1570 # 7f78 <seed>
     95e:	6308                	ld	a0,0(a4)
     960:	41c657b7          	lui	a5,0x41c65
     964:	e6d78793          	addi	a5,a5,-403 # 41c64e6d <__BSS_END__+0x41c5ccbd>
     968:	02f50533          	mul	a0,a0,a5
     96c:	678d                	lui	a5,0x3
     96e:	03978793          	addi	a5,a5,57 # 3039 <__FRAME_END__+0xead>
     972:	953e                	add	a0,a0,a5
     974:	1506                	slli	a0,a0,0x21
     976:	9105                	srli	a0,a0,0x21
     978:	e308                	sd	a0,0(a4)
     97a:	8141                	srli	a0,a0,0x10
     97c:	8082                	ret

000000000000097e <srand_beebs>:
     97e:	1502                	slli	a0,a0,0x20
     980:	9101                	srli	a0,a0,0x20
     982:	00007797          	auipc	a5,0x7
     986:	5ea7bb23          	sd	a0,1526(a5) # 7f78 <seed>
     98a:	8082                	ret

000000000000098c <init_heap_beebs>:
     98c:	0075f793          	andi	a5,a1,7
     990:	ef89                	bnez	a5,9aa <init_heap_beebs+0x1e>
     992:	00007797          	auipc	a5,0x7
     996:	5e678793          	addi	a5,a5,1510 # 7f78 <seed>
     99a:	95aa                	add	a1,a1,a0
     99c:	e788                	sd	a0,8(a5)
     99e:	eb8c                	sd	a1,16(a5)
     9a0:	00007797          	auipc	a5,0x7
     9a4:	5e07b823          	sd	zero,1520(a5) # 7f90 <heap_requested>
     9a8:	8082                	ret
     9aa:	a001                	j	9aa <init_heap_beebs+0x1e>

00000000000009ac <check_heap_beebs>:
     9ac:	00007797          	auipc	a5,0x7
     9b0:	5cc78793          	addi	a5,a5,1484 # 7f78 <seed>
     9b4:	6f98                	ld	a4,24(a5)
     9b6:	6b9c                	ld	a5,16(a5)
     9b8:	953a                	add	a0,a0,a4
     9ba:	00a7b533          	sltu	a0,a5,a0
     9be:	00154513          	xori	a0,a0,1
     9c2:	2501                	sext.w	a0,a0
     9c4:	8082                	ret

00000000000009c6 <malloc_beebs>:
     9c6:	87aa                	mv	a5,a0
     9c8:	c91d                	beqz	a0,9fe <malloc_beebs+0x38>
     9ca:	00007717          	auipc	a4,0x7
     9ce:	5ae70713          	addi	a4,a4,1454 # 7f78 <seed>
     9d2:	6708                	ld	a0,8(a4)
     9d4:	6f10                	ld	a2,24(a4)
     9d6:	00f506b3          	add	a3,a0,a5
     9da:	0076f593          	andi	a1,a3,7
     9de:	97b2                	add	a5,a5,a2
     9e0:	e599                	bnez	a1,9ee <malloc_beebs+0x28>
     9e2:	ef1c                	sd	a5,24(a4)
     9e4:	6b1c                	ld	a5,16(a4)
     9e6:	00d7ec63          	bltu	a5,a3,9fe <malloc_beebs+0x38>
     9ea:	e714                	sd	a3,8(a4)
     9ec:	8082                	ret
     9ee:	4621                	li	a2,8
     9f0:	8e0d                	sub	a2,a2,a1
     9f2:	97b2                	add	a5,a5,a2
     9f4:	ef1c                	sd	a5,24(a4)
     9f6:	6b1c                	ld	a5,16(a4)
     9f8:	96b2                	add	a3,a3,a2
     9fa:	fed7f8e3          	bgeu	a5,a3,9ea <malloc_beebs+0x24>
     9fe:	4501                	li	a0,0
     a00:	8082                	ret

0000000000000a02 <calloc_beebs>:
     a02:	02b50633          	mul	a2,a0,a1
     a06:	c631                	beqz	a2,a52 <calloc_beebs+0x50>
     a08:	00007797          	auipc	a5,0x7
     a0c:	57078793          	addi	a5,a5,1392 # 7f78 <seed>
     a10:	6798                	ld	a4,8(a5)
     a12:	6f94                	ld	a3,24(a5)
     a14:	00c705b3          	add	a1,a4,a2
     a18:	0075f813          	andi	a6,a1,7
     a1c:	96b2                	add	a3,a3,a2
     a1e:	02081163          	bnez	a6,a40 <calloc_beebs+0x3e>
     a22:	ef94                	sd	a3,24(a5)
     a24:	6b94                	ld	a3,16(a5)
     a26:	02b6e663          	bltu	a3,a1,a52 <calloc_beebs+0x50>
     a2a:	e78c                	sd	a1,8(a5)
     a2c:	c705                	beqz	a4,a54 <calloc_beebs+0x52>
     a2e:	1141                	addi	sp,sp,-16
     a30:	4581                	li	a1,0
     a32:	853a                	mv	a0,a4
     a34:	e406                	sd	ra,8(sp)
     a36:	358000ef          	jal	ra,d8e <memset>
     a3a:	60a2                	ld	ra,8(sp)
     a3c:	0141                	addi	sp,sp,16
     a3e:	8082                	ret
     a40:	4521                	li	a0,8
     a42:	41050533          	sub	a0,a0,a6
     a46:	96aa                	add	a3,a3,a0
     a48:	ef94                	sd	a3,24(a5)
     a4a:	6b94                	ld	a3,16(a5)
     a4c:	95aa                	add	a1,a1,a0
     a4e:	fcb6fee3          	bgeu	a3,a1,a2a <calloc_beebs+0x28>
     a52:	4701                	li	a4,0
     a54:	853a                	mv	a0,a4
     a56:	8082                	ret

0000000000000a58 <realloc_beebs>:
     a58:	c139                	beqz	a0,a9e <realloc_beebs+0x46>
     a5a:	1101                	addi	sp,sp,-32
     a5c:	e822                	sd	s0,16(sp)
     a5e:	842a                	mv	s0,a0
     a60:	852e                	mv	a0,a1
     a62:	e426                	sd	s1,8(sp)
     a64:	ec06                	sd	ra,24(sp)
     a66:	84ae                	mv	s1,a1
     a68:	f5fff0ef          	jal	ra,9c6 <malloc_beebs>
     a6c:	c11d                	beqz	a0,a92 <realloc_beebs+0x3a>
     a6e:	cc89                	beqz	s1,a88 <realloc_beebs+0x30>
     a70:	87a2                	mv	a5,s0
     a72:	872a                	mv	a4,a0
     a74:	009405b3          	add	a1,s0,s1
     a78:	0007c683          	lbu	a3,0(a5)
     a7c:	0785                	addi	a5,a5,1
     a7e:	0705                	addi	a4,a4,1
     a80:	fed70fa3          	sb	a3,-1(a4)
     a84:	feb79ae3          	bne	a5,a1,a78 <realloc_beebs+0x20>
     a88:	60e2                	ld	ra,24(sp)
     a8a:	6442                	ld	s0,16(sp)
     a8c:	64a2                	ld	s1,8(sp)
     a8e:	6105                	addi	sp,sp,32
     a90:	8082                	ret
     a92:	60e2                	ld	ra,24(sp)
     a94:	6442                	ld	s0,16(sp)
     a96:	64a2                	ld	s1,8(sp)
     a98:	4501                	li	a0,0
     a9a:	6105                	addi	sp,sp,32
     a9c:	8082                	ret
     a9e:	4501                	li	a0,0
     aa0:	8082                	ret

0000000000000aa2 <free_beebs>:
     aa2:	8082                	ret

0000000000000aa4 <initialise_board>:
     aa4:	8082                	ret

0000000000000aa6 <start_trigger>:
     aa6:	4581                	li	a1,0
     aa8:	4501                	li	a0,0
     aaa:	a881                	j	afa <m5_reset_stats>

0000000000000aac <stop_trigger>:
     aac:	4581                	li	a1,0
     aae:	4501                	li	a0,0
     ab0:	a881                	j	b00 <m5_dump_stats>

0000000000000ab2 <m5_arm>:
     ab2:	0000007b          	0x7b
     ab6:	8082                	ret

0000000000000ab8 <m5_quiesce>:
     ab8:	0200007b          	0x200007b
     abc:	8082                	ret

0000000000000abe <m5_quiesce_ns>:
     abe:	0400007b          	0x400007b
     ac2:	8082                	ret

0000000000000ac4 <m5_quiesce_cycle>:
     ac4:	0600007b          	0x600007b
     ac8:	8082                	ret

0000000000000aca <m5_quiesce_time>:
     aca:	0800007b          	0x800007b
     ace:	8082                	ret

0000000000000ad0 <m5_rpns>:
     ad0:	0e00007b          	0xe00007b
     ad4:	8082                	ret

0000000000000ad6 <m5_wake_cpu>:
     ad6:	1200007b          	0x1200007b
     ada:	8082                	ret

0000000000000adc <m5_exit>:
     adc:	4200007b          	0x4200007b
     ae0:	8082                	ret

0000000000000ae2 <m5_fail>:
     ae2:	4400007b          	0x4400007b
     ae6:	8082                	ret

0000000000000ae8 <m5_sum>:
     ae8:	4600007b          	0x4600007b
     aec:	8082                	ret

0000000000000aee <m5_init_param>:
     aee:	6000007b          	0x6000007b
     af2:	8082                	ret

0000000000000af4 <m5_load_symbol>:
     af4:	6200007b          	0x6200007b
     af8:	8082                	ret

0000000000000afa <m5_reset_stats>:
     afa:	8000007b          	0x8000007b
     afe:	8082                	ret

0000000000000b00 <m5_dump_stats>:
     b00:	8200007b          	0x8200007b
     b04:	8082                	ret

0000000000000b06 <m5_dump_reset_stats>:
     b06:	8400007b          	0x8400007b
     b0a:	8082                	ret

0000000000000b0c <m5_checkpoint>:
     b0c:	8600007b          	0x8600007b
     b10:	8082                	ret

0000000000000b12 <m5_write_file>:
     b12:	9e00007b          	0x9e00007b
     b16:	8082                	ret

0000000000000b18 <m5_read_file>:
     b18:	a000007b          	0xa000007b
     b1c:	8082                	ret

0000000000000b1e <m5_debug_break>:
     b1e:	a200007b          	0xa200007b
     b22:	8082                	ret

0000000000000b24 <m5_switch_cpu>:
     b24:	a400007b          	0xa400007b
     b28:	8082                	ret

0000000000000b2a <m5_add_symbol>:
     b2a:	a600007b          	0xa600007b
     b2e:	8082                	ret

0000000000000b30 <m5_panic>:
     b30:	a800007b          	0xa800007b
     b34:	8082                	ret

0000000000000b36 <m5_work_begin>:
     b36:	b400007b          	0xb400007b
     b3a:	8082                	ret

0000000000000b3c <m5_work_end>:
     b3c:	b600007b          	0xb600007b
     b40:	8082                	ret

0000000000000b42 <m5_dist_toggle_sync>:
     b42:	c400007b          	0xc400007b
     b46:	8082                	ret

0000000000000b48 <m5_workload>:
     b48:	e000007b          	0xe000007b
     b4c:	8082                	ret

0000000000000b4e <_init>:
     b4e:	8082                	ret

0000000000000b50 <__init_ssp>:
     b50:	8082                	ret

0000000000000b52 <__init_libc>:
     b52:	7109                	addi	sp,sp,-384
     b54:	f2ca                	sd	s2,352(sp)
     b56:	03010913          	addi	s2,sp,48
     b5a:	faa2                	sd	s0,368(sp)
     b5c:	f6a6                	sd	s1,360(sp)
     b5e:	842e                	mv	s0,a1
     b60:	84aa                	mv	s1,a0
     b62:	13000613          	li	a2,304
     b66:	4581                	li	a1,0
     b68:	854a                	mv	a0,s2
     b6a:	fe86                	sd	ra,376(sp)
     b6c:	222000ef          	jal	ra,d8e <memset>
     b70:	00003797          	auipc	a5,0x3
     b74:	4d87b783          	ld	a5,1240(a5) # 4048 <_GLOBAL_OFFSET_TABLE_+0x20>
     b78:	e384                	sd	s1,0(a5)
     b7a:	4701                	li	a4,0
     b7c:	00371793          	slli	a5,a4,0x3
     b80:	00f486b3          	add	a3,s1,a5
     b84:	6294                	ld	a3,0(a3)
     b86:	0705                	addi	a4,a4,1
     b88:	faf5                	bnez	a3,b7c <__init_libc+0x2a>
     b8a:	07a1                	addi	a5,a5,8
     b8c:	00f48533          	add	a0,s1,a5
     b90:	00007497          	auipc	s1,0x7
     b94:	41848493          	addi	s1,s1,1048 # 7fa8 <__libc>
     b98:	e488                	sd	a0,8(s1)
     b9a:	02500713          	li	a4,37
     b9e:	611c                	ld	a5,0(a0)
     ba0:	e3f1                	bnez	a5,c64 <__init_libc+0x112>
     ba2:	77ca                	ld	a5,176(sp)
     ba4:	00007717          	auipc	a4,0x7
     ba8:	3ef73e23          	sd	a5,1020(a4) # 7fa0 <__hwcap>
     bac:	77d2                	ld	a5,304(sp)
     bae:	c789                	beqz	a5,bb8 <__init_libc+0x66>
     bb0:	00007717          	auipc	a4,0x7
     bb4:	3ef73423          	sd	a5,1000(a4) # 7f98 <__sysinfo>
     bb8:	7786                	ld	a5,96(sp)
     bba:	f89c                	sd	a5,48(s1)
     bbc:	e801                	bnez	s0,bcc <__init_libc+0x7a>
     bbe:	77b2                	ld	a5,296(sp)
     bc0:	00001417          	auipc	s0,0x1
     bc4:	5b840413          	addi	s0,s0,1464 # 2178 <__set_thread_area+0xc8a>
     bc8:	c391                	beqz	a5,bcc <__init_libc+0x7a>
     bca:	843e                	mv	s0,a5
     bcc:	00003797          	auipc	a5,0x3
     bd0:	4e47b783          	ld	a5,1252(a5) # 40b0 <_GLOBAL_OFFSET_TABLE_+0x88>
     bd4:	00003717          	auipc	a4,0x3
     bd8:	49473703          	ld	a4,1172(a4) # 4068 <_GLOBAL_OFFSET_TABLE_+0x40>
     bdc:	e380                	sd	s0,0(a5)
     bde:	e300                	sd	s0,0(a4)
     be0:	02f00693          	li	a3,47
     be4:	0405                	addi	s0,s0,1
     be6:	fff44783          	lbu	a5,-1(s0)
     bea:	ebc1                	bnez	a5,c7a <__init_libc+0x128>
     bec:	854a                	mv	a0,s2
     bee:	36a000ef          	jal	ra,f58 <__init_tls>
     bf2:	756e                	ld	a0,248(sp)
     bf4:	f5dff0ef          	jal	ra,b50 <__init_ssp>
     bf8:	672a                	ld	a4,136(sp)
     bfa:	67ca                	ld	a5,144(sp)
     bfc:	00f71863          	bne	a4,a5,c0c <__init_libc+0xba>
     c00:	676a                	ld	a4,152(sp)
     c02:	778a                	ld	a5,160(sp)
     c04:	00f71463          	bne	a4,a5,c0c <__init_libc+0xba>
     c08:	77ae                	ld	a5,232(sp)
     c0a:	c3d9                	beqz	a5,c90 <__init_libc+0x13e>
     c0c:	f002                	sd	zero,32(sp)
     c0e:	4785                	li	a5,1
     c10:	f402                	sd	zero,40(sp)
     c12:	d03e                	sw	a5,32(sp)
     c14:	4789                	li	a5,2
     c16:	d43e                	sw	a5,40(sp)
     c18:	083c                	addi	a5,sp,24
     c1a:	ec02                	sd	zero,24(sp)
     c1c:	e402                	sd	zero,8(sp)
     c1e:	e802                	sd	zero,16(sp)
     c20:	04900893          	li	a7,73
     c24:	853e                	mv	a0,a5
     c26:	458d                	li	a1,3
     c28:	0030                	addi	a2,sp,8
     c2a:	4681                	li	a3,0
     c2c:	4721                	li	a4,8
     c2e:	00000073          	ecall
     c32:	2501                	sext.w	a0,a0
     c34:	02054563          	bltz	a0,c5e <__init_libc+0x10c>
     c38:	6621                	lui	a2,0x8
     c3a:	00001597          	auipc	a1,0x1
     c3e:	54658593          	addi	a1,a1,1350 # 2180 <__set_thread_area+0xc92>
     c42:	0609                	addi	a2,a2,2
     c44:	0067d703          	lhu	a4,6(a5)
     c48:	02077713          	andi	a4,a4,32
     c4c:	cf05                	beqz	a4,c84 <__init_libc+0x132>
     c4e:	03800893          	li	a7,56
     c52:	f9c00513          	li	a0,-100
     c56:	00000073          	ecall
     c5a:	02055563          	bgez	a0,c84 <__init_libc+0x132>
     c5e:	00000023          	sb	zero,0(zero) # 0 <exit-0x470>
     c62:	9002                	ebreak
     c64:	00f76963          	bltu	a4,a5,c76 <__init_libc+0x124>
     c68:	6514                	ld	a3,8(a0)
     c6a:	078e                	slli	a5,a5,0x3
     c6c:	16078793          	addi	a5,a5,352
     c70:	978a                	add	a5,a5,sp
     c72:	ecd7b823          	sd	a3,-304(a5)
     c76:	0541                	addi	a0,a0,16
     c78:	b71d                	j	b9e <__init_libc+0x4c>
     c7a:	00d79363          	bne	a5,a3,c80 <__init_libc+0x12e>
     c7e:	e300                	sd	s0,0(a4)
     c80:	0405                	addi	s0,s0,1
     c82:	b795                	j	be6 <__init_libc+0x94>
     c84:	07a1                	addi	a5,a5,8
     c86:	faf91fe3          	bne	s2,a5,c44 <__init_libc+0xf2>
     c8a:	4785                	li	a5,1
     c8c:	00f48123          	sb	a5,2(s1)
     c90:	70f6                	ld	ra,376(sp)
     c92:	7456                	ld	s0,368(sp)
     c94:	74b6                	ld	s1,360(sp)
     c96:	7916                	ld	s2,352(sp)
     c98:	6119                	addi	sp,sp,384
     c9a:	8082                	ret

0000000000000c9c <__libc_start_init>:
     c9c:	1101                	addi	sp,sp,-32
     c9e:	00003317          	auipc	t1,0x3
     ca2:	3b233303          	ld	t1,946(t1) # 4050 <_GLOBAL_OFFSET_TABLE_+0x28>
     ca6:	e822                	sd	s0,16(sp)
     ca8:	e426                	sd	s1,8(sp)
     caa:	ec06                	sd	ra,24(sp)
     cac:	00003417          	auipc	s0,0x3
     cb0:	3f443403          	ld	s0,1012(s0) # 40a0 <_GLOBAL_OFFSET_TABLE_+0x78>
     cb4:	9302                	jalr	t1
     cb6:	00003497          	auipc	s1,0x3
     cba:	3da4b483          	ld	s1,986(s1) # 4090 <_GLOBAL_OFFSET_TABLE_+0x68>
     cbe:	00946763          	bltu	s0,s1,ccc <__libc_start_init+0x30>
     cc2:	60e2                	ld	ra,24(sp)
     cc4:	6442                	ld	s0,16(sp)
     cc6:	64a2                	ld	s1,8(sp)
     cc8:	6105                	addi	sp,sp,32
     cca:	8082                	ret
     ccc:	601c                	ld	a5,0(s0)
     cce:	0421                	addi	s0,s0,8
     cd0:	9782                	jalr	a5
     cd2:	b7f5                	j	cbe <__libc_start_init+0x22>

0000000000000cd4 <libc_start_main_stage2>:
     cd4:	7179                	addi	sp,sp,-48
     cd6:	f022                	sd	s0,32(sp)
     cd8:	00158413          	addi	s0,a1,1
     cdc:	040e                	slli	s0,s0,0x3
     cde:	f406                	sd	ra,40(sp)
     ce0:	ec26                	sd	s1,24(sp)
     ce2:	e84a                	sd	s2,16(sp)
     ce4:	84ae                	mv	s1,a1
     ce6:	892a                	mv	s2,a0
     ce8:	9432                	add	s0,s0,a2
     cea:	e432                	sd	a2,8(sp)
     cec:	fb1ff0ef          	jal	ra,c9c <__libc_start_init>
     cf0:	65a2                	ld	a1,8(sp)
     cf2:	8622                	mv	a2,s0
     cf4:	8526                	mv	a0,s1
     cf6:	9902                	jalr	s2
     cf8:	f78ff0ef          	jal	ra,470 <exit>

0000000000000cfc <__libc_start_main>:
     cfc:	7179                	addi	sp,sp,-48
     cfe:	f022                	sd	s0,32(sp)
     d00:	ec26                	sd	s1,24(sp)
     d02:	842e                	mv	s0,a1
     d04:	84aa                	mv	s1,a0
     d06:	00158513          	addi	a0,a1,1
     d0a:	620c                	ld	a1,0(a2)
     d0c:	050e                	slli	a0,a0,0x3
     d0e:	9532                	add	a0,a0,a2
     d10:	f406                	sd	ra,40(sp)
     d12:	e432                	sd	a2,8(sp)
     d14:	e3fff0ef          	jal	ra,b52 <__init_libc>
     d18:	00000797          	auipc	a5,0x0
     d1c:	fbc78793          	addi	a5,a5,-68 # cd4 <libc_start_main_stage2>
     d20:	85a2                	mv	a1,s0
     d22:	7402                	ld	s0,32(sp)
     d24:	6622                	ld	a2,8(sp)
     d26:	70a2                	ld	ra,40(sp)
     d28:	8526                	mv	a0,s1
     d2a:	64e2                	ld	s1,24(sp)
     d2c:	6145                	addi	sp,sp,48
     d2e:	8782                	jr	a5

0000000000000d30 <__stdio_exit>:
     d30:	8082                	ret

0000000000000d32 <__libc_exit_fini>:
     d32:	1101                	addi	sp,sp,-32
     d34:	e822                	sd	s0,16(sp)
     d36:	e426                	sd	s1,8(sp)
     d38:	ec06                	sd	ra,24(sp)
     d3a:	00003417          	auipc	s0,0x3
     d3e:	30643403          	ld	s0,774(s0) # 4040 <_GLOBAL_OFFSET_TABLE_+0x18>
     d42:	00003497          	auipc	s1,0x3
     d46:	3364b483          	ld	s1,822(s1) # 4078 <_GLOBAL_OFFSET_TABLE_+0x50>
     d4a:	0084eb63          	bltu	s1,s0,d60 <__libc_exit_fini+0x2e>
     d4e:	6442                	ld	s0,16(sp)
     d50:	60e2                	ld	ra,24(sp)
     d52:	64a2                	ld	s1,8(sp)
     d54:	00003317          	auipc	t1,0x3
     d58:	34433303          	ld	t1,836(t1) # 4098 <_GLOBAL_OFFSET_TABLE_+0x70>
     d5c:	6105                	addi	sp,sp,32
     d5e:	8302                	jr	t1
     d60:	ff843783          	ld	a5,-8(s0)
     d64:	1461                	addi	s0,s0,-8
     d66:	9782                	jalr	a5
     d68:	b7cd                	j	d4a <__libc_exit_fini+0x18>

0000000000000d6a <memcmp>:
     d6a:	c205                	beqz	a2,d8a <memcmp+0x20>
     d6c:	962e                	add	a2,a2,a1
     d6e:	a019                	j	d74 <memcmp+0xa>
     d70:	00c58d63          	beq	a1,a2,d8a <memcmp+0x20>
     d74:	00054783          	lbu	a5,0(a0)
     d78:	0005c703          	lbu	a4,0(a1)
     d7c:	0505                	addi	a0,a0,1
     d7e:	0585                	addi	a1,a1,1
     d80:	fee788e3          	beq	a5,a4,d70 <memcmp+0x6>
     d84:	40e7853b          	subw	a0,a5,a4
     d88:	8082                	ret
     d8a:	4501                	li	a0,0
     d8c:	8082                	ret

0000000000000d8e <memset>:
     d8e:	c679                	beqz	a2,e5c <memset+0xce>
     d90:	0ff5f793          	zext.b	a5,a1
     d94:	00f50023          	sb	a5,0(a0)
     d98:	00c50733          	add	a4,a0,a2
     d9c:	fef70fa3          	sb	a5,-1(a4)
     da0:	4689                	li	a3,2
     da2:	0ac6fd63          	bgeu	a3,a2,e5c <memset+0xce>
     da6:	00f500a3          	sb	a5,1(a0)
     daa:	00f50123          	sb	a5,2(a0)
     dae:	fef70f23          	sb	a5,-2(a4)
     db2:	fef70ea3          	sb	a5,-3(a4)
     db6:	4699                	li	a3,6
     db8:	0ac6f263          	bgeu	a3,a2,e5c <memset+0xce>
     dbc:	00f501a3          	sb	a5,3(a0)
     dc0:	fef70e23          	sb	a5,-4(a4)
     dc4:	46a1                	li	a3,8
     dc6:	08c6fb63          	bgeu	a3,a2,e5c <memset+0xce>
     dca:	0ff5f593          	zext.b	a1,a1
     dce:	0085979b          	slliw	a5,a1,0x8
     dd2:	40a00733          	neg	a4,a0
     dd6:	8b0d                	andi	a4,a4,3
     dd8:	9fad                	addw	a5,a5,a1
     dda:	8e19                	sub	a2,a2,a4
     ddc:	0107959b          	slliw	a1,a5,0x10
     de0:	9fad                	addw	a5,a5,a1
     de2:	972a                	add	a4,a4,a0
     de4:	9a71                	andi	a2,a2,-4
     de6:	c31c                	sw	a5,0(a4)
     de8:	00c705b3          	add	a1,a4,a2
     dec:	fef5ae23          	sw	a5,-4(a1)
     df0:	06c6f663          	bgeu	a3,a2,e5c <memset+0xce>
     df4:	c35c                	sw	a5,4(a4)
     df6:	c71c                	sw	a5,8(a4)
     df8:	fef5aa23          	sw	a5,-12(a1)
     dfc:	fef5ac23          	sw	a5,-8(a1)
     e00:	46e1                	li	a3,24
     e02:	04c6fd63          	bgeu	a3,a2,e5c <memset+0xce>
     e06:	00477813          	andi	a6,a4,4
     e0a:	c75c                	sw	a5,12(a4)
     e0c:	cb1c                	sw	a5,16(a4)
     e0e:	cb5c                	sw	a5,20(a4)
     e10:	cf1c                	sw	a5,24(a4)
     e12:	0861                	addi	a6,a6,24
     e14:	02079893          	slli	a7,a5,0x20
     e18:	02079693          	slli	a3,a5,0x20
     e1c:	0208d893          	srli	a7,a7,0x20
     e20:	fef5a223          	sw	a5,-28(a1)
     e24:	fef5a423          	sw	a5,-24(a1)
     e28:	fef5a623          	sw	a5,-20(a1)
     e2c:	fef5a823          	sw	a5,-16(a1)
     e30:	41060633          	sub	a2,a2,a6
     e34:	47fd                	li	a5,31
     e36:	9742                	add	a4,a4,a6
     e38:	0116e6b3          	or	a3,a3,a7
     e3c:	02c7f063          	bgeu	a5,a2,e5c <memset+0xce>
     e40:	1601                	addi	a2,a2,-32
     e42:	fe067793          	andi	a5,a2,-32
     e46:	02078793          	addi	a5,a5,32
     e4a:	97ba                	add	a5,a5,a4
     e4c:	e314                	sd	a3,0(a4)
     e4e:	e714                	sd	a3,8(a4)
     e50:	eb14                	sd	a3,16(a4)
     e52:	ef14                	sd	a3,24(a4)
     e54:	02070713          	addi	a4,a4,32
     e58:	fef71ae3          	bne	a4,a5,e4c <memset+0xbe>
     e5c:	8082                	ret

0000000000000e5e <__init_tp>:
     e5e:	1141                	addi	sp,sp,-16
     e60:	e022                	sd	s0,0(sp)
     e62:	e406                	sd	ra,8(sp)
     e64:	842a                	mv	s0,a0
     e66:	e108                	sd	a0,0(a0)
     e68:	0c850513          	addi	a0,a0,200
     e6c:	682000ef          	jal	ra,14ee <__set_thread_area>
     e70:	04054763          	bltz	a0,ebe <__init_tp+0x60>
     e74:	e511                	bnez	a0,e80 <__init_tp+0x22>
     e76:	4785                	li	a5,1
     e78:	00007717          	auipc	a4,0x7
     e7c:	12f70823          	sb	a5,304(a4) # 7fa8 <__libc>
     e80:	4789                	li	a5,2
     e82:	d41c                	sw	a5,40(s0)
     e84:	06000893          	li	a7,96
     e88:	00007517          	auipc	a0,0x7
     e8c:	1a050513          	addi	a0,a0,416 # 8028 <__thread_list_lock>
     e90:	00000073          	ecall
     e94:	00007797          	auipc	a5,0x7
     e98:	14c78793          	addi	a5,a5,332 # 7fe0 <__libc+0x38>
     e9c:	ec5c                	sd	a5,152(s0)
     e9e:	07840793          	addi	a5,s0,120
     ea2:	fc3c                	sd	a5,120(s0)
     ea4:	00007797          	auipc	a5,0x7
     ea8:	0f47b783          	ld	a5,244(a5) # 7f98 <__sysinfo>
     eac:	d008                	sw	a0,32(s0)
     eae:	ec1c                	sd	a5,24(s0)
     eb0:	e400                	sd	s0,8(s0)
     eb2:	e800                	sd	s0,16(s0)
     eb4:	4501                	li	a0,0
     eb6:	60a2                	ld	ra,8(sp)
     eb8:	6402                	ld	s0,0(sp)
     eba:	0141                	addi	sp,sp,16
     ebc:	8082                	ret
     ebe:	557d                	li	a0,-1
     ec0:	bfdd                	j	eb6 <__init_tp+0x58>

0000000000000ec2 <__copy_tls>:
     ec2:	7139                	addi	sp,sp,-64
     ec4:	ec4e                	sd	s3,24(sp)
     ec6:	00007997          	auipc	s3,0x7
     eca:	0e298993          	addi	s3,s3,226 # 7fa8 <__libc>
     ece:	0289b783          	ld	a5,40(s3)
     ed2:	f426                	sd	s1,40(sp)
     ed4:	0189b483          	ld	s1,24(s3)
     ed8:	078e                	slli	a5,a5,0x3
     eda:	f3800713          	li	a4,-200
     ede:	14e1                	addi	s1,s1,-8
     ee0:	8c9d                	sub	s1,s1,a5
     ee2:	0209b783          	ld	a5,32(s3)
     ee6:	8f09                	sub	a4,a4,a0
     ee8:	f04a                	sd	s2,32(sp)
     eea:	17fd                	addi	a5,a5,-1
     eec:	8ff9                	and	a5,a5,a4
     eee:	0109b903          	ld	s2,16(s3)
     ef2:	f822                	sd	s0,48(sp)
     ef4:	e456                	sd	s5,8(sp)
     ef6:	94aa                	add	s1,s1,a0
     ef8:	00f50433          	add	s0,a0,a5
     efc:	6a85                	lui	s5,0x1
     efe:	e852                	sd	s4,16(sp)
     f00:	e05a                	sd	s6,0(sp)
     f02:	fc06                	sd	ra,56(sp)
     f04:	0c840b13          	addi	s6,s0,200
     f08:	00848a13          	addi	s4,s1,8
     f0c:	800a8a93          	addi	s5,s5,-2048 # 800 <benchmark_body+0x94>
     f10:	02091163          	bnez	s2,f32 <__copy_tls+0x70>
     f14:	0289b783          	ld	a5,40(s3)
     f18:	70e2                	ld	ra,56(sp)
     f1a:	8522                	mv	a0,s0
     f1c:	e09c                	sd	a5,0(s1)
     f1e:	e064                	sd	s1,192(s0)
     f20:	7442                	ld	s0,48(sp)
     f22:	74a2                	ld	s1,40(sp)
     f24:	7902                	ld	s2,32(sp)
     f26:	69e2                	ld	s3,24(sp)
     f28:	6a42                	ld	s4,16(sp)
     f2a:	6aa2                	ld	s5,8(sp)
     f2c:	6b02                	ld	s6,0(sp)
     f2e:	6121                	addi	sp,sp,64
     f30:	8082                	ret
     f32:	02893783          	ld	a5,40(s2)
     f36:	00893583          	ld	a1,8(s2)
     f3a:	0a21                	addi	s4,s4,8
     f3c:	97da                	add	a5,a5,s6
     f3e:	97d6                	add	a5,a5,s5
     f40:	fefa3c23          	sd	a5,-8(s4)
     f44:	02893503          	ld	a0,40(s2)
     f48:	01093603          	ld	a2,16(s2)
     f4c:	955a                	add	a0,a0,s6
     f4e:	150000ef          	jal	ra,109e <memcpy>
     f52:	00093903          	ld	s2,0(s2)
     f56:	bf6d                	j	f10 <__copy_tls+0x4e>

0000000000000f58 <__init_tls>:
     f58:	01853e83          	ld	t4,24(a0)
     f5c:	00003317          	auipc	t1,0x3
     f60:	0b830313          	addi	t1,t1,184 # 4014 <__default_stacksize>
     f64:	02853803          	ld	a6,40(a0)
     f68:	00032583          	lw	a1,0(t1)
     f6c:	1141                	addi	sp,sp,-16
     f6e:	6474e8b7          	lui	a7,0x6474e
     f72:	e406                	sd	ra,8(sp)
     f74:	e022                	sd	s0,0(sp)
     f76:	87f6                	mv	a5,t4
     f78:	4e01                	li	t3,0
     f7a:	4701                	li	a4,0
     f7c:	4681                	li	a3,0
     f7e:	4f99                	li	t6,6
     f80:	4289                	li	t0,2
     f82:	00003f17          	auipc	t5,0x3
     f86:	0aef3f03          	ld	t5,174(t5) # 4030 <_GLOBAL_OFFSET_TABLE_+0x8>
     f8a:	439d                	li	t2,7
     f8c:	55188893          	addi	a7,a7,1361 # 6474e551 <__BSS_END__+0x647463a1>
     f90:	008000b7          	lui	ra,0x800
     f94:	0a081263          	bnez	a6,1038 <__init_tls+0xe0>
     f98:	000e0463          	beqz	t3,fa0 <__init_tls+0x48>
     f9c:	00b32023          	sw	a1,0(t1)
     fa0:	00007797          	auipc	a5,0x7
     fa4:	1e078793          	addi	a5,a5,480 # 8180 <main_tls>
     fa8:	00007617          	auipc	a2,0x7
     fac:	00060613          	mv	a2,a2
     fb0:	ce89                	beqz	a3,fca <__init_tls+0x72>
     fb2:	6a8c                	ld	a1,16(a3)
     fb4:	ea1c                	sd	a5,16(a2)
     fb6:	972e                	add	a4,a4,a1
     fb8:	e798                	sd	a4,8(a5)
     fba:	7298                	ld	a4,32(a3)
     fbc:	eb98                	sd	a4,16(a5)
     fbe:	7698                	ld	a4,40(a3)
     fc0:	ef98                	sd	a4,24(a5)
     fc2:	7a98                	ld	a4,48(a3)
     fc4:	f398                	sd	a4,32(a5)
     fc6:	4705                	li	a4,1
     fc8:	f618                	sd	a4,40(a2)
     fca:	0187b803          	ld	a6,24(a5)
     fce:	6794                	ld	a3,8(a5)
     fd0:	738c                	ld	a1,32(a5)
     fd2:	00d80733          	add	a4,a6,a3
     fd6:	fff58513          	addi	a0,a1,-1
     fda:	40e00733          	neg	a4,a4
     fde:	8f69                	and	a4,a4,a0
     fe0:	8ee9                	and	a3,a3,a0
     fe2:	9742                	add	a4,a4,a6
     fe4:	ef98                	sd	a4,24(a5)
     fe6:	f794                	sd	a3,40(a5)
     fe8:	451d                	li	a0,7
     fea:	00b56463          	bltu	a0,a1,ff2 <__init_tls+0x9a>
     fee:	45a1                	li	a1,8
     ff0:	f38c                	sd	a1,32(a5)
     ff2:	739c                	ld	a5,32(a5)
     ff4:	00007517          	auipc	a0,0x7
     ff8:	03c50513          	addi	a0,a0,60 # 8030 <builtin_tls>
     ffc:	0df78593          	addi	a1,a5,223
    1000:	95b6                	add	a1,a1,a3
    1002:	95ba                	add	a1,a1,a4
    1004:	99e1                	andi	a1,a1,-8
    1006:	f21c                	sd	a5,32(a2)
    1008:	ee0c                	sd	a1,24(a2)
    100a:	15000793          	li	a5,336
    100e:	00b7fc63          	bgeu	a5,a1,1026 <__init_tls+0xce>
    1012:	0de00893          	li	a7,222
    1016:	4501                	li	a0,0
    1018:	460d                	li	a2,3
    101a:	02200693          	li	a3,34
    101e:	577d                	li	a4,-1
    1020:	4781                	li	a5,0
    1022:	00000073          	ecall
    1026:	e9dff0ef          	jal	ra,ec2 <__copy_tls>
    102a:	e35ff0ef          	jal	ra,e5e <__init_tp>
    102e:	04055b63          	bgez	a0,1084 <__init_tls+0x12c>
    1032:	00000023          	sb	zero,0(zero) # 0 <exit-0x470>
    1036:	9002                	ebreak
    1038:	4390                	lw	a2,0(a5)
    103a:	01f61963          	bne	a2,t6,104c <__init_tls+0xf4>
    103e:	6b98                	ld	a4,16(a5)
    1040:	40ee8733          	sub	a4,t4,a4
    1044:	7110                	ld	a2,32(a0)
    1046:	187d                	addi	a6,a6,-1
    1048:	97b2                	add	a5,a5,a2
    104a:	b7a9                	j	f94 <__init_tls+0x3c>
    104c:	02560463          	beq	a2,t0,1074 <__init_tls+0x11c>
    1050:	02760863          	beq	a2,t2,1080 <__init_tls+0x128>
    1054:	ff1618e3          	bne	a2,a7,1044 <__init_tls+0xec>
    1058:	7790                	ld	a2,40(a5)
    105a:	02059413          	slli	s0,a1,0x20
    105e:	9001                	srli	s0,s0,0x20
    1060:	fec472e3          	bgeu	s0,a2,1044 <__init_tls+0xec>
    1064:	00c0f463          	bgeu	ra,a2,106c <__init_tls+0x114>
    1068:	00800637          	lui	a2,0x800
    106c:	0006059b          	sext.w	a1,a2
    1070:	4e05                	li	t3,1
    1072:	bfc9                	j	1044 <__init_tls+0xec>
    1074:	fc0f08e3          	beqz	t5,1044 <__init_tls+0xec>
    1078:	6b98                	ld	a4,16(a5)
    107a:	40ef0733          	sub	a4,t5,a4
    107e:	b7d9                	j	1044 <__init_tls+0xec>
    1080:	86be                	mv	a3,a5
    1082:	b7c9                	j	1044 <__init_tls+0xec>
    1084:	60a2                	ld	ra,8(sp)
    1086:	6402                	ld	s0,0(sp)
    1088:	0141                	addi	sp,sp,16
    108a:	8082                	ret

000000000000108c <_Exit>:
    108c:	87aa                	mv	a5,a0
    108e:	05e00893          	li	a7,94
    1092:	00000073          	ecall
    1096:	05d00893          	li	a7,93
    109a:	853e                	mv	a0,a5
    109c:	bfdd                	j	1092 <_Exit+0x6>

000000000000109e <memcpy>:
    109e:	0035f793          	andi	a5,a1,3
    10a2:	40078363          	beqz	a5,14a8 <memcpy+0x40a>
    10a6:	22060b63          	beqz	a2,12dc <memcpy+0x23e>
    10aa:	8e2a                	mv	t3,a0
    10ac:	a019                	j	10b2 <memcpy+0x14>
    10ae:	22060663          	beqz	a2,12da <memcpy+0x23c>
    10b2:	0005c703          	lbu	a4,0(a1)
    10b6:	0585                	addi	a1,a1,1
    10b8:	0035f793          	andi	a5,a1,3
    10bc:	00ee0023          	sb	a4,0(t3)
    10c0:	167d                	addi	a2,a2,-1
    10c2:	0e05                	addi	t3,t3,1
    10c4:	f7ed                	bnez	a5,10ae <memcpy+0x10>
    10c6:	003e7693          	andi	a3,t3,3
    10ca:	87f2                	mv	a5,t3
    10cc:	20068963          	beqz	a3,12de <memcpy+0x240>
    10d0:	7139                	addi	sp,sp,-64
    10d2:	fc22                	sd	s0,56(sp)
    10d4:	f826                	sd	s1,48(sp)
    10d6:	f44a                	sd	s2,40(sp)
    10d8:	f04e                	sd	s3,32(sp)
    10da:	ec52                	sd	s4,24(sp)
    10dc:	e856                	sd	s5,16(sp)
    10de:	e45a                	sd	s6,8(sp)
    10e0:	e05e                	sd	s7,0(sp)
    10e2:	47fd                	li	a5,31
    10e4:	0ac7f763          	bgeu	a5,a2,1192 <memcpy+0xf4>
    10e8:	4709                	li	a4,2
    10ea:	0005c803          	lbu	a6,0(a1)
    10ee:	419c                	lw	a5,0(a1)
    10f0:	30e68f63          	beq	a3,a4,140e <memcpy+0x370>
    10f4:	470d                	li	a4,3
    10f6:	28e68863          	beq	a3,a4,1386 <memcpy+0x2e8>
    10fa:	0015c883          	lbu	a7,1(a1)
    10fe:	0025c683          	lbu	a3,2(a1)
    1102:	fec60713          	addi	a4,a2,-20 # 7fffec <__BSS_END__+0x7f7e3c>
    1106:	ff077393          	andi	t2,a4,-16
    110a:	058d                	addi	a1,a1,3
    110c:	003e0413          	addi	s0,t3,3
    1110:	01338913          	addi	s2,t2,19
    1114:	00475493          	srli	s1,a4,0x4
    1118:	010e0023          	sb	a6,0(t3)
    111c:	011e00a3          	sb	a7,1(t3)
    1120:	00de0123          	sb	a3,2(t3)
    1124:	9972                	add	s2,s2,t3
    1126:	832e                	mv	t1,a1
    1128:	8722                	mv	a4,s0
    112a:	00132883          	lw	a7,1(t1)
    112e:	00532803          	lw	a6,5(t1)
    1132:	00932683          	lw	a3,9(t1)
    1136:	0187de1b          	srliw	t3,a5,0x18
    113a:	00d32783          	lw	a5,13(t1)
    113e:	0088929b          	slliw	t0,a7,0x8
    1142:	00881f9b          	slliw	t6,a6,0x8
    1146:	00869f1b          	slliw	t5,a3,0x8
    114a:	0188d89b          	srliw	a7,a7,0x18
    114e:	0188581b          	srliw	a6,a6,0x18
    1152:	0186d69b          	srliw	a3,a3,0x18
    1156:	00879e9b          	slliw	t4,a5,0x8
    115a:	005e6e33          	or	t3,t3,t0
    115e:	01f8e8b3          	or	a7,a7,t6
    1162:	01e86833          	or	a6,a6,t5
    1166:	01d6e6b3          	or	a3,a3,t4
    116a:	01c72023          	sw	t3,0(a4)
    116e:	01172223          	sw	a7,4(a4)
    1172:	01072423          	sw	a6,8(a4)
    1176:	c754                	sw	a3,12(a4)
    1178:	0741                	addi	a4,a4,16
    117a:	0341                	addi	t1,t1,16
    117c:	fb2717e3          	bne	a4,s2,112a <memcpy+0x8c>
    1180:	00148793          	addi	a5,s1,1
    1184:	0792                	slli	a5,a5,0x4
    1186:	1635                	addi	a2,a2,-19
    1188:	40760633          	sub	a2,a2,t2
    118c:	00f40e33          	add	t3,s0,a5
    1190:	95be                	add	a1,a1,a5
    1192:	01067793          	andi	a5,a2,16
    1196:	00867713          	andi	a4,a2,8
    119a:	00467813          	andi	a6,a2,4
    119e:	00267693          	andi	a3,a2,2
    11a2:	8a05                	andi	a2,a2,1
    11a4:	34078163          	beqz	a5,14e6 <memcpy+0x448>
    11a8:	00e5c783          	lbu	a5,14(a1)
    11ac:	0005cb83          	lbu	s7,0(a1)
    11b0:	0015cb03          	lbu	s6,1(a1)
    11b4:	0025ca83          	lbu	s5,2(a1)
    11b8:	0035ca03          	lbu	s4,3(a1)
    11bc:	0045c983          	lbu	s3,4(a1)
    11c0:	0055c903          	lbu	s2,5(a1)
    11c4:	0065c483          	lbu	s1,6(a1)
    11c8:	0075c403          	lbu	s0,7(a1)
    11cc:	0085c383          	lbu	t2,8(a1)
    11d0:	0095c283          	lbu	t0,9(a1)
    11d4:	00a5cf83          	lbu	t6,10(a1)
    11d8:	00b5cf03          	lbu	t5,11(a1)
    11dc:	00c5ce83          	lbu	t4,12(a1)
    11e0:	00d5c303          	lbu	t1,13(a1)
    11e4:	00f5c883          	lbu	a7,15(a1)
    11e8:	00fe0723          	sb	a5,14(t3)
    11ec:	017e0023          	sb	s7,0(t3)
    11f0:	016e00a3          	sb	s6,1(t3)
    11f4:	015e0123          	sb	s5,2(t3)
    11f8:	014e01a3          	sb	s4,3(t3)
    11fc:	013e0223          	sb	s3,4(t3)
    1200:	012e02a3          	sb	s2,5(t3)
    1204:	009e0323          	sb	s1,6(t3)
    1208:	008e03a3          	sb	s0,7(t3)
    120c:	007e0423          	sb	t2,8(t3)
    1210:	005e04a3          	sb	t0,9(t3)
    1214:	01fe0523          	sb	t6,10(t3)
    1218:	01ee05a3          	sb	t5,11(t3)
    121c:	01de0623          	sb	t4,12(t3)
    1220:	006e06a3          	sb	t1,13(t3)
    1224:	05c1                	addi	a1,a1,16
    1226:	010e0793          	addi	a5,t3,16
    122a:	011e07a3          	sb	a7,15(t3)
    122e:	26070b63          	beqz	a4,14a4 <memcpy+0x406>
    1232:	0065c703          	lbu	a4,6(a1)
    1236:	0005c283          	lbu	t0,0(a1)
    123a:	0015cf83          	lbu	t6,1(a1)
    123e:	0025cf03          	lbu	t5,2(a1)
    1242:	0035ce83          	lbu	t4,3(a1)
    1246:	0045ce03          	lbu	t3,4(a1)
    124a:	0055c303          	lbu	t1,5(a1)
    124e:	0075c883          	lbu	a7,7(a1)
    1252:	00e78323          	sb	a4,6(a5)
    1256:	00578023          	sb	t0,0(a5)
    125a:	01f780a3          	sb	t6,1(a5)
    125e:	01e78123          	sb	t5,2(a5)
    1262:	01d781a3          	sb	t4,3(a5)
    1266:	01c78223          	sb	t3,4(a5)
    126a:	006782a3          	sb	t1,5(a5)
    126e:	05a1                	addi	a1,a1,8
    1270:	00878713          	addi	a4,a5,8
    1274:	011783a3          	sb	a7,7(a5)
    1278:	26080563          	beqz	a6,14e2 <memcpy+0x444>
    127c:	0025c783          	lbu	a5,2(a1)
    1280:	0005c303          	lbu	t1,0(a1)
    1284:	0015c883          	lbu	a7,1(a1)
    1288:	0035c803          	lbu	a6,3(a1)
    128c:	00f70123          	sb	a5,2(a4)
    1290:	00670023          	sb	t1,0(a4)
    1294:	011700a3          	sb	a7,1(a4)
    1298:	0591                	addi	a1,a1,4
    129a:	00470793          	addi	a5,a4,4
    129e:	010701a3          	sb	a6,3(a4)
    12a2:	1e068f63          	beqz	a3,14a0 <memcpy+0x402>
    12a6:	0005c703          	lbu	a4,0(a1)
    12aa:	0015c683          	lbu	a3,1(a1)
    12ae:	0589                	addi	a1,a1,2
    12b0:	00e78023          	sb	a4,0(a5)
    12b4:	00d780a3          	sb	a3,1(a5)
    12b8:	00278713          	addi	a4,a5,2
    12bc:	c609                	beqz	a2,12c6 <memcpy+0x228>
    12be:	0005c783          	lbu	a5,0(a1)
    12c2:	00f70023          	sb	a5,0(a4)
    12c6:	7462                	ld	s0,56(sp)
    12c8:	74c2                	ld	s1,48(sp)
    12ca:	7922                	ld	s2,40(sp)
    12cc:	7982                	ld	s3,32(sp)
    12ce:	6a62                	ld	s4,24(sp)
    12d0:	6ac2                	ld	s5,16(sp)
    12d2:	6b22                	ld	s6,8(sp)
    12d4:	6b82                	ld	s7,0(sp)
    12d6:	6121                	addi	sp,sp,64
    12d8:	8082                	ret
    12da:	8082                	ret
    12dc:	8082                	ret
    12de:	473d                	li	a4,15
    12e0:	04c77963          	bgeu	a4,a2,1332 <memcpy+0x294>
    12e4:	01c5e733          	or	a4,a1,t3
    12e8:	8b1d                	andi	a4,a4,7
    12ea:	ff060e93          	addi	t4,a2,-16
    12ee:	1a071f63          	bnez	a4,14ac <memcpy+0x40e>
    12f2:	010eb713          	sltiu	a4,t4,16
    12f6:	00174713          	xori	a4,a4,1
    12fa:	0ff77713          	zext.b	a4,a4
    12fe:	1a070763          	beqz	a4,14ac <memcpy+0x40e>
    1302:	004ede93          	srli	t4,t4,0x4
    1306:	001e8313          	addi	t1,t4,1
    130a:	872e                	mv	a4,a1
    130c:	00873883          	ld	a7,8(a4)
    1310:	00073803          	ld	a6,0(a4)
    1314:	0685                	addi	a3,a3,1
    1316:	0117b423          	sd	a7,8(a5)
    131a:	0107b023          	sd	a6,0(a5)
    131e:	0741                	addi	a4,a4,16
    1320:	07c1                	addi	a5,a5,16
    1322:	fe66e5e3          	bltu	a3,t1,130c <memcpy+0x26e>
    1326:	001e8793          	addi	a5,t4,1
    132a:	0792                	slli	a5,a5,0x4
    132c:	8a3d                	andi	a2,a2,15
    132e:	9e3e                	add	t3,t3,a5
    1330:	95be                	add	a1,a1,a5
    1332:	00867693          	andi	a3,a2,8
    1336:	00467713          	andi	a4,a2,4
    133a:	00267793          	andi	a5,a2,2
    133e:	8a05                	andi	a2,a2,1
    1340:	ca91                	beqz	a3,1354 <memcpy+0x2b6>
    1342:	0005a803          	lw	a6,0(a1)
    1346:	41d4                	lw	a3,4(a1)
    1348:	0e21                	addi	t3,t3,8
    134a:	05a1                	addi	a1,a1,8
    134c:	ff0e2c23          	sw	a6,-8(t3)
    1350:	fede2e23          	sw	a3,-4(t3)
    1354:	c711                	beqz	a4,1360 <memcpy+0x2c2>
    1356:	4198                	lw	a4,0(a1)
    1358:	0e11                	addi	t3,t3,4
    135a:	0591                	addi	a1,a1,4
    135c:	feee2e23          	sw	a4,-4(t3)
    1360:	18078563          	beqz	a5,14ea <memcpy+0x44c>
    1364:	0005c783          	lbu	a5,0(a1)
    1368:	0015c703          	lbu	a4,1(a1)
    136c:	0589                	addi	a1,a1,2
    136e:	00fe0023          	sb	a5,0(t3)
    1372:	00ee00a3          	sb	a4,1(t3)
    1376:	002e0793          	addi	a5,t3,2
    137a:	d22d                	beqz	a2,12dc <memcpy+0x23e>
    137c:	0005c703          	lbu	a4,0(a1)
    1380:	00e78023          	sb	a4,0(a5)
    1384:	8082                	ret
    1386:	fec60713          	addi	a4,a2,-20
    138a:	ff077413          	andi	s0,a4,-16
    138e:	0585                	addi	a1,a1,1
    1390:	001e0493          	addi	s1,t3,1
    1394:	01140393          	addi	t2,s0,17
    1398:	00475913          	srli	s2,a4,0x4
    139c:	010e0023          	sb	a6,0(t3)
    13a0:	93f2                	add	t2,t2,t3
    13a2:	832e                	mv	t1,a1
    13a4:	8726                	mv	a4,s1
    13a6:	00332883          	lw	a7,3(t1)
    13aa:	00732803          	lw	a6,7(t1)
    13ae:	00b32683          	lw	a3,11(t1)
    13b2:	0087de1b          	srliw	t3,a5,0x8
    13b6:	00f32783          	lw	a5,15(t1)
    13ba:	0188929b          	slliw	t0,a7,0x18
    13be:	01881f9b          	slliw	t6,a6,0x18
    13c2:	01869f1b          	slliw	t5,a3,0x18
    13c6:	0088d89b          	srliw	a7,a7,0x8
    13ca:	0088581b          	srliw	a6,a6,0x8
    13ce:	0086d69b          	srliw	a3,a3,0x8
    13d2:	01879e9b          	slliw	t4,a5,0x18
    13d6:	005e6e33          	or	t3,t3,t0
    13da:	01f8e8b3          	or	a7,a7,t6
    13de:	01e86833          	or	a6,a6,t5
    13e2:	01d6e6b3          	or	a3,a3,t4
    13e6:	01c72023          	sw	t3,0(a4)
    13ea:	01172223          	sw	a7,4(a4)
    13ee:	01072423          	sw	a6,8(a4)
    13f2:	c754                	sw	a3,12(a4)
    13f4:	0741                	addi	a4,a4,16
    13f6:	0341                	addi	t1,t1,16
    13f8:	fa7717e3          	bne	a4,t2,13a6 <memcpy+0x308>
    13fc:	00190793          	addi	a5,s2,1
    1400:	0792                	slli	a5,a5,0x4
    1402:	163d                	addi	a2,a2,-17
    1404:	8e01                	sub	a2,a2,s0
    1406:	00f48e33          	add	t3,s1,a5
    140a:	95be                	add	a1,a1,a5
    140c:	b359                	j	1192 <memcpy+0xf4>
    140e:	0015c683          	lbu	a3,1(a1)
    1412:	fec60713          	addi	a4,a2,-20
    1416:	ff077393          	andi	t2,a4,-16
    141a:	0589                	addi	a1,a1,2
    141c:	002e0413          	addi	s0,t3,2
    1420:	01238913          	addi	s2,t2,18
    1424:	00475493          	srli	s1,a4,0x4
    1428:	010e0023          	sb	a6,0(t3)
    142c:	00de00a3          	sb	a3,1(t3)
    1430:	9972                	add	s2,s2,t3
    1432:	832e                	mv	t1,a1
    1434:	8722                	mv	a4,s0
    1436:	00232883          	lw	a7,2(t1)
    143a:	00632803          	lw	a6,6(t1)
    143e:	00a32683          	lw	a3,10(t1)
    1442:	0107de1b          	srliw	t3,a5,0x10
    1446:	00e32783          	lw	a5,14(t1)
    144a:	0108929b          	slliw	t0,a7,0x10
    144e:	01081f9b          	slliw	t6,a6,0x10
    1452:	01069f1b          	slliw	t5,a3,0x10
    1456:	0108d89b          	srliw	a7,a7,0x10
    145a:	0108581b          	srliw	a6,a6,0x10
    145e:	0106d69b          	srliw	a3,a3,0x10
    1462:	01079e9b          	slliw	t4,a5,0x10
    1466:	005e6e33          	or	t3,t3,t0
    146a:	01f8e8b3          	or	a7,a7,t6
    146e:	01e86833          	or	a6,a6,t5
    1472:	01d6e6b3          	or	a3,a3,t4
    1476:	01c72023          	sw	t3,0(a4)
    147a:	01172223          	sw	a7,4(a4)
    147e:	01072423          	sw	a6,8(a4)
    1482:	c754                	sw	a3,12(a4)
    1484:	0741                	addi	a4,a4,16
    1486:	0341                	addi	t1,t1,16
    1488:	fb2717e3          	bne	a4,s2,1436 <memcpy+0x398>
    148c:	00148793          	addi	a5,s1,1
    1490:	0792                	slli	a5,a5,0x4
    1492:	1639                	addi	a2,a2,-18
    1494:	40760633          	sub	a2,a2,t2
    1498:	00f40e33          	add	t3,s0,a5
    149c:	95be                	add	a1,a1,a5
    149e:	b9d5                	j	1192 <memcpy+0xf4>
    14a0:	873e                	mv	a4,a5
    14a2:	bd29                	j	12bc <memcpy+0x21e>
    14a4:	873e                	mv	a4,a5
    14a6:	bbc9                	j	1278 <memcpy+0x1da>
    14a8:	8e2a                	mv	t3,a0
    14aa:	b931                	j	10c6 <memcpy+0x28>
    14ac:	004ede93          	srli	t4,t4,0x4
    14b0:	001e8f13          	addi	t5,t4,1
    14b4:	0f12                	slli	t5,t5,0x4
    14b6:	9f2e                	add	t5,t5,a1
    14b8:	87ae                	mv	a5,a1
    14ba:	8772                	mv	a4,t3
    14bc:	0007a303          	lw	t1,0(a5)
    14c0:	0047a883          	lw	a7,4(a5)
    14c4:	0087a803          	lw	a6,8(a5)
    14c8:	47d4                	lw	a3,12(a5)
    14ca:	00672023          	sw	t1,0(a4)
    14ce:	01172223          	sw	a7,4(a4)
    14d2:	01072423          	sw	a6,8(a4)
    14d6:	c754                	sw	a3,12(a4)
    14d8:	07c1                	addi	a5,a5,16
    14da:	0741                	addi	a4,a4,16
    14dc:	feff10e3          	bne	t5,a5,14bc <memcpy+0x41e>
    14e0:	b599                	j	1326 <memcpy+0x288>
    14e2:	87ba                	mv	a5,a4
    14e4:	bb7d                	j	12a2 <memcpy+0x204>
    14e6:	87f2                	mv	a5,t3
    14e8:	b399                	j	122e <memcpy+0x190>
    14ea:	87f2                	mv	a5,t3
    14ec:	b579                	j	137a <memcpy+0x2dc>

00000000000014ee <__set_thread_area>:
    14ee:	822a                	mv	tp,a0
    14f0:	4501                	li	a0,0
    14f2:	8082                	ret
