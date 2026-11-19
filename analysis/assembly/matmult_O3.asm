
build/embench_ROI_O3/src/matmult-int/matmult-int:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000470 <exit>:
     470:	1101                	addi	sp,sp,-32
     472:	e42a                	sd	a0,8(sp)
     474:	ec06                	sd	ra,24(sp)
     476:	35b000ef          	jal	ra,fd0 <__stdio_exit>
     47a:	359000ef          	jal	ra,fd2 <__libc_exit_fini>
     47e:	00004317          	auipc	t1,0x4
     482:	c0a33303          	ld	t1,-1014(t1) # 4088 <_GLOBAL_OFFSET_TABLE_+0x60>
     486:	9302                	jalr	t1
     488:	6522                	ld	a0,8(sp)
     48a:	6a3000ef          	jal	ra,132c <_Exit>

000000000000048e <main>:
     48e:	1101                	addi	sp,sp,-32
     490:	ec06                	sd	ra,24(sp)
     492:	0b3000ef          	jal	ra,d44 <initialise_board>
     496:	560000ef          	jal	ra,9f6 <initialise_benchmark>
     49a:	4505                	li	a0,1
     49c:	480000ef          	jal	ra,91c <warm_caches>
     4a0:	0a7000ef          	jal	ra,d46 <start_trigger>
     4a4:	47a000ef          	jal	ra,91e <benchmark>
     4a8:	c62a                	sw	a0,12(sp)
     4aa:	0a3000ef          	jal	ra,d4c <stop_trigger>
     4ae:	4532                	lw	a0,12(sp)
     4b0:	5d2000ef          	jal	ra,a82 <verify_benchmark>
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
     4f6:	2a70006f          	j	f9c <__libc_start_main>

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
     6a0:	d9050513          	addi	a0,a0,-624 # 242c <__FRAME_END__>
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
     6ce:	d6250513          	addi	a0,a0,-670 # 242c <__FRAME_END__>
     6d2:	9782                	jalr	a5
     6d4:	60a2                	ld	ra,8(sp)
     6d6:	0141                	addi	sp,sp,16
     6d8:	b78d                	j	63a <register_tm_clones>
     6da:	b785                	j	63a <register_tm_clones>

00000000000006dc <benchmark_body.constprop.0>:
     6dc:	7139                	addi	sp,sp,-64
     6de:	f822                	sd	s0,48(sp)
     6e0:	f426                	sd	s1,40(sp)
     6e2:	f04a                	sd	s2,32(sp)
     6e4:	e852                	sd	s4,16(sp)
     6e6:	e05a                	sd	s6,0(sp)
     6e8:	fc06                	sd	ra,56(sp)
     6ea:	ec4e                	sd	s3,24(sp)
     6ec:	e456                	sd	s5,8(sp)
     6ee:	02700b13          	li	s6,39
     6f2:	00008917          	auipc	s2,0x8
     6f6:	88690913          	addi	s2,s2,-1914 # 7f78 <seed>
     6fa:	00006497          	auipc	s1,0x6
     6fe:	f7e48493          	addi	s1,s1,-130 # 6678 <ArrayA>
     702:	00004417          	auipc	s0,0x4
     706:	67640413          	addi	s0,s0,1654 # 4d78 <ArrayB>
     70a:	4a51                	li	s4,20
     70c:	00007797          	auipc	a5,0x7
     710:	bec78793          	addi	a5,a5,-1044 # 72f8 <ArrayA_ref>
     714:	00006717          	auipc	a4,0x6
     718:	f6470713          	addi	a4,a4,-156 # 6678 <ArrayA>
     71c:	6388                	ld	a0,0(a5)
     71e:	678c                	ld	a1,8(a5)
     720:	6b90                	ld	a2,16(a5)
     722:	6f94                	ld	a3,24(a5)
     724:	e308                	sd	a0,0(a4)
     726:	e70c                	sd	a1,8(a4)
     728:	eb10                	sd	a2,16(a4)
     72a:	ef14                	sd	a3,24(a4)
     72c:	02078793          	addi	a5,a5,32
     730:	02070713          	addi	a4,a4,32
     734:	ff2794e3          	bne	a5,s2,71c <benchmark_body.constprop.0+0x40>
     738:	00005797          	auipc	a5,0x5
     73c:	2c078793          	addi	a5,a5,704 # 59f8 <ArrayB_ref>
     740:	00004717          	auipc	a4,0x4
     744:	63870713          	addi	a4,a4,1592 # 4d78 <ArrayB>
     748:	6388                	ld	a0,0(a5)
     74a:	678c                	ld	a1,8(a5)
     74c:	6b90                	ld	a2,16(a5)
     74e:	6f94                	ld	a3,24(a5)
     750:	e308                	sd	a0,0(a4)
     752:	e70c                	sd	a1,8(a4)
     754:	eb10                	sd	a2,16(a4)
     756:	ef14                	sd	a3,24(a4)
     758:	02078793          	addi	a5,a5,32
     75c:	02070713          	addi	a4,a4,32
     760:	fe9794e3          	bne	a5,s1,748 <benchmark_body.constprop.0+0x6c>
     764:	00004e17          	auipc	t3,0x4
     768:	994e0e13          	addi	t3,t3,-1644 # 40f8 <ResultArray>
     76c:	00004997          	auipc	s3,0x4
     770:	a2c98993          	addi	s3,s3,-1492 # 4198 <ResultArray+0xa0>
     774:	00006a97          	auipc	s5,0x6
     778:	f04a8a93          	addi	s5,s5,-252 # 6678 <ArrayA>
     77c:	4581                	li	a1,0
     77e:	8572                	mv	a0,t3
     780:	0a000613          	li	a2,160
     784:	0ab000ef          	jal	ra,102e <memset>
     788:	8e2a                	mv	t3,a0
     78a:	85d6                	mv	a1,s5
     78c:	00004517          	auipc	a0,0x4
     790:	5ec50513          	addi	a0,a0,1516 # 4d78 <ArrayB>
     794:	4681                	li	a3,0
     796:	0005b303          	ld	t1,0(a1)
     79a:	862a                	mv	a2,a0
     79c:	87f2                	mv	a5,t3
     79e:	6218                	ld	a4,0(a2)
     7a0:	0007b883          	ld	a7,0(a5)
     7a4:	4801                	li	a6,0
     7a6:	02e30733          	mul	a4,t1,a4
     7aa:	c291                	beqz	a3,7ae <benchmark_body.constprop.0+0xd2>
     7ac:	8846                	mv	a6,a7
     7ae:	07a1                	addi	a5,a5,8
     7b0:	9742                	add	a4,a4,a6
     7b2:	fee7bc23          	sd	a4,-8(a5)
     7b6:	0621                	addi	a2,a2,8
     7b8:	fef993e3          	bne	s3,a5,79e <benchmark_body.constprop.0+0xc2>
     7bc:	2685                	addiw	a3,a3,1
     7be:	05a1                	addi	a1,a1,8
     7c0:	0a050513          	addi	a0,a0,160
     7c4:	fd4699e3          	bne	a3,s4,796 <benchmark_body.constprop.0+0xba>
     7c8:	0a0e0e13          	addi	t3,t3,160
     7cc:	0a098993          	addi	s3,s3,160
     7d0:	0a0a8a93          	addi	s5,s5,160
     7d4:	fa8e14e3          	bne	t3,s0,77c <benchmark_body.constprop.0+0xa0>
     7d8:	3b7d                	addiw	s6,s6,-1
     7da:	f20b19e3          	bnez	s6,70c <benchmark_body.constprop.0+0x30>
     7de:	70e2                	ld	ra,56(sp)
     7e0:	7442                	ld	s0,48(sp)
     7e2:	74a2                	ld	s1,40(sp)
     7e4:	7902                	ld	s2,32(sp)
     7e6:	69e2                	ld	s3,24(sp)
     7e8:	6a42                	ld	s4,16(sp)
     7ea:	6aa2                	ld	s5,8(sp)
     7ec:	6b02                	ld	s6,0(sp)
     7ee:	4501                	li	a0,0
     7f0:	6121                	addi	sp,sp,64
     7f2:	8082                	ret

