Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D161C71135
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgO5xdpKzaoN3YsfbLNOIwPNETS+iiBCmyBeBWdMsac=; b=EMNF2kRgqNPYlh
	fh0pTWiByh8FTrISmXqAl6vJspatwMb00WfJGQM4ym/jO14LcvAcid7NiEKdfv/KMqoyghzyC/Lq8
	gd7ZZfXCc3aZaQhDaocdksgagdQ8iEBg7rr0WMeoW1WBTixXZDF7PZB5k60FLA5qtIANUo5lJaPgj
	1JbuXVxxpiuTEIP7Bu59HfeX9KPGA6Zui4qnI2LZMhJJtgsjJ9k+GRjeiNTAthSMDlHWP8yj9OG1J
	EkX62omb52mbOKsozX0BcKqym4JG06o7axpSwC0csY7j/dpQ72ZKzzhkNmx8LaJy0jeqgwOv8kxK0
	oR1bk/GhQh/k40aFsXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Bu-00000003ctY-1Nrn;
	Mon, 16 Jun 2025 07:23:38 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR44m-00000003bv9-2tmV;
	Mon, 16 Jun 2025 07:16:17 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLRHHr025161;
	Mon, 16 Jun 2025 07:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8oS9W40Kxi3jCDLjbplhmNHApFzpmx
	WBjEyHqggrd0A=; b=qAY4VVpinI2Rbjtg6/cTxb0ByK9Dpzpf/aO3yY9XM5UF4d
	fU78j65QpJ3TapkNS/xL3vWbPV5/pklD1FE7kjijxU/XLyukt6XZ3WfcR4gFH81+
	UFdauXXxcaqtHqvoucUPRYWnY4bL4ogy5OumG75AWe2BeYdsMVMYJOpOVg665ANi
	VWvgBCKH/JyZisb5vUa4CL8qgECUwjCm3TRR4ZUf58M9gln0exc5pR4IRrjSC6+f
	ZkrajO9adrWRsa38pwUBB5r4ztMCHddjRWJusLpI5uP3qlP55wkLVB/N8+UcqUCc
	LCE/mDDOWLEmLtUGpgpcmyaSwGoUdK3hRWsyQEfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1qypc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:15:36 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55G6uksv023490;
	Mon, 16 Jun 2025 07:15:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1qyp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:15:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55G3BxpK011236;
	Mon, 16 Jun 2025 07:15:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdt56ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:15:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55G7FVZd43385168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 07:15:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB3CA2004D;
	Mon, 16 Jun 2025 07:15:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B03A2004E;
	Mon, 16 Jun 2025 07:15:26 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 16 Jun 2025 07:15:26 +0000 (GMT)
Date: Mon, 16 Jun 2025 12:45:22 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Anish Ghulati <aghulati@google.com>,
        Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/8] KVM: PPC: Stop adding virt/kvm to the arch include
 path
Message-ID: <etqfg3dvpr4tabk3lysnvelpb5k3pyuuhhkfxsd4oyxlmgwnit@rducsforanaj>
References: <20250611001042.170501-1-seanjc@google.com>
 <20250611001042.170501-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611001042.170501-7-seanjc@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pA27UQdSoFi7fENYAbcClrvtInowwnUB
X-Proofpoint-ORIG-GUID: TmHFGtZ04KPLB6esid1G6CYOB7tVt6Vr
X-Authority-Analysis: v=2.4 cv=AqTu3P9P c=1 sm=1 tr=0 ts=684fc498 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=90UzZmcSQ78tuVnzBuAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0NCBTYWx0ZWRfX7cOmaIrOSqpw SXLMPZuCWSZBCBLE3FL1xYcVW8X8KK0s74UvFuWZnCI71S5bsha1iy0u8LbyZa/+82oTUgv81jB 8/dlb4z7C/9S1qOfR7ocu1ICPZlI2cR3jyDHY3OeqfHz4UFQa3Rmzgnyh3GV1P+TxeqAcXYuNcf
 QEN1U+QFmMf+lloYVcQjizKufdVGBS01u2hgxtp3bvDWMeYFm65yaoSob0KnI8NZ2r/UggduiwU ZI3aZ9HSz+pCtgy2G1LIxS18dF8Y3fx6iFj5NS4G1C1cP4XiHgt73JfFH9LrR8JcXlRfTcEju3e eeU8dw7b1BrKJERMYaXJKC8cF2yDollkevHHuOIz2ofPC4iO7YXWdRjLohoPeN5pLWHoOr65LX/
 hSQl2MRrPAQ08Y2Uc3A15BdBi0qU/CKs2ILqAsxRoOrQErs71PyFk7tko/eh6IYJbN/lDZCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=478 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_001616_848759_270B7CEE 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
