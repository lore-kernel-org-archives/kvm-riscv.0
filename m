Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD12606A336
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4A38/hW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XBPDSV6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gm3KXpab2kRd/WmyqiHX+7DVE2h0Jcnn8LEHYzvBDEk=; b=h4A38/hWQ++7DRkwzFf2lKPJl8
	zKrvoGJTSpCUWXja+9RryXfnsLnxKWJSeqFUYFmFp/lzH7dYsbPyooSyFasp/vrZVdkM1zB0+83go
	LFmlRpj6oRAcq86zhE4q7Zmv4r2V5TWzgLLmTqlnskCp3hKib5ZN8oDvYkgSeTKLeKkMpSyA3V6n/
	Bl7G6SRIgy/v5V0QJ73V3HXejKEO7HkyIDYUq0+DuPSy7/HAp+s3V0ud6DSAyJGAKCdVSjO7rWD9p
	lR4+J0ZvL8pNKy8aRMGsR2Gq7UXawnwg3RpKU41W3xbLNE7+pgYcGPFrAqJ+N+rRl+Nx+1lYWdLru
	cE4Xm2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCy9-00000002FuQ-0nqd;
	Tue, 03 Nov 2026 11:46:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCy6-00000002FsQ-1uKG;
	Tue, 03 Nov 2026 11:46:23 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AEnqC4045893;
	Tue, 3 Nov 2026 11:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=rQNgYgRzwbgahGLohNvZBfs82BLnKv
	w2G9BPFntd+2Y=; b=XBPDSV6U1ByAfT/2HXWiYPBImtoE06l1RsLvOPr+Mg1Wdg
	5bb7Q4UvH0mEeFRj51IZNVX9NifoIpA9L056gpcpDJYHk5VjyO/RQmX944rPTcqT
	lza8DMAA2sFbSnKXHJIeLKs+Q8G1+3X9B+dEQMrLtkOkjp4pNJTbzJPAiDcZXVUE
	p6Db6wAKv27p8hT6TDeMeXOr4Vk2Xpp7upRB50EYJzqoLgx5W9PMpVDKF0KnA/eX
	bnd0mHKF4Ty7FsZMzKSxZD1WU4h6XYV6jH6M4KptIOxivjveMfPtf8UA4FEmQ1NM
	hLDM5ogor5Zfi+YhNntcsukL5xZcXKcEJ/fYDveQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn80snd8h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 11:45:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AK5Iq2350043;
	Tue, 3 Nov 2026 11:45:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hqbqk8stp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 11:45:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A3BjoS127460120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Nov 2026 11:45:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 770852004D;
	Tue,  3 Nov 2026 11:45:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A1B320040;
	Tue,  3 Nov 2026 11:45:49 +0000 (GMT)
Received: from osiris (unknown [9.111.24.158])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Nov 2026 11:45:49 +0000 (GMT)
Date: Tue, 3 Nov 2026 12:45:48 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
        Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Subject: Re: [PATCH 1/7] KVM: s390: Drop unused and unreachable
 kvm_arch_vcpu_should_kick()
Message-ID: <20261103114548.119911-B-seiden@linux.ibm.com>
References: <20261028190259.1819571-1-seanjc@google.com>
 <20261028190259.1819571-2-seanjc@google.com>
 <20261102153228.240804-H-seiden@linux.ibm.com>
 <auitiPKnFueBJzPA@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auitiPKnFueBJzPA@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: pVpgdP1XGIbnstN6hf1_H30Mry2kEc8w
X-Proofpoint-ORIG-GUID: l9khr2_nw7GEkBcFn3H6-NSEwUfuIP0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX1XmGS9lHsUL0
 R/pqFn7OS4O6sIvO6xkJJLw7ub5XYBJJ8rT4n7ytkLsrM+nXxJ8ALAk6IZ7cxaLgxzx/sz6YekU
 QUQNLzCc+AcEIzFSIIId4SI+3jZ4xWcemIVFHv+lYM846eTlTDBy/sVfsO3lwE4suzbkGudS2Kb
 gxPBGGgvMaIVdytp/A39MMoe5QDoT7CkGj5SGrkaqTAe4eTeD+SzsmTdUt/UyjY9TJC3JseqnJa
 QEo75BJzfvgqw3u+U+2wRBpyO7uPflzaZ5caj2HokpnoTurGkxzXBgpUXpjVDxTHjuBmXjI8rPa
 vxWDAmBlV9AhIXjL/sn+6LcGLT5sIIA/1vfGnxBH9hGUn2tSE9JXdCrUFdxql4RE+ZLXgJZ4H1I
 Kt9BEBx2jKRF/wavIUPm0bKdaAiukt/xqjNHAoSCxYurQjxD+KTis8S/8SmPNJktwNxtQkMBgIp
 7SZvF2lkFSgtvQ77a7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX8KXTgj3ZDXIb
 rszJKiaYCEhjwddi22AWOUixDabzaYbTZeZqW4OyLHY9z/7j8facbJ5/xv2IRGOBpQn4thL/pQY
 S1fxrlzI0e+Xs7MM8Gx7oKdd53KSVec=
X-Authority-Analysis: v=2.4 cv=FIqOVOos c=1 sm=1 tr=0 ts=6ae9c975 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=14yfDfNcGX1pIiSJYtUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034622_501999_A616F7BB 
X-CRM114-Status: GOOD (  17.59  )
X-Spam-Score: -2.6 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 07:34:32AM -0800, Sean Christopherson wrote:
> On Mon, Nov 02, 2026, Steffen Eiden wrote:
> > On Wed, Oct 28, 2026 at 12:02:53PM -0700, Sean Christopherson wrote:
> > > Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
> > > is wrapped with "#ifndef CONFIG_S390".
> > 
> > In the somehow near future I'll remove those #ifdefs and use the kick
> > stuff for kvm_arm64. The native s390 KVM then must at least keep an
> > (unused) symbol at hand. It seems that the compiler could not optimize
> > those calls away. So let's keep it there so I do not have to re-add it
> > soon.
> 
> Please read the rest of the series.  kvm_arch_vcpu_should_kick() goes away
> entirely.

Sorry for that. This patch just jumped to my attention and I had no time
yet to read the rest. 

	Steffen

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