00000000000007f4 <benchmark_body.constprop.1.isra.0>:
     7f4:	10050f63          	beqz	a0,912 <benchmark_body.constprop.1.isra.0+0x11e>
     7f8:	715d                	addi	sp,sp,-80
     7fa:	e0a2                	sd	s0,64(sp)
     7fc:	fc26                	sd	s1,56(sp)
     7fe:	f84a                	sd	s2,48(sp)
     800:	f44e                	sd	s3,40(sp)
     802:	ec56                	sd	s5,24(sp)
     804:	e45e                	sd	s7,8(sp)
     806:	e486                	sd	ra,72(sp)
     808:	f052                	sd	s4,32(sp)
     80a:	e85a                	sd	s6,16(sp)
     80c:	842a                	mv	s0,a0
     80e:	4b81                	li	s7,0
     810:	00007997          	auipc	s3,0x7
     814:	76898993          	addi	s3,s3,1896 # 7f78 <seed>
     818:	00006917          	auipc	s2,0x6
     81c:	e6090913          	addi	s2,s2,-416 # 6678 <ArrayA>
     820:	00004497          	auipc	s1,0x4
     824:	55848493          	addi	s1,s1,1368 # 4d78 <ArrayB>
     828:	4ad1                	li	s5,20
     82a:	00007797          	auipc	a5,0x7
     82e:	ace78793          	addi	a5,a5,-1330 # 72f8 <ArrayA_ref>
     832:	00006717          	auipc	a4,0x6
     836:	e4670713          	addi	a4,a4,-442 # 6678 <ArrayA>
     83a:	6388                	ld	a0,0(a5)
     83c:	678c                	ld	a1,8(a5)
     83e:	6b90                	ld	a2,16(a5)
     840:	6f94                	ld	a3,24(a5)
     842:	e308                	sd	a0,0(a4)
     844:	e70c                	sd	a1,8(a4)
     846:	eb10                	sd	a2,16(a4)
     848:	ef14                	sd	a3,24(a4)
     84a:	02078793          	addi	a5,a5,32
     84e:	02070713          	addi	a4,a4,32
     852:	ff3794e3          	bne	a5,s3,83a <benchmark_body.constprop.1.isra.0+0x46>
     856:	00005797          	auipc	a5,0x5
     85a:	1a278793          	addi	a5,a5,418 # 59f8 <ArrayB_ref>
     85e:	00004717          	auipc	a4,0x4
     862:	51a70713          	addi	a4,a4,1306 # 4d78 <ArrayB>
     866:	6388                	ld	a0,0(a5)
     868:	678c                	ld	a1,8(a5)
     86a:	6b90                	ld	a2,16(a5)
     86c:	6f94                	ld	a3,24(a5)
     86e:	e308                	sd	a0,0(a4)
     870:	e70c                	sd	a1,8(a4)
     872:	eb10                	sd	a2,16(a4)
     874:	ef14                	sd	a3,24(a4)
     876:	02078793          	addi	a5,a5,32
     87a:	02070713          	addi	a4,a4,32
     87e:	ff2794e3          	bne	a5,s2,866 <benchmark_body.constprop.1.isra.0+0x72>
     882:	00004e17          	auipc	t3,0x4
     886:	876e0e13          	addi	t3,t3,-1930 # 40f8 <ResultArray>
     88a:	00004a17          	auipc	s4,0x4
     88e:	90ea0a13          	addi	s4,s4,-1778 # 4198 <ResultArray+0xa0>
     892:	00006b17          	auipc	s6,0x6
     896:	de6b0b13          	addi	s6,s6,-538 # 6678 <ArrayA>
     89a:	4581                	li	a1,0
     89c:	8572                	mv	a0,t3
     89e:	0a000613          	li	a2,160
     8a2:	78c000ef          	jal	ra,102e <memset>
     8a6:	8e2a                	mv	t3,a0
     8a8:	85da                	mv	a1,s6
     8aa:	00004517          	auipc	a0,0x4
     8ae:	4ce50513          	addi	a0,a0,1230 # 4d78 <ArrayB>
     8b2:	4681                	li	a3,0
     8b4:	0005b303          	ld	t1,0(a1)
     8b8:	862a                	mv	a2,a0
     8ba:	87f2                	mv	a5,t3
     8bc:	6218                	ld	a4,0(a2)
     8be:	0007b883          	ld	a7,0(a5)
     8c2:	4801                	li	a6,0
     8c4:	02e30733          	mul	a4,t1,a4
     8c8:	c291                	beqz	a3,8cc <benchmark_body.constprop.1.isra.0+0xd8>
     8ca:	8846                	mv	a6,a7
     8cc:	07a1                	addi	a5,a5,8
     8ce:	9742                	add	a4,a4,a6
     8d0:	fee7bc23          	sd	a4,-8(a5)
     8d4:	0621                	addi	a2,a2,8
     8d6:	fefa13e3          	bne	s4,a5,8bc <benchmark_body.constprop.1.isra.0+0xc8>
     8da:	2685                	addiw	a3,a3,1
     8dc:	05a1                	addi	a1,a1,8
     8de:	0a050513          	addi	a0,a0,160
     8e2:	fd5699e3          	bne	a3,s5,8b4 <benchmark_body.constprop.1.isra.0+0xc0>
     8e6:	0a0e0e13          	addi	t3,t3,160
     8ea:	0a0a0a13          	addi	s4,s4,160
     8ee:	0a0b0b13          	addi	s6,s6,160
     8f2:	fa9e14e3          	bne	t3,s1,89a <benchmark_body.constprop.1.isra.0+0xa6>
     8f6:	2b85                	addiw	s7,s7,1
     8f8:	f28b99e3          	bne	s7,s0,82a <benchmark_body.constprop.1.isra.0+0x36>
     8fc:	60a6                	ld	ra,72(sp)
     8fe:	6406                	ld	s0,64(sp)
     900:	74e2                	ld	s1,56(sp)
     902:	7942                	ld	s2,48(sp)
     904:	79a2                	ld	s3,40(sp)
     906:	7a02                	ld	s4,32(sp)
     908:	6ae2                	ld	s5,24(sp)
     90a:	6b42                	ld	s6,16(sp)
     90c:	6ba2                	ld	s7,8(sp)
     90e:	6161                	addi	sp,sp,80
     910:	8082                	ret
     912:	8082                	ret

0000000000000914 <values_match>:
     914:	8d0d                	sub	a0,a0,a1
     916:	00153513          	seqz	a0,a0
     91a:	8082                	ret

000000000000091c <warm_caches>:
     91c:	bde1                	j	7f4 <benchmark_body.constprop.1.isra.0>

000000000000091e <benchmark>:
     91e:	bb7d                	j	6dc <benchmark_body.constprop.0>

0000000000000920 <InitSeed>:
     920:	00003797          	auipc	a5,0x3
     924:	7c07a823          	sw	zero,2000(a5) # 40f0 <Seed>
     928:	8082                	ret

000000000000092a <Test>:
     92a:	6305                	lui	t1,0x1
     92c:	c8030313          	addi	t1,t1,-896 # c80 <realloc_beebs+0x7c>
     930:	8e2e                	mv	t3,a1
     932:	88b2                	mv	a7,a2
     934:	0a050513          	addi	a0,a0,160
     938:	9332                	add	t1,t1,a2
     93a:	0a058f93          	addi	t6,a1,160
     93e:	8ef2                	mv	t4,t3
     940:	8846                	mv	a6,a7
     942:	f6050f13          	addi	t5,a0,-160
     946:	00083023          	sd	zero,0(a6)
     94a:	87fa                	mv	a5,t5
     94c:	8676                	mv	a2,t4
     94e:	4681                	li	a3,0
     950:	6398                	ld	a4,0(a5)
     952:	620c                	ld	a1,0(a2)
     954:	07a1                	addi	a5,a5,8
     956:	0a060613          	addi	a2,a2,160
     95a:	02b70733          	mul	a4,a4,a1
     95e:	96ba                	add	a3,a3,a4
     960:	00d83023          	sd	a3,0(a6)
     964:	fea796e3          	bne	a5,a0,950 <Test+0x26>
     968:	0ea1                	addi	t4,t4,8
     96a:	0821                	addi	a6,a6,8
     96c:	fdfe9de3          	bne	t4,t6,946 <Test+0x1c>
     970:	0a088893          	addi	a7,a7,160
     974:	0a078513          	addi	a0,a5,160
     978:	fc6893e3          	bne	a7,t1,93e <Test+0x14>
     97c:	8082                	ret

000000000000097e <RandomInteger>:
     97e:	00003717          	auipc	a4,0x3
     982:	77270713          	addi	a4,a4,1906 # 40f0 <Seed>
     986:	431c                	lw	a5,0(a4)
     988:	0057951b          	slliw	a0,a5,0x5
     98c:	9d3d                	addw	a0,a0,a5
     98e:	0025151b          	slliw	a0,a0,0x2
     992:	9d3d                	addw	a0,a0,a5
     994:	6789                	lui	a5,0x2
     996:	f9f7879b          	addiw	a5,a5,-97
     99a:	0515051b          	addiw	a0,a0,81
     99e:	02f5653b          	remw	a0,a0,a5
     9a2:	c308                	sw	a0,0(a4)
     9a4:	8082                	ret

00000000000009a6 <Multiply>:
     9a6:	8fae                	mv	t6,a1
     9a8:	0a050813          	addi	a6,a0,160
     9ac:	8eb2                	mv	t4,a2
     9ae:	4f01                	li	t5,0
     9b0:	0a058e13          	addi	t3,a1,160
     9b4:	42d1                	li	t0,20
     9b6:	88fe                	mv	a7,t6
     9b8:	8576                	mv	a0,t4
     9ba:	f6080313          	addi	t1,a6,-160
     9be:	00053023          	sd	zero,0(a0)
     9c2:	879a                	mv	a5,t1
     9c4:	8646                	mv	a2,a7
     9c6:	4681                	li	a3,0
     9c8:	6398                	ld	a4,0(a5)
     9ca:	620c                	ld	a1,0(a2)
     9cc:	07a1                	addi	a5,a5,8
     9ce:	0a060613          	addi	a2,a2,160
     9d2:	02b70733          	mul	a4,a4,a1
     9d6:	96ba                	add	a3,a3,a4
     9d8:	e114                	sd	a3,0(a0)
     9da:	ff0797e3          	bne	a5,a6,9c8 <Multiply+0x22>
     9de:	08a1                	addi	a7,a7,8
     9e0:	0521                	addi	a0,a0,8
     9e2:	fdc89ee3          	bne	a7,t3,9be <Multiply+0x18>
     9e6:	0f05                	addi	t5,t5,1
     9e8:	0a078813          	addi	a6,a5,160 # 20a0 <__set_thread_area+0x912>
     9ec:	0a0e8e93          	addi	t4,t4,160
     9f0:	fc5f13e3          	bne	t5,t0,9b6 <Multiply+0x10>
     9f4:	8082                	ret

00000000000009f6 <initialise_benchmark>:
     9f6:	6589                	lui	a1,0x2
     9f8:	00007617          	auipc	a2,0x7
     9fc:	9a060613          	addi	a2,a2,-1632 # 7398 <ArrayA_ref+0xa0>
     a00:	00007517          	auipc	a0,0x7
     a04:	61850513          	addi	a0,a0,1560 # 8018 <__progname_full>
     a08:	4781                	li	a5,0
     a0a:	f9f5859b          	addiw	a1,a1,-97
     a0e:	f6060693          	addi	a3,a2,-160
     a12:	0057971b          	slliw	a4,a5,0x5
     a16:	9f3d                	addw	a4,a4,a5
     a18:	0027171b          	slliw	a4,a4,0x2
     a1c:	9fb9                	addw	a5,a5,a4
     a1e:	0517879b          	addiw	a5,a5,81
     a22:	02b7e7bb          	remw	a5,a5,a1
     a26:	06a1                	addi	a3,a3,8
     a28:	fef6bc23          	sd	a5,-8(a3)
     a2c:	fec693e3          	bne	a3,a2,a12 <initialise_benchmark+0x1c>
     a30:	0a068613          	addi	a2,a3,160
     a34:	fca61de3          	bne	a2,a0,a0e <initialise_benchmark+0x18>
     a38:	6589                	lui	a1,0x2
     a3a:	00005617          	auipc	a2,0x5
     a3e:	05e60613          	addi	a2,a2,94 # 5a98 <ArrayB_ref+0xa0>
     a42:	00006517          	auipc	a0,0x6
     a46:	cd650513          	addi	a0,a0,-810 # 6718 <ArrayA+0xa0>
     a4a:	f9f5859b          	addiw	a1,a1,-97
     a4e:	f6060693          	addi	a3,a2,-160
     a52:	0057971b          	slliw	a4,a5,0x5
     a56:	9f3d                	addw	a4,a4,a5
     a58:	0027171b          	slliw	a4,a4,0x2
     a5c:	9fb9                	addw	a5,a5,a4
     a5e:	0517879b          	addiw	a5,a5,81
     a62:	02b7e7bb          	remw	a5,a5,a1
     a66:	06a1                	addi	a3,a3,8
     a68:	fef6bc23          	sd	a5,-8(a3)
     a6c:	fed613e3          	bne	a2,a3,a52 <initialise_benchmark+0x5c>
     a70:	0a060613          	addi	a2,a2,160
     a74:	fcc51de3          	bne	a0,a2,a4e <initialise_benchmark+0x58>
     a78:	00003717          	auipc	a4,0x3
     a7c:	66f72c23          	sw	a5,1656(a4) # 40f0 <Seed>
     a80:	8082                	ret

