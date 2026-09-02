Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF18C624D3
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwttOnNUdBjhlNRI1Dw94JGog0chGGMDldSXkLeF7XE=; b=JfbjzXCIUySK5B
	2qHZZXsWemSHpKxQ0jCtx2X07OEkgnMNNmi2FMvgxssg4DiVOe2j5N/eR2/+M8SZzeS3R5jgAD15z
	OeVOFzzspaAEx9roGnoSB5PaAjsWAQVM5r5zZPT1bDSV7AXq8cvijDJ6yJFWeBzBIHZm3PuFax8DS
	vAIHXKh86ggty1hXhUPrP/v1CCer06gasi1wfLjP6FxK/EjIeyqu3ixuW5/tDYP54r51Gp+5T2Z8n
	bZqEFuOlDLIb9T3L4ModxBBkYeXQ47nXviIDnqdZCfriJUTMePxSsAJH6bDNpBLIObzn7uJMJAEuK
	9fNGd6qV1a0+DX8+06oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p40-0000000FTtp-2c6j;
	Wed, 02 Sep 2026 17:47:56 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p3y-0000000FTt9-0Ove;
	Wed, 02 Sep 2026 17:47:55 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HVaOG661164;
	Wed, 2 Sep 2026 17:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=HGtwWmnQ6QwDDO+DyewXu4HaqP7hG4
	EurP/lr9Sz1eU=; b=pXJ51bzM+v6WL88TWOeaJMkj1nSVlEa101MtzmBfaTneIB
	B8Ry3a6/fLkuV4E44I15E99NZ7Pa9tYuPex+ARWyywvZOqrWeSatuJck2sLldGDL
	FLLdjhW/AuHBe0Ve2ovPjbT8LMAFqTWO4Le0cLKhTxShmhYzdqSqYtmt4pux+eFO
	c9w4YtdIqP5+FQfeWr7Ajw8Zf+lvioZBKEyx9S1AOdCdn/hbL0UvdFyi+VFbQCjl
	S5i7b/vmqjq1v/2/Nl7nA9W8gI2PxivpgFZabXZs5M0NRZjz2k2w7ONefhNdd1pe
	6iRKd/ARLvVl4+eg8FLJpTOEzDZEktygdnW35Fxg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbpx5rd98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:47:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 682HQpjI023346;
	Wed, 2 Sep 2026 17:47:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rqkj7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:47:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 682HlV6S44368140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 17:47:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07A752004E;
	Wed,  2 Sep 2026 17:47:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90FEC2004F;
	Wed,  2 Sep 2026 17:47:23 +0000 (GMT)
Received: from Gautams-MacBook-Pro.local (unknown [9.124.221.176])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Sep 2026 17:47:23 +0000 (GMT)
Date: Wed, 2 Sep 2026 23:17:20 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
Message-ID: <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local>
References: <20260826230511.972824-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=PPc/P/qC c=1 sm=1 tr=0 ts=6a986138 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=6YN9JvpFNRzmbg3FydkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: tRZqKKrGtBjHG2Pu3xQZzuOyhRhv077A
X-Proofpoint-ORIG-GUID: pdLNL2iG2soKTiUHunO9uJiDJ8oxj9S6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE1NCBTYWx0ZWRfX/3BQiO/4M77n
 AvjpUycO+mKHAdP0qa39OrRauYjGL+ZXs6GMp+BhV9vuxqhuESJqGvGyxDS/TncOIoaaNebyj2M
 Mh+XT8fPklmzmBP5n5N6hvz8btd17e0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE1NCBTYWx0ZWRfX7sO1s5aw3bu7
 yGm8yQcHZ7WA2zwsrkIYdeZcloHnCw+pL5crxFHgEqUiWM+wUus/GNOQ/ZAwb6FjQLOncOp8A86
 94yCxLIuXJcEs1s8fHFlHIfo76aNyFoh4QlGJ0Mg/HjdkoTDg99uz3Cx41t/tSng59sXrFCxcMX
 9aSG+t+97OyBvbo2meC9X4F15bk3na1rQooBz40mnKd4Trt5E+kWB6Y4mk1lOazlBi5WcQ9xJda
 SX3oEaIKkegrcRVjJg9T55qxEXJTwuO+3co5WfoC4YNCD6rzXlwpMc5j+JSeRlWHRDM9Un/5kf9
 KZHm3YyKi0t11rguHeyczHDVWwZ1ehOeBVXz31LmkDWnFTcj2X+/2d5BWmQcgwNwjEJ/LAMcP6T
 1ZoI/atPvxfIYGWLuyusfsc18eNXNBHm5c/bJuaj5WtHgPMuR3aqb47eggYeMiaOlkvEFr8Yd4H
 SzqNL31hLQRftxAg6jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_104754_140482_62528E67 
X-CRM114-Status: UNSURE (   8.03  )
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


+ linuxppc-dev

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
