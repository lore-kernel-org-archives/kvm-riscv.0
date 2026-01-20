Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF28D2ED11
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+KA4PUQz231q7YHlkuX5e0EfK8E8hAs9AMXZP34CYI=; b=AVgL6omcYvj3oI
	KILEdK00wxwWN1X2Z35nwiIwLoHNIg2dNqaV8CGhaLG8Pku18KAc84sHg9t7loGTDX3UDWPtCm61q
	RQa/4V8QcpF7rXSP3LpUAC7wzhe0gN3eOSVEezvr4/vSAF4q84RrxbwejChDN8jBwr4bJd5IvfBo5
	WIUvtnG8eNc8JBpLi0UFPfG8BLbesp5AiAfE3ujyO7FhCXeYqU7sXPffiVlyxYi8plltRsgCnk5mT
	Hlewp3TPyIS+Jlshc47qW4ozvi9uzvAdqHyNBcKvpWYzlOM9ivwwzCt0ND9mtk/iPeboS7eDBQQ/e
	n+Rfe0etwLhDzfmM8j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gH-00000003PKa-0B9e;
	Tue, 20 Jan 2026 08:01:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gD-00000003PBf-2OCI;
	Tue, 20 Jan 2026 08:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k3qGz3Rblrcb9ISXBRSzABNxhdgMZw/6Mvr/NKKhNJg=; b=qaVKzH9vyWvr7wbfIdVnDUMe/k
	qYwNJKcLuEnct5sMnu49f6OBff4TyK23D2oHtXr5+SteVLDYIegf4WnatIgEtg7aDWEw1s/HN/ort
	ofD30bnHZQWuPRIbEkoKIxVJAbWOrlO490ZE1bt5gtQ/NyAcfPccASBqNu2YTiw5oNY8+sUpTsLs5
	hmsyzYimuX/ipPQ5n6Dnstwf+Ym+EBWgCg0toxkoPKVWPXbgQWVpJBd9Ut+tE8ck/Rg+rQQIninve
	SPCy4ezSEEFhdlBlUAXTAaUrVc+1rLKXokR5raqjlEqXoi4dCEP74sljvpwi7Sv/uMS8QuG91LCdq
	Xf3IC/bQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6g9-0000000EThl-3CaL;
	Tue, 20 Jan 2026 08:01:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K33JkS3805148;
	Tue, 20 Jan 2026 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k3qGz3Rblrc
	b9ISXBRSzABNxhdgMZw/6Mvr/NKKhNJg=; b=f7McZPqhKqMoo7xkpEMQvO4k+kl
	H60qdw7XHvxLnebKCPhT9/G222lDwJhvRQKTLslZ5b5Jxf1TO5hgTHcYYGzWjRTi
	4GK82cLEHiHsNYkgGyM0tnlPwLUs/J04IWyPC49aTgWVFHtu8S1/O8mpUTw+fAjZ
	oBkHTpch5/NKyg2EMOhwmOYCmhZzHs/3QYvM4S4Snyj/DfqmQL3Cz1iSlcTgVwiq
	KjeROZfn7E5zaOSRiL+A8WMWv62Oez349ikYW2/ozhndkTjhsqfZ66lqcCpK8BBy
	7OsLg0kqeMk+vh0T3mJqV0EuWCfLoMYNwHXeKkqVF0A2n4f8ktX+PrMQM5w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f88s3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80FXF007882;
	Tue, 20 Jan 2026 08:00:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80H7s008018;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80HsI008014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D64C3255BA; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 20/27] RISC-V: KVM: Redirect nested WFI and WRS traps
Date: Tue, 20 Jan 2026 13:30:06 +0530
Message-ID: <20260120080013.2153519-21-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX4rqYEaBmBokw
 ISbTz1Lt5NvpfoOpasHR9mBkKYZxpTrfiIUy6Lrf8B5pPOGpc7AiXiCRVN2u2OsYway3vHigxAU
 6djDeim8HrOGJYppJR4IWf0h++7JBzD/6fU0q42ZYvDW+kUSj2BY0bZu8KDNOMek+VcApKbQS3Y
 Udwl5c9g9LkqfYzxWcrTCI38w1o3mL+1JCs3kVoNwEWBNuBdQjaDDSAQGC5Gojkri3BydGT55pf
 OcUJmiYQfsgC7bzcS9G6ERKCXYO2Aqd2gRLsqS146zsUkXiMGdCLJs/PXnWhGNt37xKliUBgm14
 +glLbQPYNPADlDiNrvfKz+oE+uYvSzBjnJUkou2FaRTWmk13GJItIOhrX69k3weptPVgVkyLWeg
 kyQ/R2Pdn8VeIaFJNgtyYJwlVh//UP0QdEebeEn4Acb4f0p88qRiuOYPkSz4DzhU2Rek3NV+Qay
 zRcXuxh6gTt0EqQUEyw==
X-Proofpoint-GUID: d8IJ7E8xQi7iPq3-DN5_WzGnVQS7vUMK
X-Proofpoint-ORIG-GUID: d8IJ7E8xQi7iPq3-DN5_WzGnVQS7vUMK
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UROabCUrXZ3gi7iQ-dkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080134_414381_69F3E187 
X-CRM114-Status: GOOD (  11.13  )
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

The WFI and WRS virtual instruction traps from Guest VS/VU-mode
(aka L2/nested guest) should be redirected to Guest HS-mode (aka
L1/guest hypervisor).

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu_insn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 745cd654df94..ebd0cfc1bf30 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -76,6 +76,20 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 
 static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
+	/*
+	 * Trap from virtual-VS/VU modes should be forwarded to
+	 * virtual-HS mode as a virtual instruction trap.
+	 */
+	if (kvm_riscv_vcpu_nested_virt(vcpu))
+		return KVM_INSN_VIRTUAL_TRAP;
+
+	/*
+	 * Trap from virtual-U mode should be forwarded to
+	 * virtual-HS mode as illegal instruction trap.
+	 */
+	if (!(vcpu->arch.guest_context.hstatus & HSTATUS_SPVP))
+		return KVM_INSN_ILLEGAL_TRAP;
+
 	vcpu->stat.wfi_exit_stat++;
 	kvm_riscv_vcpu_wfi(vcpu);
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
@@ -83,6 +97,20 @@ static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 
 static int wrs_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
+	/*
+	 * Trap from virtual-VS/VU modes should be forwarded to
+	 * virtual-HS mode as a virtual instruction trap.
+	 */
+	if (kvm_riscv_vcpu_nested_virt(vcpu))
+		return KVM_INSN_VIRTUAL_TRAP;
+
+	/*
+	 * Trap from virtual-U mode should be forwarded to
+	 * virtual-HS mode as illegal instruction trap.
+	 */
+	if (!(vcpu->arch.guest_context.hstatus & HSTATUS_SPVP))
+		return KVM_INSN_ILLEGAL_TRAP;
+
 	vcpu->stat.wrs_exit_stat++;
 	kvm_vcpu_on_spin(vcpu, vcpu->arch.guest_context.sstatus & SR_SPP);
 	return KVM_INSN_CONTINUE_NEXT_SEPC;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