0000000000000a82 <verify_benchmark>:
     a82:	6685                	lui	a3,0x1
     a84:	81010113          	addi	sp,sp,-2032
     a88:	77fd                	lui	a5,0xfffff
     a8a:	c8068693          	addi	a3,a3,-896 # c80 <realloc_beebs+0x7c>
     a8e:	96be                	add	a3,a3,a5
     a90:	7e113423          	sd	ra,2024(sp)
     a94:	b6010113          	addi	sp,sp,-1184
     a98:	002687b3          	add	a5,a3,sp
     a9c:	00001717          	auipc	a4,0x1
     aa0:	cfc70713          	addi	a4,a4,-772 # 1798 <__set_thread_area+0xa>
     aa4:	38078793          	addi	a5,a5,896 # fffffffffffff380 <__BSS_END__+0xffffffffffff71d0>
     aa8:	00002697          	auipc	a3,0x2
     aac:	97068693          	addi	a3,a3,-1680 # 2418 <__set_thread_area+0xc8a>
     ab0:	00073803          	ld	a6,0(a4)
     ab4:	6708                	ld	a0,8(a4)
     ab6:	6b0c                	ld	a1,16(a4)
     ab8:	6f10                	ld	a2,24(a4)
     aba:	0107b023          	sd	a6,0(a5)
     abe:	e788                	sd	a0,8(a5)
     ac0:	eb8c                	sd	a1,16(a5)
     ac2:	ef90                	sd	a2,24(a5)
     ac4:	02070713          	addi	a4,a4,32
     ac8:	02078793          	addi	a5,a5,32
     acc:	fed712e3          	bne	a4,a3,ab0 <verify_benchmark+0x2e>
     ad0:	6605                	lui	a2,0x1
     ad2:	75fd                	lui	a1,0xfffff
     ad4:	c8060613          	addi	a2,a2,-896 # c80 <realloc_beebs+0x7c>
     ad8:	38058593          	addi	a1,a1,896 # fffffffffffff380 <__BSS_END__+0xffffffffffff71d0>
     adc:	00b607b3          	add	a5,a2,a1
     ae0:	002785b3          	add	a1,a5,sp
     ae4:	00003517          	auipc	a0,0x3
     ae8:	61450513          	addi	a0,a0,1556 # 40f8 <ResultArray>
     aec:	51e000ef          	jal	ra,100a <memcmp>
     af0:	4a010113          	addi	sp,sp,1184
     af4:	7e813083          	ld	ra,2024(sp)
     af8:	00153513          	seqz	a0,a0
     afc:	7f010113          	addi	sp,sp,2032
     b00:	8082                	ret

0000000000000b02 <rand_beebs>:
     b02:	00007717          	auipc	a4,0x7
     b06:	47670713          	addi	a4,a4,1142 # 7f78 <seed>
     b0a:	6308                	ld	a0,0(a4)
     b0c:	41c657b7          	lui	a5,0x41c65
     b10:	e6d78793          	addi	a5,a5,-403 # 41c64e6d <__BSS_END__+0x41c5ccbd>
     b14:	02f50533          	mul	a0,a0,a5
     b18:	678d                	lui	a5,0x3
     b1a:	03978793          	addi	a5,a5,57 # 3039 <__FRAME_END__+0xc0d>
     b1e:	953e                	add	a0,a0,a5
     b20:	1506                	slli	a0,a0,0x21
     b22:	9105                	srli	a0,a0,0x21
     b24:	e308                	sd	a0,0(a4)
     b26:	8141                	srli	a0,a0,0x10
     b28:	8082                	ret

0000000000000b2a <srand_beebs>:
     b2a:	1502                	slli	a0,a0,0x20
     b2c:	9101                	srli	a0,a0,0x20
     b2e:	00007797          	auipc	a5,0x7
     b32:	44a7b523          	sd	a0,1098(a5) # 7f78 <seed>
     b36:	8082                	ret

0000000000000b38 <init_heap_beebs>:
     b38:	0075f793          	andi	a5,a1,7
     b3c:	ef89                	bnez	a5,b56 <init_heap_beebs+0x1e>
     b3e:	00007797          	auipc	a5,0x7
     b42:	43a78793          	addi	a5,a5,1082 # 7f78 <seed>
     b46:	95aa                	add	a1,a1,a0
     b48:	e788                	sd	a0,8(a5)
     b4a:	eb8c                	sd	a1,16(a5)
     b4c:	00007797          	auipc	a5,0x7
     b50:	4407b223          	sd	zero,1092(a5) # 7f90 <heap_requested>
     b54:	8082                	ret
     b56:	a001                	j	b56 <init_heap_beebs+0x1e>

0000000000000b58 <check_heap_beebs>:
     b58:	00007797          	auipc	a5,0x7
     b5c:	42078793          	addi	a5,a5,1056 # 7f78 <seed>
     b60:	6f98                	ld	a4,24(a5)
     b62:	6b9c                	ld	a5,16(a5)
     b64:	953a                	add	a0,a0,a4
     b66:	00a7b533          	sltu	a0,a5,a0
     b6a:	00154513          	xori	a0,a0,1
     b6e:	2501                	sext.w	a0,a0
     b70:	8082                	ret

0000000000000b72 <malloc_beebs>:
     b72:	87aa                	mv	a5,a0
     b74:	c91d                	beqz	a0,baa <malloc_beebs+0x38>
     b76:	00007717          	auipc	a4,0x7
     b7a:	40270713          	addi	a4,a4,1026 # 7f78 <seed>
     b7e:	6708                	ld	a0,8(a4)
     b80:	6f10                	ld	a2,24(a4)
     b82:	00f506b3          	add	a3,a0,a5
     b86:	0076f593          	andi	a1,a3,7
     b8a:	97b2                	add	a5,a5,a2
     b8c:	e599                	bnez	a1,b9a <malloc_beebs+0x28>
     b8e:	ef1c                	sd	a5,24(a4)
     b90:	6b1c                	ld	a5,16(a4)
     b92:	00d7ec63          	bltu	a5,a3,baa <malloc_beebs+0x38>
     b96:	e714                	sd	a3,8(a4)
     b98:	8082                	ret
     b9a:	4621                	li	a2,8
     b9c:	8e0d                	sub	a2,a2,a1
     b9e:	97b2                	add	a5,a5,a2
     ba0:	ef1c                	sd	a5,24(a4)
     ba2:	6b1c                	ld	a5,16(a4)
     ba4:	96b2                	add	a3,a3,a2
     ba6:	fed7f8e3          	bgeu	a5,a3,b96 <malloc_beebs+0x24>
     baa:	4501                	li	a0,0
     bac:	8082                	ret

0000000000000bae <calloc_beebs>:
     bae:	02b50633          	mul	a2,a0,a1
     bb2:	c631                	beqz	a2,bfe <calloc_beebs+0x50>
     bb4:	00007797          	auipc	a5,0x7
     bb8:	3c478793          	addi	a5,a5,964 # 7f78 <seed>
     bbc:	6798                	ld	a4,8(a5)
     bbe:	6f94                	ld	a3,24(a5)
     bc0:	00c705b3          	add	a1,a4,a2
     bc4:	0075f813          	andi	a6,a1,7
     bc8:	96b2                	add	a3,a3,a2
     bca:	02081163          	bnez	a6,bec <calloc_beebs+0x3e>
     bce:	ef94                	sd	a3,24(a5)
     bd0:	6b94                	ld	a3,16(a5)
     bd2:	02b6e663          	bltu	a3,a1,bfe <calloc_beebs+0x50>
     bd6:	e78c                	sd	a1,8(a5)
     bd8:	c705                	beqz	a4,c00 <calloc_beebs+0x52>
     bda:	1141                	addi	sp,sp,-16
     bdc:	4581                	li	a1,0
     bde:	853a                	mv	a0,a4
     be0:	e406                	sd	ra,8(sp)
     be2:	44c000ef          	jal	ra,102e <memset>
     be6:	60a2                	ld	ra,8(sp)
     be8:	0141                	addi	sp,sp,16
     bea:	8082                	ret
     bec:	4521                	li	a0,8
     bee:	41050533          	sub	a0,a0,a6
     bf2:	96aa                	add	a3,a3,a0
     bf4:	ef94                	sd	a3,24(a5)
     bf6:	6b94                	ld	a3,16(a5)
     bf8:	95aa                	add	a1,a1,a0
     bfa:	fcb6fee3          	bgeu	a3,a1,bd6 <calloc_beebs+0x28>
     bfe:	4701                	li	a4,0
     c00:	853a                	mv	a0,a4
     c02:	8082                	ret

0000000000000c04 <realloc_beebs>:
     c04:	87aa                	mv	a5,a0
     c06:	12050163          	beqz	a0,d28 <realloc_beebs+0x124>
     c0a:	10058f63          	beqz	a1,d28 <realloc_beebs+0x124>
     c0e:	00007717          	auipc	a4,0x7
     c12:	36a70713          	addi	a4,a4,874 # 7f78 <seed>
     c16:	6708                	ld	a0,8(a4)
     c18:	6f14                	ld	a3,24(a4)
     c1a:	00b50633          	add	a2,a0,a1
     c1e:	00767813          	andi	a6,a2,7
     c22:	96ae                	add	a3,a3,a1
     c24:	0e081963          	bnez	a6,d16 <realloc_beebs+0x112>
     c28:	ef14                	sd	a3,24(a4)
     c2a:	6b14                	ld	a3,16(a4)
     c2c:	0ec6ee63          	bltu	a3,a2,d28 <realloc_beebs+0x124>
     c30:	e710                	sd	a2,8(a4)
     c32:	c97d                	beqz	a0,d28 <realloc_beebs+0x124>
     c34:	00178693          	addi	a3,a5,1
     c38:	40d506b3          	sub	a3,a0,a3
     c3c:	00a7e733          	or	a4,a5,a0
     c40:	0076b693          	sltiu	a3,a3,7
     c44:	8b1d                	andi	a4,a4,7
     c46:	0016c693          	xori	a3,a3,1
     c4a:	00173713          	seqz	a4,a4
     c4e:	8f75                	and	a4,a4,a3
     c50:	cf71                	beqz	a4,d2c <realloc_beebs+0x128>
     c52:	fff58713          	addi	a4,a1,-1
     c56:	00873713          	sltiu	a4,a4,8
     c5a:	00174713          	xori	a4,a4,1
     c5e:	0ff77713          	zext.b	a4,a4
     c62:	c769                	beqz	a4,d2c <realloc_beebs+0x128>
     c64:	ff85f813          	andi	a6,a1,-8
     c68:	873e                	mv	a4,a5
     c6a:	86aa                	mv	a3,a0
     c6c:	983e                	add	a6,a6,a5
     c6e:	6310                	ld	a2,0(a4)
     c70:	0721                	addi	a4,a4,8
     c72:	06a1                	addi	a3,a3,8
     c74:	fec6bc23          	sd	a2,-8(a3)
     c78:	ff071be3          	bne	a4,a6,c6e <realloc_beebs+0x6a>
     c7c:	ff85f713          	andi	a4,a1,-8
     c80:	0ae58563          	beq	a1,a4,d2a <realloc_beebs+0x126>
     c84:	00e786b3          	add	a3,a5,a4
     c88:	0006c803          	lbu	a6,0(a3)
     c8c:	00e50633          	add	a2,a0,a4
     c90:	00170693          	addi	a3,a4,1
     c94:	01060023          	sb	a6,0(a2)
     c98:	08b6f963          	bgeu	a3,a1,d2a <realloc_beebs+0x126>
     c9c:	00d78633          	add	a2,a5,a3
     ca0:	00064803          	lbu	a6,0(a2)
     ca4:	96aa                	add	a3,a3,a0
     ca6:	00270613          	addi	a2,a4,2
     caa:	01068023          	sb	a6,0(a3)
     cae:	06b67e63          	bgeu	a2,a1,d2a <realloc_beebs+0x126>
     cb2:	00c786b3          	add	a3,a5,a2
     cb6:	0006c803          	lbu	a6,0(a3)
     cba:	962a                	add	a2,a2,a0
     cbc:	00370693          	addi	a3,a4,3
     cc0:	01060023          	sb	a6,0(a2)
     cc4:	06b6f363          	bgeu	a3,a1,d2a <realloc_beebs+0x126>
     cc8:	00d78633          	add	a2,a5,a3
     ccc:	00064803          	lbu	a6,0(a2)
     cd0:	96aa                	add	a3,a3,a0
     cd2:	00470613          	addi	a2,a4,4
     cd6:	01068023          	sb	a6,0(a3)
     cda:	04b67863          	bgeu	a2,a1,d2a <realloc_beebs+0x126>
     cde:	00c786b3          	add	a3,a5,a2
     ce2:	0006c803          	lbu	a6,0(a3)
     ce6:	962a                	add	a2,a2,a0
     ce8:	00570693          	addi	a3,a4,5
     cec:	01060023          	sb	a6,0(a2)
     cf0:	02b6fd63          	bgeu	a3,a1,d2a <realloc_beebs+0x126>
     cf4:	00d78633          	add	a2,a5,a3
     cf8:	00064603          	lbu	a2,0(a2)
     cfc:	96aa                	add	a3,a3,a0
     cfe:	0719                	addi	a4,a4,6
     d00:	00c68023          	sb	a2,0(a3)
     d04:	02b77363          	bgeu	a4,a1,d2a <realloc_beebs+0x126>
     d08:	97ba                	add	a5,a5,a4
     d0a:	0007c783          	lbu	a5,0(a5)
     d0e:	972a                	add	a4,a4,a0
     d10:	00f70023          	sb	a5,0(a4)
     d14:	8082                	ret
     d16:	48a1                	li	a7,8
     d18:	41088833          	sub	a6,a7,a6
     d1c:	96c2                	add	a3,a3,a6
     d1e:	ef14                	sd	a3,24(a4)
     d20:	6b14                	ld	a3,16(a4)
     d22:	9642                	add	a2,a2,a6
     d24:	f0c6f6e3          	bgeu	a3,a2,c30 <realloc_beebs+0x2c>
     d28:	4501                	li	a0,0
     d2a:	8082                	ret
     d2c:	872a                	mv	a4,a0
     d2e:	95be                	add	a1,a1,a5
     d30:	0007c683          	lbu	a3,0(a5)
     d34:	0785                	addi	a5,a5,1
     d36:	0705                	addi	a4,a4,1
     d38:	fed70fa3          	sb	a3,-1(a4)
     d3c:	feb79ae3          	bne	a5,a1,d30 <realloc_beebs+0x12c>
     d40:	8082                	ret

