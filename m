Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34CD2ED0F
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QTViENeL8DB3YkQHzaLbLIcKVh3qMPO2GCWaCPYkEg=; b=kurzCdsteRrgd9
	fUV8FYfEm8CV9X0DzsvWOmGgweXZuIwxEvR7AAAuTNnUdNefolrcs0vFdDw+PoG5hl1baOJlvelBM
	ASAbUzdeSXE1+g3Q4qNSNUEkw+Nz3xY7AHnqsyWEA0qEzEN3jG5hM4KN4Ya7YOaH25bFWF2iTh8nG
	4BjAtbh060D+ID/jdIHzYkC/Iy6nOqkHMbjd048nSN67MxsieMT8WMwOnizIczCZ1wmMpQOMoyH9V
	KY2CFPxxsvgMowZZ4vWkarAbJZlNTXykZZ9/aNug1W1Fn1OXKxJFwcypfC6GXR4LY4KGvoPtpQjaD
	j7wKpMATbwYG4qjOge1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gE-00000003PGH-3K9E;
	Tue, 20 Jan 2026 08:01:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gC-00000003P8y-1QCK;
	Tue, 20 Jan 2026 08:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wRexMEpQkzqWKlM9nEAeBfg4ZM2Tv2hbPeIIaNjzgsc=; b=jyHrSrwoqC7odbT2LGUhQLwBRp
	bmyxI6WHnmq8luJHjplWgEoPFWFHdDKoJHnGFyrJZdD1yvLoO6tQA+nviFMF99RJcTxVplPP+1EQM
	bxzwpJWf+6kIr22NdpDFrCaRBO+vAb2qZxD6zlI6YcASgy6t5/xcwVdrEVyExUNQOpDT0/ZcFFhji
	d4/QGnSdu87mVNy3t49VbXx9m/NiLZCEt69B1wEjZFGxGh7n0NfoWqbW3sfuGx4UXN4NrxNOBWPUL
	oxPOfLDAlxiRlCluaGnkvSWdPDV/msTFjjYdqzf5yfk8UH9hU2yEq02RcvI28JU7tGI7PXjozTzXh
	EeaIve1A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6g8-0000000ETfu-10Ux;
	Tue, 20 Jan 2026 08:01:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K341Fd3808948;
	Tue, 20 Jan 2026 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wRexMEpQkzq
	WKlM9nEAeBfg4ZM2Tv2hbPeIIaNjzgsc=; b=E0aUWJXLgwmDX1/SzIYS02Lw4a8
	TLWyuc4nABRb7pIBjb1Yk4Hi8gluWKCztpcIXVb4wZc44FkiyneqZC1G5gnfhzSV
	MfcFBhZPWd+AbDtTRaqhXFU/jInLxwVvjXazyD+f75FTHW5XY5vUV5Lcr6LVu1aZ
	E/r+ifYdOnS0U94ZdK1LFts6b9a5CD7R2tbjznF9HZayY+1uNaFMwWrMq9OoDu27
	tgBczJhDQkGCu8MgWR4+x5uxiNElZ7YOyEGjJ3cyzEDFuV5Ju53mJiBNC4DjzGUn
	ZaI4tUqnp3diBIC21h1TUfyLZPqhjtO0lILyQTFnW548fQuena2nJQGuISw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f88s3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80FK3007860;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80FQO007831;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80FkG007824
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 98EB922C26; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 02/27] RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
Date: Tue, 20 Jan 2026 13:29:48 +0530
Message-ID: <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfXxEKujc5OFdDq
 FVH6jhav7K0hEWytF9jITbTJza+fKkqdBVf/awY0OAphcVsoR7oEcZYSnj3s2cwJeqJwhv5Y0b0
 2bjunb4VPeEol7kYerJ9lbO2h5tr514Zt/B06u87EbZiojb6geY2Objn7Ks9ZfxbuPqMM2oy38W
 GVucTc8GN8l/4sdthL1nzpmM73cxHgOe6J6pfgOMiLvKcJ7+s6IYhaNk3WEsh9eVVx+DPp+RGlH
 BIO7ye2y6fXaMnZcscR5OCDFCUtI3XBH8WhZzVr0BqhFZUhefuPPBRqZNWnJkuOoFj8dDREVT92
 IEyGfVAcDaI5Upih6v4+I2A8eziBkZAigh+MDIFKuCEQamWa+zDDiqmpF6U8q8ny9oSUv+XFZB+
 En/qfSr81NOq29CNzt1VxlCNY5flqCTrms+kWo64C1wXjO1nJ+ZvEFvczq5UN8/Urfim2QdmbJK
 AByYS9ZYZCZERgCDeYA==
X-Proofpoint-GUID: XO-LWzVym6x4vct65yqZWddQUdLfyh-6
X-Proofpoint-ORIG-GUID: XO-LWzVym6x4vct65yqZWddQUdLfyh-6
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f3612 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=_CP9wF37UZ2j3KDzhjgA:9
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
X-CRM114-CacheID: sfid-20260120_080132_642340_265538B9 
X-CRM114-Status: UNSURE (   9.95  )
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

Return -ENOENT for Ssaia ONE_REG when Ssaia is not enabled
for a VCPU.

This will make Ssaia ONE_REG error codes consistent with
other ONE_REG interfaces of KVM RISC-V.

Fixes: 2a88f38cd58d ("RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kvm/aia.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad318185660..31baea9f0589 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -183,6 +183,8 @@ int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
+	if (!riscv_isa_extension_available(vcpu->arch.isa, SSAIA))
+		return -ENOENT;
 	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
 		return -ENOENT;
 
@@ -199,6 +201,8 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
+	if (!riscv_isa_extension_available(vcpu->arch.isa, SSAIA))
+		return -ENOENT;
 	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
 		return -ENOENT;
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