0000000000000d42 <free_beebs>:
     d42:	8082                	ret

0000000000000d44 <initialise_board>:
     d44:	8082                	ret

0000000000000d46 <start_trigger>:
     d46:	4581                	li	a1,0
     d48:	4501                	li	a0,0
     d4a:	a881                	j	d9a <m5_reset_stats>

0000000000000d4c <stop_trigger>:
     d4c:	4581                	li	a1,0
     d4e:	4501                	li	a0,0
     d50:	a881                	j	da0 <m5_dump_stats>

0000000000000d52 <m5_arm>:
     d52:	0000007b          	0x7b
     d56:	8082                	ret

0000000000000d58 <m5_quiesce>:
     d58:	0200007b          	0x200007b
     d5c:	8082                	ret

0000000000000d5e <m5_quiesce_ns>:
     d5e:	0400007b          	0x400007b
     d62:	8082                	ret

0000000000000d64 <m5_quiesce_cycle>:
     d64:	0600007b          	0x600007b
     d68:	8082                	ret

0000000000000d6a <m5_quiesce_time>:
     d6a:	0800007b          	0x800007b
     d6e:	8082                	ret

0000000000000d70 <m5_rpns>:
     d70:	0e00007b          	0xe00007b
     d74:	8082                	ret

0000000000000d76 <m5_wake_cpu>:
     d76:	1200007b          	0x1200007b
     d7a:	8082                	ret

0000000000000d7c <m5_exit>:
     d7c:	4200007b          	0x4200007b
     d80:	8082                	ret

0000000000000d82 <m5_fail>:
     d82:	4400007b          	0x4400007b
     d86:	8082                	ret

0000000000000d88 <m5_sum>:
     d88:	4600007b          	0x4600007b
     d8c:	8082                	ret

0000000000000d8e <m5_init_param>:
     d8e:	6000007b          	0x6000007b
     d92:	8082                	ret

0000000000000d94 <m5_load_symbol>:
     d94:	6200007b          	0x6200007b
     d98:	8082                	ret

0000000000000d9a <m5_reset_stats>:
     d9a:	8000007b          	0x8000007b
     d9e:	8082                	ret

0000000000000da0 <m5_dump_stats>:
     da0:	8200007b          	0x8200007b
     da4:	8082                	ret

0000000000000da6 <m5_dump_reset_stats>:
     da6:	8400007b          	0x8400007b
     daa:	8082                	ret

0000000000000dac <m5_checkpoint>:
     dac:	8600007b          	0x8600007b
     db0:	8082                	ret

0000000000000db2 <m5_write_file>:
     db2:	9e00007b          	0x9e00007b
     db6:	8082                	ret

0000000000000db8 <m5_read_file>:
     db8:	a000007b          	0xa000007b
     dbc:	8082                	ret

0000000000000dbe <m5_debug_break>:
     dbe:	a200007b          	0xa200007b
     dc2:	8082                	ret

0000000000000dc4 <m5_switch_cpu>:
     dc4:	a400007b          	0xa400007b
     dc8:	8082                	ret

0000000000000dca <m5_add_symbol>:
     dca:	a600007b          	0xa600007b
     dce:	8082                	ret

0000000000000dd0 <m5_panic>:
     dd0:	a800007b          	0xa800007b
     dd4:	8082                	ret

0000000000000dd6 <m5_work_begin>:
     dd6:	b400007b          	0xb400007b
     dda:	8082                	ret

0000000000000ddc <m5_work_end>:
     ddc:	b600007b          	0xb600007b
     de0:	8082                	ret

0000000000000de2 <m5_dist_toggle_sync>:
     de2:	c400007b          	0xc400007b
     de6:	8082                	ret

0000000000000de8 <m5_workload>:
     de8:	e000007b          	0xe000007b
     dec:	8082                	ret

0000000000000dee <_init>:
     dee:	8082                	ret

0000000000000df0 <__init_ssp>:
     df0:	8082                	ret

0000000000000df2 <__init_libc>:
     df2:	7109                	addi	sp,sp,-384
     df4:	f2ca                	sd	s2,352(sp)
     df6:	03010913          	addi	s2,sp,48
     dfa:	faa2                	sd	s0,368(sp)
     dfc:	f6a6                	sd	s1,360(sp)
     dfe:	842e                	mv	s0,a1
     e00:	84aa                	mv	s1,a0
     e02:	13000613          	li	a2,304
     e06:	4581                	li	a1,0
     e08:	854a                	mv	a0,s2
     e0a:	fe86                	sd	ra,376(sp)
     e0c:	222000ef          	jal	ra,102e <memset>
     e10:	00003797          	auipc	a5,0x3
     e14:	2387b783          	ld	a5,568(a5) # 4048 <_GLOBAL_OFFSET_TABLE_+0x20>
     e18:	e384                	sd	s1,0(a5)
     e1a:	4701                	li	a4,0
     e1c:	00371793          	slli	a5,a4,0x3
     e20:	00f486b3          	add	a3,s1,a5
     e24:	6294                	ld	a3,0(a3)
     e26:	0705                	addi	a4,a4,1
     e28:	faf5                	bnez	a3,e1c <__init_libc+0x2a>
     e2a:	07a1                	addi	a5,a5,8
     e2c:	00f48533          	add	a0,s1,a5
     e30:	00007497          	auipc	s1,0x7
     e34:	17848493          	addi	s1,s1,376 # 7fa8 <__libc>
     e38:	e488                	sd	a0,8(s1)
     e3a:	02500713          	li	a4,37
     e3e:	611c                	ld	a5,0(a0)
     e40:	e3f1                	bnez	a5,f04 <__init_libc+0x112>
     e42:	77ca                	ld	a5,176(sp)
     e44:	00007717          	auipc	a4,0x7
     e48:	14f73e23          	sd	a5,348(a4) # 7fa0 <__hwcap>
     e4c:	77d2                	ld	a5,304(sp)
     e4e:	c789                	beqz	a5,e58 <__init_libc+0x66>
     e50:	00007717          	auipc	a4,0x7
     e54:	14f73423          	sd	a5,328(a4) # 7f98 <__sysinfo>
     e58:	7786                	ld	a5,96(sp)
     e5a:	f89c                	sd	a5,48(s1)
     e5c:	e801                	bnez	s0,e6c <__init_libc+0x7a>
     e5e:	77b2                	ld	a5,296(sp)
     e60:	00001417          	auipc	s0,0x1
     e64:	5b840413          	addi	s0,s0,1464 # 2418 <__set_thread_area+0xc8a>
     e68:	c391                	beqz	a5,e6c <__init_libc+0x7a>
     e6a:	843e                	mv	s0,a5
     e6c:	00003797          	auipc	a5,0x3
     e70:	2447b783          	ld	a5,580(a5) # 40b0 <_GLOBAL_OFFSET_TABLE_+0x88>
     e74:	00003717          	auipc	a4,0x3
     e78:	1f473703          	ld	a4,500(a4) # 4068 <_GLOBAL_OFFSET_TABLE_+0x40>
     e7c:	e380                	sd	s0,0(a5)
     e7e:	e300                	sd	s0,0(a4)
     e80:	02f00693          	li	a3,47
     e84:	0405                	addi	s0,s0,1
     e86:	fff44783          	lbu	a5,-1(s0)
     e8a:	ebc1                	bnez	a5,f1a <__init_libc+0x128>
     e8c:	854a                	mv	a0,s2
     e8e:	36a000ef          	jal	ra,11f8 <__init_tls>
     e92:	756e                	ld	a0,248(sp)
     e94:	f5dff0ef          	jal	ra,df0 <__init_ssp>
     e98:	672a                	ld	a4,136(sp)
     e9a:	67ca                	ld	a5,144(sp)
     e9c:	00f71863          	bne	a4,a5,eac <__init_libc+0xba>
     ea0:	676a                	ld	a4,152(sp)
     ea2:	778a                	ld	a5,160(sp)
     ea4:	00f71463          	bne	a4,a5,eac <__init_libc+0xba>
     ea8:	77ae                	ld	a5,232(sp)
     eaa:	c3d9                	beqz	a5,f30 <__init_libc+0x13e>
     eac:	f002                	sd	zero,32(sp)
     eae:	4785                	li	a5,1
     eb0:	f402                	sd	zero,40(sp)
     eb2:	d03e                	sw	a5,32(sp)
     eb4:	4789                	li	a5,2
     eb6:	d43e                	sw	a5,40(sp)
     eb8:	083c                	addi	a5,sp,24
     eba:	ec02                	sd	zero,24(sp)
     ebc:	e402                	sd	zero,8(sp)
     ebe:	e802                	sd	zero,16(sp)
     ec0:	04900893          	li	a7,73
     ec4:	853e                	mv	a0,a5
     ec6:	458d                	li	a1,3
     ec8:	0030                	addi	a2,sp,8
     eca:	4681                	li	a3,0
     ecc:	4721                	li	a4,8
     ece:	00000073          	ecall
     ed2:	2501                	sext.w	a0,a0
     ed4:	02054563          	bltz	a0,efe <__init_libc+0x10c>
     ed8:	6621                	lui	a2,0x8
     eda:	00001597          	auipc	a1,0x1
     ede:	54658593          	addi	a1,a1,1350 # 2420 <__set_thread_area+0xc92>
     ee2:	0609                	addi	a2,a2,2
     ee4:	0067d703          	lhu	a4,6(a5)
     ee8:	02077713          	andi	a4,a4,32
     eec:	cf05                	beqz	a4,f24 <__init_libc+0x132>
     eee:	03800893          	li	a7,56
     ef2:	f9c00513          	li	a0,-100
     ef6:	00000073          	ecall
     efa:	02055563          	bgez	a0,f24 <__init_libc+0x132>
     efe:	00000023          	sb	zero,0(zero) # 0 <exit-0x470>
     f02:	9002                	ebreak
     f04:	00f76963          	bltu	a4,a5,f16 <__init_libc+0x124>
     f08:	6514                	ld	a3,8(a0)
     f0a:	078e                	slli	a5,a5,0x3
     f0c:	16078793          	addi	a5,a5,352
     f10:	978a                	add	a5,a5,sp
     f12:	ecd7b823          	sd	a3,-304(a5)
     f16:	0541                	addi	a0,a0,16
     f18:	b71d                	j	e3e <__init_libc+0x4c>
     f1a:	00d79363          	bne	a5,a3,f20 <__init_libc+0x12e>
     f1e:	e300                	sd	s0,0(a4)
     f20:	0405                	addi	s0,s0,1
     f22:	b795                	j	e86 <__init_libc+0x94>
     f24:	07a1                	addi	a5,a5,8
     f26:	faf91fe3          	bne	s2,a5,ee4 <__init_libc+0xf2>
     f2a:	4785                	li	a5,1
     f2c:	00f48123          	sb	a5,2(s1)
     f30:	70f6                	ld	ra,376(sp)
     f32:	7456                	ld	s0,368(sp)
     f34:	74b6                	ld	s1,360(sp)
     f36:	7916                	ld	s2,352(sp)
     f38:	6119                	addi	sp,sp,384
     f3a:	8082                	ret

0000000000000f3c <__libc_start_init>:
     f3c:	1101                	addi	sp,sp,-32
     f3e:	00003317          	auipc	t1,0x3
     f42:	11233303          	ld	t1,274(t1) # 4050 <_GLOBAL_OFFSET_TABLE_+0x28>
     f46:	e822                	sd	s0,16(sp)
     f48:	e426                	sd	s1,8(sp)
     f4a:	ec06                	sd	ra,24(sp)
     f4c:	00003417          	auipc	s0,0x3
     f50:	15443403          	ld	s0,340(s0) # 40a0 <_GLOBAL_OFFSET_TABLE_+0x78>
     f54:	9302                	jalr	t1
     f56:	00003497          	auipc	s1,0x3
     f5a:	13a4b483          	ld	s1,314(s1) # 4090 <_GLOBAL_OFFSET_TABLE_+0x68>
     f5e:	00946763          	bltu	s0,s1,f6c <__libc_start_init+0x30>
     f62:	60e2                	ld	ra,24(sp)
     f64:	6442                	ld	s0,16(sp)
     f66:	64a2                	ld	s1,8(sp)
     f68:	6105                	addi	sp,sp,32
     f6a:	8082                	ret
     f6c:	601c                	ld	a5,0(s0)
     f6e:	0421                	addi	s0,s0,8
     f70:	9782                	jalr	a5
     f72:	b7f5                	j	f5e <__libc_start_init+0x22>

0000000000000f74 <libc_start_main_stage2>:
     f74:	7179                	addi	sp,sp,-48
     f76:	f022                	sd	s0,32(sp)
     f78:	00158413          	addi	s0,a1,1
     f7c:	040e                	slli	s0,s0,0x3
     f7e:	f406                	sd	ra,40(sp)
     f80:	ec26                	sd	s1,24(sp)
     f82:	e84a                	sd	s2,16(sp)
     f84:	84ae                	mv	s1,a1
     f86:	892a                	mv	s2,a0
     f88:	9432                	add	s0,s0,a2
     f8a:	e432                	sd	a2,8(sp)
     f8c:	fb1ff0ef          	jal	ra,f3c <__libc_start_init>
     f90:	65a2                	ld	a1,8(sp)
     f92:	8622                	mv	a2,s0
     f94:	8526                	mv	a0,s1
     f96:	9902                	jalr	s2
     f98:	cd8ff0ef          	jal	ra,470 <exit>

0000000000000f9c <__libc_start_main>:
     f9c:	7179                	addi	sp,sp,-48
     f9e:	f022                	sd	s0,32(sp)
     fa0:	ec26                	sd	s1,24(sp)
     fa2:	842e                	mv	s0,a1
     fa4:	84aa                	mv	s1,a0
     fa6:	00158513          	addi	a0,a1,1
     faa:	620c                	ld	a1,0(a2)
     fac:	050e                	slli	a0,a0,0x3
     fae:	9532                	add	a0,a0,a2
     fb0:	f406                	sd	ra,40(sp)
     fb2:	e432                	sd	a2,8(sp)
     fb4:	e3fff0ef          	jal	ra,df2 <__init_libc>
     fb8:	00000797          	auipc	a5,0x0
     fbc:	fbc78793          	addi	a5,a5,-68 # f74 <libc_start_main_stage2>
     fc0:	85a2                	mv	a1,s0
     fc2:	7402                	ld	s0,32(sp)
     fc4:	6622                	ld	a2,8(sp)
     fc6:	70a2                	ld	ra,40(sp)
     fc8:	8526                	mv	a0,s1
     fca:	64e2                	ld	s1,24(sp)
     fcc:	6145                	addi	sp,sp,48
     fce:	8782                	jr	a5

0000000000000fd0 <__stdio_exit>:
     fd0:	8082                	ret

0000000000000fd2 <__libc_exit_fini>:
     fd2:	1101                	addi	sp,sp,-32
     fd4:	e822                	sd	s0,16(sp)
     fd6:	e426                	sd	s1,8(sp)
     fd8:	ec06                	sd	ra,24(sp)
     fda:	00003417          	auipc	s0,0x3
     fde:	06643403          	ld	s0,102(s0) # 4040 <_GLOBAL_OFFSET_TABLE_+0x18>
     fe2:	00003497          	auipc	s1,0x3
     fe6:	0964b483          	ld	s1,150(s1) # 4078 <_GLOBAL_OFFSET_TABLE_+0x50>
     fea:	0084eb63          	bltu	s1,s0,1000 <__libc_exit_fini+0x2e>
     fee:	6442                	ld	s0,16(sp)
     ff0:	60e2                	ld	ra,24(sp)
     ff2:	64a2                	ld	s1,8(sp)
     ff4:	00003317          	auipc	t1,0x3
     ff8:	0a433303          	ld	t1,164(t1) # 4098 <_GLOBAL_OFFSET_TABLE_+0x70>
     ffc:	6105                	addi	sp,sp,32
     ffe:	8302                	jr	t1
    1000:	ff843783          	ld	a5,-8(s0)
    1004:	1461                	addi	s0,s0,-8
    1006:	9782                	jalr	a5
    1008:	b7cd                	j	fea <__libc_exit_fini+0x18>

000000000000100a <memcmp>:
    100a:	c205                	beqz	a2,102a <memcmp+0x20>
    100c:	962e                	add	a2,a2,a1
    100e:	a019                	j	1014 <memcmp+0xa>
    1010:	00c58d63          	beq	a1,a2,102a <memcmp+0x20>
    1014:	00054783          	lbu	a5,0(a0)
    1018:	0005c703          	lbu	a4,0(a1)
    101c:	0505                	addi	a0,a0,1
    101e:	0585                	addi	a1,a1,1
    1020:	fee788e3          	beq	a5,a4,1010 <memcmp+0x6>
    1024:	40e7853b          	subw	a0,a5,a4
    1028:	8082                	ret
    102a:	4501                	li	a0,0
    102c:	8082                	ret

000000000000102e <memset>:
    102e:	c679                	beqz	a2,10fc <memset+0xce>
    1030:	0ff5f793          	zext.b	a5,a1
    1034:	00f50023          	sb	a5,0(a0)
    1038:	00c50733          	add	a4,a0,a2
    103c:	fef70fa3          	sb	a5,-1(a4)
    1040:	4689                	li	a3,2
    1042:	0ac6fd63          	bgeu	a3,a2,10fc <memset+0xce>
    1046:	00f500a3          	sb	a5,1(a0)
    104a:	00f50123          	sb	a5,2(a0)
    104e:	fef70f23          	sb	a5,-2(a4)
    1052:	fef70ea3          	sb	a5,-3(a4)
    1056:	4699                	li	a3,6
    1058:	0ac6f263          	bgeu	a3,a2,10fc <memset+0xce>
    105c:	00f501a3          	sb	a5,3(a0)
    1060:	fef70e23          	sb	a5,-4(a4)
    1064:	46a1                	li	a3,8
    1066:	08c6fb63          	bgeu	a3,a2,10fc <memset+0xce>
    106a:	0ff5f593          	zext.b	a1,a1
    106e:	0085979b          	slliw	a5,a1,0x8
    1072:	40a00733          	neg	a4,a0
    1076:	8b0d                	andi	a4,a4,3
    1078:	9fad                	addw	a5,a5,a1
    107a:	8e19                	sub	a2,a2,a4
    107c:	0107959b          	slliw	a1,a5,0x10
    1080:	9fad                	addw	a5,a5,a1
    1082:	972a                	add	a4,a4,a0
    1084:	9a71                	andi	a2,a2,-4
    1086:	c31c                	sw	a5,0(a4)
    1088:	00c705b3          	add	a1,a4,a2
    108c:	fef5ae23          	sw	a5,-4(a1)
    1090:	06c6f663          	bgeu	a3,a2,10fc <memset+0xce>
    1094:	c35c                	sw	a5,4(a4)
    1096:	c71c                	sw	a5,8(a4)
    1098:	fef5aa23          	sw	a5,-12(a1)
    109c:	fef5ac23          	sw	a5,-8(a1)
    10a0:	46e1                	li	a3,24
    10a2:	04c6fd63          	bgeu	a3,a2,10fc <memset+0xce>
    10a6:	00477813          	andi	a6,a4,4
    10aa:	c75c                	sw	a5,12(a4)
    10ac:	cb1c                	sw	a5,16(a4)
    10ae:	cb5c                	sw	a5,20(a4)
    10b0:	cf1c                	sw	a5,24(a4)
    10b2:	0861                	addi	a6,a6,24
    10b4:	02079893          	slli	a7,a5,0x20
    10b8:	02079693          	slli	a3,a5,0x20
    10bc:	0208d893          	srli	a7,a7,0x20
    10c0:	fef5a223          	sw	a5,-28(a1)
    10c4:	fef5a423          	sw	a5,-24(a1)
    10c8:	fef5a623          	sw	a5,-20(a1)
    10cc:	fef5a823          	sw	a5,-16(a1)
    10d0:	41060633          	sub	a2,a2,a6
    10d4:	47fd                	li	a5,31
    10d6:	9742                	add	a4,a4,a6
    10d8:	0116e6b3          	or	a3,a3,a7
    10dc:	02c7f063          	bgeu	a5,a2,10fc <memset+0xce>
    10e0:	1601                	addi	a2,a2,-32
    10e2:	fe067793          	andi	a5,a2,-32
    10e6:	02078793          	addi	a5,a5,32
    10ea:	97ba                	add	a5,a5,a4
    10ec:	e314                	sd	a3,0(a4)
    10ee:	e714                	sd	a3,8(a4)
    10f0:	eb14                	sd	a3,16(a4)
    10f2:	ef14                	sd	a3,24(a4)
    10f4:	02070713          	addi	a4,a4,32
    10f8:	fef71ae3          	bne	a4,a5,10ec <memset+0xbe>
    10fc:	8082                	ret

00000000000010fe <__init_tp>:
    10fe:	1141                	addi	sp,sp,-16
    1100:	e022                	sd	s0,0(sp)
    1102:	e406                	sd	ra,8(sp)
    1104:	842a                	mv	s0,a0
    1106:	e108                	sd	a0,0(a0)
    1108:	0c850513          	addi	a0,a0,200
    110c:	682000ef          	jal	ra,178e <__set_thread_area>
    1110:	04054763          	bltz	a0,115e <__init_tp+0x60>
    1114:	e511                	bnez	a0,1120 <__init_tp+0x22>
    1116:	4785                	li	a5,1
    1118:	00007717          	auipc	a4,0x7
    111c:	e8f70823          	sb	a5,-368(a4) # 7fa8 <__libc>
    1120:	4789                	li	a5,2
    1122:	d41c                	sw	a5,40(s0)
    1124:	06000893          	li	a7,96
    1128:	00007517          	auipc	a0,0x7
    112c:	f0050513          	addi	a0,a0,-256 # 8028 <__thread_list_lock>
    1130:	00000073          	ecall
    1134:	00007797          	auipc	a5,0x7
    1138:	eac78793          	addi	a5,a5,-340 # 7fe0 <__libc+0x38>
    113c:	ec5c                	sd	a5,152(s0)
    113e:	07840793          	addi	a5,s0,120
    1142:	fc3c                	sd	a5,120(s0)
    1144:	00007797          	auipc	a5,0x7
    1148:	e547b783          	ld	a5,-428(a5) # 7f98 <__sysinfo>
    114c:	d008                	sw	a0,32(s0)
    114e:	ec1c                	sd	a5,24(s0)
    1150:	e400                	sd	s0,8(s0)
    1152:	e800                	sd	s0,16(s0)
    1154:	4501                	li	a0,0
    1156:	60a2                	ld	ra,8(sp)
    1158:	6402                	ld	s0,0(sp)
    115a:	0141                	addi	sp,sp,16
    115c:	8082                	ret
    115e:	557d                	li	a0,-1
    1160:	bfdd                	j	1156 <__init_tp+0x58>

0000000000001162 <__copy_tls>:
    1162:	7139                	addi	sp,sp,-64
    1164:	ec4e                	sd	s3,24(sp)
    1166:	00007997          	auipc	s3,0x7
    116a:	e4298993          	addi	s3,s3,-446 # 7fa8 <__libc>
    116e:	0289b783          	ld	a5,40(s3)
    1172:	f426                	sd	s1,40(sp)
    1174:	0189b483          	ld	s1,24(s3)
    1178:	078e                	slli	a5,a5,0x3
    117a:	f3800713          	li	a4,-200
    117e:	14e1                	addi	s1,s1,-8
    1180:	8c9d                	sub	s1,s1,a5
    1182:	0209b783          	ld	a5,32(s3)
    1186:	8f09                	sub	a4,a4,a0
    1188:	f04a                	sd	s2,32(sp)
    118a:	17fd                	addi	a5,a5,-1
    118c:	8ff9                	and	a5,a5,a4
    118e:	0109b903          	ld	s2,16(s3)
    1192:	f822                	sd	s0,48(sp)
    1194:	e456                	sd	s5,8(sp)
    1196:	94aa                	add	s1,s1,a0
    1198:	00f50433          	add	s0,a0,a5
    119c:	6a85                	lui	s5,0x1
    119e:	e852                	sd	s4,16(sp)
    11a0:	e05a                	sd	s6,0(sp)
    11a2:	fc06                	sd	ra,56(sp)
    11a4:	0c840b13          	addi	s6,s0,200
    11a8:	00848a13          	addi	s4,s1,8
    11ac:	800a8a93          	addi	s5,s5,-2048 # 800 <benchmark_body.constprop.1.isra.0+0xc>
    11b0:	02091163          	bnez	s2,11d2 <__copy_tls+0x70>
    11b4:	0289b783          	ld	a5,40(s3)
    11b8:	70e2                	ld	ra,56(sp)
    11ba:	8522                	mv	a0,s0
    11bc:	e09c                	sd	a5,0(s1)
    11be:	e064                	sd	s1,192(s0)
    11c0:	7442                	ld	s0,48(sp)
    11c2:	74a2                	ld	s1,40(sp)
    11c4:	7902                	ld	s2,32(sp)
    11c6:	69e2                	ld	s3,24(sp)
    11c8:	6a42                	ld	s4,16(sp)
    11ca:	6aa2                	ld	s5,8(sp)
    11cc:	6b02                	ld	s6,0(sp)
    11ce:	6121                	addi	sp,sp,64
    11d0:	8082                	ret
    11d2:	02893783          	ld	a5,40(s2)
    11d6:	00893583          	ld	a1,8(s2)
    11da:	0a21                	addi	s4,s4,8
    11dc:	97da                	add	a5,a5,s6
    11de:	97d6                	add	a5,a5,s5
    11e0:	fefa3c23          	sd	a5,-8(s4)
    11e4:	02893503          	ld	a0,40(s2)
    11e8:	01093603          	ld	a2,16(s2)
    11ec:	955a                	add	a0,a0,s6
    11ee:	150000ef          	jal	ra,133e <memcpy>
    11f2:	00093903          	ld	s2,0(s2)
    11f6:	bf6d                	j	11b0 <__copy_tls+0x4e>

00000000000011f8 <__init_tls>:
    11f8:	01853e83          	ld	t4,24(a0)
    11fc:	00003317          	auipc	t1,0x3
    1200:	e1830313          	addi	t1,t1,-488 # 4014 <__default_stacksize>
    1204:	02853803          	ld	a6,40(a0)
    1208:	00032583          	lw	a1,0(t1)
    120c:	1141                	addi	sp,sp,-16
    120e:	6474e8b7          	lui	a7,0x6474e
    1212:	e406                	sd	ra,8(sp)
    1214:	e022                	sd	s0,0(sp)
    1216:	87f6                	mv	a5,t4
    1218:	4e01                	li	t3,0
    121a:	4701                	li	a4,0
    121c:	4681                	li	a3,0
    121e:	4f99                	li	t6,6
    1220:	4289                	li	t0,2
    1222:	00003f17          	auipc	t5,0x3
    1226:	e0ef3f03          	ld	t5,-498(t5) # 4030 <_GLOBAL_OFFSET_TABLE_+0x8>
    122a:	439d                	li	t2,7
    122c:	55188893          	addi	a7,a7,1361 # 6474e551 <__BSS_END__+0x647463a1>
    1230:	008000b7          	lui	ra,0x800
    1234:	0a081263          	bnez	a6,12d8 <__init_tls+0xe0>
    1238:	000e0463          	beqz	t3,1240 <__init_tls+0x48>
    123c:	00b32023          	sw	a1,0(t1)
    1240:	00007797          	auipc	a5,0x7
    1244:	f4078793          	addi	a5,a5,-192 # 8180 <main_tls>
    1248:	00007617          	auipc	a2,0x7
    124c:	d6060613          	addi	a2,a2,-672 # 7fa8 <__libc>
    1250:	ce89                	beqz	a3,126a <__init_tls+0x72>
    1252:	6a8c                	ld	a1,16(a3)
    1254:	ea1c                	sd	a5,16(a2)
    1256:	972e                	add	a4,a4,a1
    1258:	e798                	sd	a4,8(a5)
    125a:	7298                	ld	a4,32(a3)
    125c:	eb98                	sd	a4,16(a5)
    125e:	7698                	ld	a4,40(a3)
    1260:	ef98                	sd	a4,24(a5)
    1262:	7a98                	ld	a4,48(a3)
    1264:	f398                	sd	a4,32(a5)
    1266:	4705                	li	a4,1
    1268:	f618                	sd	a4,40(a2)
    126a:	0187b803          	ld	a6,24(a5)
    126e:	6794                	ld	a3,8(a5)
    1270:	738c                	ld	a1,32(a5)
    1272:	00d80733          	add	a4,a6,a3
    1276:	fff58513          	addi	a0,a1,-1
    127a:	40e00733          	neg	a4,a4
    127e:	8f69                	and	a4,a4,a0
    1280:	8ee9                	and	a3,a3,a0
    1282:	9742                	add	a4,a4,a6
    1284:	ef98                	sd	a4,24(a5)
    1286:	f794                	sd	a3,40(a5)
    1288:	451d                	li	a0,7
    128a:	00b56463          	bltu	a0,a1,1292 <__init_tls+0x9a>
    128e:	45a1                	li	a1,8
    1290:	f38c                	sd	a1,32(a5)
    1292:	739c                	ld	a5,32(a5)
    1294:	00007517          	auipc	a0,0x7
    1298:	d9c50513          	addi	a0,a0,-612 # 8030 <builtin_tls>
    129c:	0df78593          	addi	a1,a5,223
    12a0:	95b6                	add	a1,a1,a3
    12a2:	95ba                	add	a1,a1,a4
    12a4:	99e1                	andi	a1,a1,-8
    12a6:	f21c                	sd	a5,32(a2)
    12a8:	ee0c                	sd	a1,24(a2)
    12aa:	15000793          	li	a5,336
    12ae:	00b7fc63          	bgeu	a5,a1,12c6 <__init_tls+0xce>
    12b2:	0de00893          	li	a7,222
    12b6:	4501                	li	a0,0
    12b8:	460d                	li	a2,3
    12ba:	02200693          	li	a3,34
    12be:	577d                	li	a4,-1
    12c0:	4781                	li	a5,0
    12c2:	00000073          	ecall
    12c6:	e9dff0ef          	jal	ra,1162 <__copy_tls>
    12ca:	e35ff0ef          	jal	ra,10fe <__init_tp>
    12ce:	04055b63          	bgez	a0,1324 <__init_tls+0x12c>
    12d2:	00000023          	sb	zero,0(zero) # 0 <exit-0x470>
    12d6:	9002                	ebreak
    12d8:	4390                	lw	a2,0(a5)
    12da:	01f61963          	bne	a2,t6,12ec <__init_tls+0xf4>
    12de:	6b98                	ld	a4,16(a5)
    12e0:	40ee8733          	sub	a4,t4,a4
    12e4:	7110                	ld	a2,32(a0)
    12e6:	187d                	addi	a6,a6,-1
    12e8:	97b2                	add	a5,a5,a2
    12ea:	b7a9                	j	1234 <__init_tls+0x3c>
    12ec:	02560463          	beq	a2,t0,1314 <__init_tls+0x11c>
    12f0:	02760863          	beq	a2,t2,1320 <__init_tls+0x128>
    12f4:	ff1618e3          	bne	a2,a7,12e4 <__init_tls+0xec>
    12f8:	7790                	ld	a2,40(a5)
    12fa:	02059413          	slli	s0,a1,0x20
    12fe:	9001                	srli	s0,s0,0x20
    1300:	fec472e3          	bgeu	s0,a2,12e4 <__init_tls+0xec>
    1304:	00c0f463          	bgeu	ra,a2,130c <__init_tls+0x114>
    1308:	00800637          	lui	a2,0x800
    130c:	0006059b          	sext.w	a1,a2
    1310:	4e05                	li	t3,1
    1312:	bfc9                	j	12e4 <__init_tls+0xec>
    1314:	fc0f08e3          	beqz	t5,12e4 <__init_tls+0xec>
    1318:	6b98                	ld	a4,16(a5)
    131a:	40ef0733          	sub	a4,t5,a4
    131e:	b7d9                	j	12e4 <__init_tls+0xec>
    1320:	86be                	mv	a3,a5
    1322:	b7c9                	j	12e4 <__init_tls+0xec>
    1324:	60a2                	ld	ra,8(sp)
    1326:	6402                	ld	s0,0(sp)
    1328:	0141                	addi	sp,sp,16
    132a:	8082                	ret

000000000000132c <_Exit>:
    132c:	87aa                	mv	a5,a0
    132e:	05e00893          	li	a7,94
    1332:	00000073          	ecall
    1336:	05d00893          	li	a7,93
    133a:	853e                	mv	a0,a5
    133c:	bfdd                	j	1332 <_Exit+0x6>

000000000000133e <memcpy>:
    133e:	0035f793          	andi	a5,a1,3
    1342:	40078363          	beqz	a5,1748 <memcpy+0x40a>
    1346:	22060b63          	beqz	a2,157c <memcpy+0x23e>
    134a:	8e2a                	mv	t3,a0
    134c:	a019                	j	1352 <memcpy+0x14>
    134e:	22060663          	beqz	a2,157a <memcpy+0x23c>
    1352:	0005c703          	lbu	a4,0(a1)
    1356:	0585                	addi	a1,a1,1
    1358:	0035f793          	andi	a5,a1,3
    135c:	00ee0023          	sb	a4,0(t3)
    1360:	167d                	addi	a2,a2,-1
    1362:	0e05                	addi	t3,t3,1
    1364:	f7ed                	bnez	a5,134e <memcpy+0x10>
    1366:	003e7693          	andi	a3,t3,3
    136a:	87f2                	mv	a5,t3
    136c:	20068963          	beqz	a3,157e <memcpy+0x240>
    1370:	7139                	addi	sp,sp,-64
    1372:	fc22                	sd	s0,56(sp)
    1374:	f826                	sd	s1,48(sp)
    1376:	f44a                	sd	s2,40(sp)
    1378:	f04e                	sd	s3,32(sp)
    137a:	ec52                	sd	s4,24(sp)
    137c:	e856                	sd	s5,16(sp)
    137e:	e45a                	sd	s6,8(sp)
    1380:	e05e                	sd	s7,0(sp)
    1382:	47fd                	li	a5,31
    1384:	0ac7f763          	bgeu	a5,a2,1432 <memcpy+0xf4>
    1388:	4709                	li	a4,2
    138a:	0005c803          	lbu	a6,0(a1)
    138e:	419c                	lw	a5,0(a1)
    1390:	30e68f63          	beq	a3,a4,16ae <memcpy+0x370>
    1394:	470d                	li	a4,3
    1396:	28e68863          	beq	a3,a4,1626 <memcpy+0x2e8>
    139a:	0015c883          	lbu	a7,1(a1)
    139e:	0025c683          	lbu	a3,2(a1)
    13a2:	fec60713          	addi	a4,a2,-20 # 7fffec <__BSS_END__+0x7f7e3c>
    13a6:	ff077393          	andi	t2,a4,-16
    13aa:	058d                	addi	a1,a1,3
    13ac:	003e0413          	addi	s0,t3,3
    13b0:	01338913          	addi	s2,t2,19
    13b4:	00475493          	srli	s1,a4,0x4
    13b8:	010e0023          	sb	a6,0(t3)
    13bc:	011e00a3          	sb	a7,1(t3)
    13c0:	00de0123          	sb	a3,2(t3)
    13c4:	9972                	add	s2,s2,t3
    13c6:	832e                	mv	t1,a1
    13c8:	8722                	mv	a4,s0
    13ca:	00132883          	lw	a7,1(t1)
    13ce:	00532803          	lw	a6,5(t1)
    13d2:	00932683          	lw	a3,9(t1)
    13d6:	0187de1b          	srliw	t3,a5,0x18
    13da:	00d32783          	lw	a5,13(t1)
    13de:	0088929b          	slliw	t0,a7,0x8
    13e2:	00881f9b          	slliw	t6,a6,0x8
    13e6:	00869f1b          	slliw	t5,a3,0x8
    13ea:	0188d89b          	srliw	a7,a7,0x18
    13ee:	0188581b          	srliw	a6,a6,0x18
    13f2:	0186d69b          	srliw	a3,a3,0x18
    13f6:	00879e9b          	slliw	t4,a5,0x8
    13fa:	005e6e33          	or	t3,t3,t0
    13fe:	01f8e8b3          	or	a7,a7,t6
    1402:	01e86833          	or	a6,a6,t5
    1406:	01d6e6b3          	or	a3,a3,t4
    140a:	01c72023          	sw	t3,0(a4)
    140e:	01172223          	sw	a7,4(a4)
    1412:	01072423          	sw	a6,8(a4)
    1416:	c754                	sw	a3,12(a4)
    1418:	0741                	addi	a4,a4,16
    141a:	0341                	addi	t1,t1,16
    141c:	fb2717e3          	bne	a4,s2,13ca <memcpy+0x8c>
    1420:	00148793          	addi	a5,s1,1
    1424:	0792                	slli	a5,a5,0x4
    1426:	1635                	addi	a2,a2,-19
    1428:	40760633          	sub	a2,a2,t2
    142c:	00f40e33          	add	t3,s0,a5
    1430:	95be                	add	a1,a1,a5
    1432:	01067793          	andi	a5,a2,16
    1436:	00867713          	andi	a4,a2,8
    143a:	00467813          	andi	a6,a2,4
    143e:	00267693          	andi	a3,a2,2
    1442:	8a05                	andi	a2,a2,1
    1444:	34078163          	beqz	a5,1786 <memcpy+0x448>
    1448:	00e5c783          	lbu	a5,14(a1)
    144c:	0005cb83          	lbu	s7,0(a1)
    1450:	0015cb03          	lbu	s6,1(a1)
    1454:	0025ca83          	lbu	s5,2(a1)
    1458:	0035ca03          	lbu	s4,3(a1)
    145c:	0045c983          	lbu	s3,4(a1)
    1460:	0055c903          	lbu	s2,5(a1)
    1464:	0065c483          	lbu	s1,6(a1)
    1468:	0075c403          	lbu	s0,7(a1)
    146c:	0085c383          	lbu	t2,8(a1)
    1470:	0095c283          	lbu	t0,9(a1)
    1474:	00a5cf83          	lbu	t6,10(a1)
    1478:	00b5cf03          	lbu	t5,11(a1)
    147c:	00c5ce83          	lbu	t4,12(a1)
    1480:	00d5c303          	lbu	t1,13(a1)
    1484:	00f5c883          	lbu	a7,15(a1)
    1488:	00fe0723          	sb	a5,14(t3)
    148c:	017e0023          	sb	s7,0(t3)
    1490:	016e00a3          	sb	s6,1(t3)
    1494:	015e0123          	sb	s5,2(t3)
    1498:	014e01a3          	sb	s4,3(t3)
    149c:	013e0223          	sb	s3,4(t3)
    14a0:	012e02a3          	sb	s2,5(t3)
    14a4:	009e0323          	sb	s1,6(t3)
    14a8:	008e03a3          	sb	s0,7(t3)
    14ac:	007e0423          	sb	t2,8(t3)
    14b0:	005e04a3          	sb	t0,9(t3)
    14b4:	01fe0523          	sb	t6,10(t3)
    14b8:	01ee05a3          	sb	t5,11(t3)
    14bc:	01de0623          	sb	t4,12(t3)
    14c0:	006e06a3          	sb	t1,13(t3)
    14c4:	05c1                	addi	a1,a1,16
    14c6:	010e0793          	addi	a5,t3,16
    14ca:	011e07a3          	sb	a7,15(t3)
    14ce:	26070b63          	beqz	a4,1744 <memcpy+0x406>
    14d2:	0065c703          	lbu	a4,6(a1)
    14d6:	0005c283          	lbu	t0,0(a1)
    14da:	0015cf83          	lbu	t6,1(a1)
    14de:	0025cf03          	lbu	t5,2(a1)
    14e2:	0035ce83          	lbu	t4,3(a1)
    14e6:	0045ce03          	lbu	t3,4(a1)
    14ea:	0055c303          	lbu	t1,5(a1)
    14ee:	0075c883          	lbu	a7,7(a1)
    14f2:	00e78323          	sb	a4,6(a5)
    14f6:	00578023          	sb	t0,0(a5)
    14fa:	01f780a3          	sb	t6,1(a5)
    14fe:	01e78123          	sb	t5,2(a5)
    1502:	01d781a3          	sb	t4,3(a5)
    1506:	01c78223          	sb	t3,4(a5)
    150a:	006782a3          	sb	t1,5(a5)
    150e:	05a1                	addi	a1,a1,8
    1510:	00878713          	addi	a4,a5,8
    1514:	011783a3          	sb	a7,7(a5)
    1518:	26080563          	beqz	a6,1782 <memcpy+0x444>
    151c:	0025c783          	lbu	a5,2(a1)
    1520:	0005c303          	lbu	t1,0(a1)
    1524:	0015c883          	lbu	a7,1(a1)
    1528:	0035c803          	lbu	a6,3(a1)
    152c:	00f70123          	sb	a5,2(a4)
    1530:	00670023          	sb	t1,0(a4)
    1534:	011700a3          	sb	a7,1(a4)
    1538:	0591                	addi	a1,a1,4
    153a:	00470793          	addi	a5,a4,4
    153e:	010701a3          	sb	a6,3(a4)
    1542:	1e068f63          	beqz	a3,1740 <memcpy+0x402>
    1546:	0005c703          	lbu	a4,0(a1)
    154a:	0015c683          	lbu	a3,1(a1)
    154e:	0589                	addi	a1,a1,2
    1550:	00e78023          	sb	a4,0(a5)
    1554:	00d780a3          	sb	a3,1(a5)
    1558:	00278713          	addi	a4,a5,2
    155c:	c609                	beqz	a2,1566 <memcpy+0x228>
    155e:	0005c783          	lbu	a5,0(a1)
    1562:	00f70023          	sb	a5,0(a4)
    1566:	7462                	ld	s0,56(sp)
    1568:	74c2                	ld	s1,48(sp)
    156a:	7922                	ld	s2,40(sp)
    156c:	7982                	ld	s3,32(sp)
    156e:	6a62                	ld	s4,24(sp)
    1570:	6ac2                	ld	s5,16(sp)
    1572:	6b22                	ld	s6,8(sp)
    1574:	6b82                	ld	s7,0(sp)
    1576:	6121                	addi	sp,sp,64
    1578:	8082                	ret
    157a:	8082                	ret
    157c:	8082                	ret
    157e:	473d                	li	a4,15
    1580:	04c77963          	bgeu	a4,a2,15d2 <memcpy+0x294>
    1584:	01c5e733          	or	a4,a1,t3
    1588:	8b1d                	andi	a4,a4,7
    158a:	ff060e93          	addi	t4,a2,-16
    158e:	1a071f63          	bnez	a4,174c <memcpy+0x40e>
    1592:	010eb713          	sltiu	a4,t4,16
    1596:	00174713          	xori	a4,a4,1
    159a:	0ff77713          	zext.b	a4,a4
    159e:	1a070763          	beqz	a4,174c <memcpy+0x40e>
    15a2:	004ede93          	srli	t4,t4,0x4
    15a6:	001e8313          	addi	t1,t4,1
    15aa:	872e                	mv	a4,a1
    15ac:	00873883          	ld	a7,8(a4)
    15b0:	00073803          	ld	a6,0(a4)
    15b4:	0685                	addi	a3,a3,1
    15b6:	0117b423          	sd	a7,8(a5)
    15ba:	0107b023          	sd	a6,0(a5)
    15be:	0741                	addi	a4,a4,16
    15c0:	07c1                	addi	a5,a5,16
    15c2:	fe66e5e3          	bltu	a3,t1,15ac <memcpy+0x26e>
    15c6:	001e8793          	addi	a5,t4,1
    15ca:	0792                	slli	a5,a5,0x4
    15cc:	8a3d                	andi	a2,a2,15
    15ce:	9e3e                	add	t3,t3,a5
    15d0:	95be                	add	a1,a1,a5
    15d2:	00867693          	andi	a3,a2,8
    15d6:	00467713          	andi	a4,a2,4
    15da:	00267793          	andi	a5,a2,2
    15de:	8a05                	andi	a2,a2,1
    15e0:	ca91                	beqz	a3,15f4 <memcpy+0x2b6>
    15e2:	0005a803          	lw	a6,0(a1)
    15e6:	41d4                	lw	a3,4(a1)
    15e8:	0e21                	addi	t3,t3,8
    15ea:	05a1                	addi	a1,a1,8
    15ec:	ff0e2c23          	sw	a6,-8(t3)
    15f0:	fede2e23          	sw	a3,-4(t3)
    15f4:	c711                	beqz	a4,1600 <memcpy+0x2c2>
    15f6:	4198                	lw	a4,0(a1)
    15f8:	0e11                	addi	t3,t3,4
    15fa:	0591                	addi	a1,a1,4
    15fc:	feee2e23          	sw	a4,-4(t3)
    1600:	18078563          	beqz	a5,178a <memcpy+0x44c>
    1604:	0005c783          	lbu	a5,0(a1)
    1608:	0015c703          	lbu	a4,1(a1)
    160c:	0589                	addi	a1,a1,2
    160e:	00fe0023          	sb	a5,0(t3)
    1612:	00ee00a3          	sb	a4,1(t3)
    1616:	002e0793          	addi	a5,t3,2
    161a:	d22d                	beqz	a2,157c <memcpy+0x23e>
    161c:	0005c703          	lbu	a4,0(a1)
    1620:	00e78023          	sb	a4,0(a5)
    1624:	8082                	ret
    1626:	fec60713          	addi	a4,a2,-20
    162a:	ff077413          	andi	s0,a4,-16
    162e:	0585                	addi	a1,a1,1
    1630:	001e0493          	addi	s1,t3,1
    1634:	01140393          	addi	t2,s0,17
    1638:	00475913          	srli	s2,a4,0x4
    163c:	010e0023          	sb	a6,0(t3)
    1640:	93f2                	add	t2,t2,t3
    1642:	832e                	mv	t1,a1
    1644:	8726                	mv	a4,s1
    1646:	00332883          	lw	a7,3(t1)
    164a:	00732803          	lw	a6,7(t1)
    164e:	00b32683          	lw	a3,11(t1)
    1652:	0087de1b          	srliw	t3,a5,0x8
    1656:	00f32783          	lw	a5,15(t1)
    165a:	0188929b          	slliw	t0,a7,0x18
    165e:	01881f9b          	slliw	t6,a6,0x18
    1662:	01869f1b          	slliw	t5,a3,0x18
    1666:	0088d89b          	srliw	a7,a7,0x8
    166a:	0088581b          	srliw	a6,a6,0x8
    166e:	0086d69b          	srliw	a3,a3,0x8
    1672:	01879e9b          	slliw	t4,a5,0x18
    1676:	005e6e33          	or	t3,t3,t0
    167a:	01f8e8b3          	or	a7,a7,t6
    167e:	01e86833          	or	a6,a6,t5
    1682:	01d6e6b3          	or	a3,a3,t4
    1686:	01c72023          	sw	t3,0(a4)
    168a:	01172223          	sw	a7,4(a4)
    168e:	01072423          	sw	a6,8(a4)
    1692:	c754                	sw	a3,12(a4)
    1694:	0741                	addi	a4,a4,16
    1696:	0341                	addi	t1,t1,16
    1698:	fa7717e3          	bne	a4,t2,1646 <memcpy+0x308>
    169c:	00190793          	addi	a5,s2,1
    16a0:	0792                	slli	a5,a5,0x4
    16a2:	163d                	addi	a2,a2,-17
    16a4:	8e01                	sub	a2,a2,s0
    16a6:	00f48e33          	add	t3,s1,a5
    16aa:	95be                	add	a1,a1,a5
    16ac:	b359                	j	1432 <memcpy+0xf4>
    16ae:	0015c683          	lbu	a3,1(a1)
    16b2:	fec60713          	addi	a4,a2,-20
    16b6:	ff077393          	andi	t2,a4,-16
    16ba:	0589                	addi	a1,a1,2
    16bc:	002e0413          	addi	s0,t3,2
    16c0:	01238913          	addi	s2,t2,18
    16c4:	00475493          	srli	s1,a4,0x4
    16c8:	010e0023          	sb	a6,0(t3)
    16cc:	00de00a3          	sb	a3,1(t3)
    16d0:	9972                	add	s2,s2,t3
    16d2:	832e                	mv	t1,a1
    16d4:	8722                	mv	a4,s0
    16d6:	00232883          	lw	a7,2(t1)
    16da:	00632803          	lw	a6,6(t1)
    16de:	00a32683          	lw	a3,10(t1)
    16e2:	0107de1b          	srliw	t3,a5,0x10
    16e6:	00e32783          	lw	a5,14(t1)
    16ea:	0108929b          	slliw	t0,a7,0x10
    16ee:	01081f9b          	slliw	t6,a6,0x10
    16f2:	01069f1b          	slliw	t5,a3,0x10
    16f6:	0108d89b          	srliw	a7,a7,0x10
    16fa:	0108581b          	srliw	a6,a6,0x10
    16fe:	0106d69b          	srliw	a3,a3,0x10
    1702:	01079e9b          	slliw	t4,a5,0x10
    1706:	005e6e33          	or	t3,t3,t0
    170a:	01f8e8b3          	or	a7,a7,t6
    170e:	01e86833          	or	a6,a6,t5
    1712:	01d6e6b3          	or	a3,a3,t4
    1716:	01c72023          	sw	t3,0(a4)
    171a:	01172223          	sw	a7,4(a4)
    171e:	01072423          	sw	a6,8(a4)
    1722:	c754                	sw	a3,12(a4)
    1724:	0741                	addi	a4,a4,16
    1726:	0341                	addi	t1,t1,16
    1728:	fb2717e3          	bne	a4,s2,16d6 <memcpy+0x398>
    172c:	00148793          	addi	a5,s1,1
    1730:	0792                	slli	a5,a5,0x4
    1732:	1639                	addi	a2,a2,-18
    1734:	40760633          	sub	a2,a2,t2
    1738:	00f40e33          	add	t3,s0,a5
    173c:	95be                	add	a1,a1,a5
    173e:	b9d5                	j	1432 <memcpy+0xf4>
    1740:	873e                	mv	a4,a5
    1742:	bd29                	j	155c <memcpy+0x21e>
    1744:	873e                	mv	a4,a5
    1746:	bbc9                	j	1518 <memcpy+0x1da>
    1748:	8e2a                	mv	t3,a0
    174a:	b931                	j	1366 <memcpy+0x28>
    174c:	004ede93          	srli	t4,t4,0x4
    1750:	001e8f13          	addi	t5,t4,1
    1754:	0f12                	slli	t5,t5,0x4
    1756:	9f2e                	add	t5,t5,a1
    1758:	87ae                	mv	a5,a1
    175a:	8772                	mv	a4,t3
    175c:	0007a303          	lw	t1,0(a5)
    1760:	0047a883          	lw	a7,4(a5)
    1764:	0087a803          	lw	a6,8(a5)
    1768:	47d4                	lw	a3,12(a5)
    176a:	00672023          	sw	t1,0(a4)
    176e:	01172223          	sw	a7,4(a4)
    1772:	01072423          	sw	a6,8(a4)
    1776:	c754                	sw	a3,12(a4)
    1778:	07c1                	addi	a5,a5,16
    177a:	0741                	addi	a4,a4,16
    177c:	feff10e3          	bne	t5,a5,175c <memcpy+0x41e>
    1780:	b599                	j	15c6 <memcpy+0x288>
    1782:	87ba                	mv	a5,a4
    1784:	bb7d                	j	1542 <memcpy+0x204>
    1786:	87f2                	mv	a5,t3
    1788:	b399                	j	14ce <memcpy+0x190>
    178a:	87f2                	mv	a5,t3
    178c:	b579                	j	161a <memcpy+0x2dc>

000000000000178e <__set_thread_area>:
    178e:	822a                	mv	tp,a0
    1790:	4501                	li	a0,0
    1792:	8082                	ret
